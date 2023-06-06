{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  plugins = with pkgs.vimPlugins; [
    # lsp
    vim-nix
    nvim-lspconfig
    
    # Syntax highlighting
    nvim-treesitter.withAllGrammars

    # status bar
    feline-nvim
    # Auto close
    nvim-autopairs
    # Fuzzy finder window
    telescope-nvim
    # Diagnostics window
    trouble-nvim
    # Better native input/select windows
    dressing-nvim
    # Tabs
    bufferline-nvim
    # Smooth scrolling
    vim-smoothie

    # ui
    noice-nvim

    # colorschemes
    oxocarbon-nvim

    which-key-nvim
  ];

  extraPackages = with pkgs; [
    # nix
    nil
    nixpkgs-fmt
    statix
    # lua
    lua-language-server
  ];
}
