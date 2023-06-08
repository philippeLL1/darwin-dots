{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  plugins = with pkgs.vimPlugins; [

    # lsp
    vim-nix
    nvim-lspconfig
    typescript-nvim
    
    # completion
    coq_nvim
    coq-artifacts

    # Syntax highlighting
    nvim-treesitter.withAllGrammars

    # mappings
    which-key-nvim

    # status bar
    lualine-nvim

    # Auto close
    nvim-autopairs

    # Fuzzy finder 
    telescope-nvim
    telescope-symbols-nvim

    # Diagnostics window
    trouble-nvim

    # Tabs
    bufferline-nvim

    # ui
    nui-nvim
    nvim-notify
    noice-nvim
    nvim-web-devicons

    # better scrolling
    neoscroll-nvim

    # markdown reader/renderer
    glow-nvim

    # colorschemes
    oxocarbon-nvim
    kanagawa-nvim
    catppuccin-nvim
    gruvbox-nvim
    material-nvim
    melange-nvim
    monokai-pro-nvim

  ];

  extraPackages = with pkgs; [
    # nix
    nil
    nixpkgs-fmt
    statix
    # lua
    lua-language-server
    # rust
    rust-analyzer
  ];
}
