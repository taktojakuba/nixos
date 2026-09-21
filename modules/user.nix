{ config, lib, pkgs, ... }:

{
	users.users.kuba = {
		isNormalUser = true;
		extraGroups = [ "wheel" "seat" "networkmanager" "docker" ];
		shell = pkgs.zsh;
		packages = with pkgs; [
			tree
		];
	};

	security.polkit.extraConfig = ''
		polkit.addRule(function(action, subject) {
			if (
				subject.user == "kuba"
				&& (
					action.id == "org.freedesktop.login1.power-off"
					|| action.id == "org.freedesktop.login1.power-off-multiple-sessions"
					|| action.id == "org.freedesktop.login1.reboot"
					|| action.id == "org.freedesktop.login1.reboot-multiple-sessions"
					|| action.id == "org.freedesktop.login1.suspend"
					|| action.id == "org.freedesktop.login1.suspend-multiple-sessions"
					|| action.id == "org.freedesktop.login1.halt"
				)
			) {
				return polkit.Result.YES;
			}
		});
	'';

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		vteIntegration = true;
	};
}