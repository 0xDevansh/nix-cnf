{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    vim
    wget
    git
    vscode
    obsidian
    spotify
    jetbrains.webstorm
    inkscape
  ];
  users.users.devansh.packages = with pkgs; [];
}
