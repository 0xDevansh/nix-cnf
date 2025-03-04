{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --flake ~/nix-cnf#lenovo-nix";
    };
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "zsh-bat" "you-should-use" ];
      theme = "robbyrussell";
    };
  };

}
