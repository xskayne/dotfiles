{
  programs = {
    # enable direnv (for managing environment variables per directory)
    direnv = {
      # enable direnv
      enable = true;

      # enable nix-direnv for Nix integration
      nix-direnv.enable = true;

      # enable Zsh integration for direnv
      enableZshIntegration = true;
    };

    # enable Zsh shell with additional features
    zsh = {
      # enable Zsh shell
      enable = true;

      # enable command completion in Zsh
      enableCompletion = true;

      # enable syntax highlighting in Zsh
      syntaxHighlighting.enable = true;
    };
  };
}
