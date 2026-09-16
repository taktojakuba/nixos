{ config, lib, pkgs, ... }:

{
	imports = [
		/etc/nixos/hardware-configuration.nix
	];


	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	networking.hostName = "nixxerbook";
	networking.networkmanager.enable = true;
	time.timeZone = "Europe/Warsaw";
	services.xserver = {
		enable = false;
    displayManager.lightdm.enable = false;
	};
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	services.libinput.enable = true;

	users.users.kuba = {
		isNormalUser = true;
		extraGroups = [ "wheel" "seat" "networkmanager" ];
		shell = pkgs.zsh;
		packages = with pkgs; [
			tree
		];
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		vteIntegration = true;
	};

	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
		config.common.default = [ "gtk" "wlr" ];
	};
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
	fonts.packages = with pkgs; [
		(nerd-fonts.jetbrains-mono)
		nerd-fonts.fira-code
		cascadia-code
		fira-code
		jetbrains-mono
		dejavu_fonts
		liberation_ttf
		cantarell-fonts
		noto-fonts
		adwaita-fonts
	];
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd /home/kuba/dwl/scripts/launch.sh";
			user = "greeter";
    			};
  		};
	};
	environment.systemPackages = with pkgs; [
		qutebrowser
    vim
		wget
    wbg
		neovim
		foot
		btop
		git
		fastfetch
		ripgrep
    matugen
		fd
		tree-sitter
    bluetuith
		stylua
		prettier
		clang-tools
		lua-language-server
		pyright
		ruff
		marksman
		yaml-language-server
		gcc
		clang
		binutils
		gdb
		cmake
		ninja
		gnumake
		autoconf
    brightnessctl
		automake
		pkg-config
		zig
    jdk
		rustc
		cargo
		go
		nodejs
		python3
		gh
		just
		jq
		yq
		rsync
		unzip
		zip
		p7zip
		zsh
		starship
		tmux
		yazi
		mako
		rofi
		wl-clipboard
		wl-clip-persist
		cliphist
		grim
		slurp
		wf-recorder
		wlr-randr
		playerctl
		libnotify
		ironbar
		wayland
		wayland-protocols
		wlroots
		libinput
		libxkbcommon
		pixman
		libdrm
		libxcb
		xwayland
		xkbcomp
		meson
	];

	services.openssh.enable = true;
	system.stateVersion = "26.05";
}

