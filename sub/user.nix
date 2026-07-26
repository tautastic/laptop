{ pkgs, specialArgs, ... }:

{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    initialHashedPassword =  specialArgs.passwordHash;

    shell = pkgs.zsh;
  };

  users.users.root = {
    hashedPassword =  specialArgs.passwordHash;
  };

  security.sudo = {
    wheelNeedsPassword = true;
  };
}
