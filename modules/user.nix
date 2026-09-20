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

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		vteIntegration = true;
	};
}