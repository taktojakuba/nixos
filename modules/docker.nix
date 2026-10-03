{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    helm
    kubectl
    minikube
  ];
}
