{
  virtualisation.docker = {
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true; # Sets DOCKER_HOST for normal users
    };
  };
}