{ ... }:

{
  programs.zsh = {
    enable = true; # Enable Zsh as your default shell

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # Or choose another theme like "agnoster", "powerlevel10k/powerlevel10k" etc.
      plugins = [
        "git" # Git aliases and functions
        "fzf" # For enhanced history and file search (requires fzf package)
      ];
    };

    initContent = ''
      if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi

      eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"
    '';
  };

  xdg.enable = true;

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };
}
