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

  # Start docker on demand via its socket instead of at boot.
  # Minikube is a package only (no daemon), so nothing to disable there.
  systemd.services.docker.wantedBy = lib.mkForce [ ];

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    helm
    kubectl
    minikube
  ];
}
