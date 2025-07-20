{
  ...
}:
{
  xdg.enable = true;

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.initContent = ''
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.toml)"
  '';
}
