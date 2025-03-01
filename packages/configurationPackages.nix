{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    vim
    wget
    git
  ];
  users.users.devansh.packages = with pkgs; [];
}
