{ ... }:

{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true; # Sets DOCKER_HOST for normal users
    };
  };
}
