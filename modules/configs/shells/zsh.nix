{ pkgs, ... }:
{

  enable = true;

  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
  autocd = true;
  dotDir = ".config/zsh";


  prezto = {
    enable = true;

    pmodules =
      [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "prompt"
      ];
    editor = {
      keymap = "vi";
      dotExpansion = true;
    };
    syntaxHighlighting = {
      highlighters =
        [
          "main"
          "brackets"
          "pattern"
          "line"
          "cursor"
          "root"
        ];
    };
  };

  initExtra = '' 
                source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
                eval "$(starship init zsh)" 
                eval "$(zoxide init zsh)"
                '';


  # zsh-specific variables
  localVariables = {
    FZF_COMPLETION_TRIGGER = '' '';
    FZF_DEFAULT_COMMAND = "fd --hidden";
    WEZTERM_OPACITY = "1.0";
  };

  shellAliases = import ./aliases.nix;
}

