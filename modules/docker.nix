{ config, lib, pkgs, ... }:

{
	services.docker = {
		enable = true;
	};

	environment.systemPackages = with pkgs; [
		docker
		docker-compose
		minikube
		kubectl
		helm
	];
}