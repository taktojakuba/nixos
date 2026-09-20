{ config, lib, pkgs, ... }:

{
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	services.libinput.enable = true;
	services.power-profiles-daemon.enable = true;

	# Games disk (nvme0n1, formatted as ext4, labeled "games")
	fileSystems."/games" =
		{ device = "/dev/disk/by-label/games";
			fsType = "ext4";
			options = [ "rw" "relatime" ];
		};

	# Second games disk (sda, ext4, labeled "ssdgames")
	fileSystems."/ssd" =
		{ device = "/dev/disk/by-label/ssdgames";
			fsType = "ext4";
			options = [ "rw" "relatime" ];
		};

	# Make the game disks writable by the user kuba
	systemd.tmpfiles.rules = [
		"d /games 0755 kuba users - -"
		"d /ssd 0755 kuba users - -"
	];
}