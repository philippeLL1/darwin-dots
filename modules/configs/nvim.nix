{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  plugins = with pkgs.vimPlugins; [

    # lsp
    vim-nix
    nvim-lspconfig
    
    # completion
    coq_nvim
    # Syntax highlighting
    nvim-treesitter.withAllGrammars

    # status bar
    lualine-nvim

    # Auto close
    nvim-autopairs

    # Fuzzy finder 
    telescope-nvim

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

    which-key-nvim
  ];

  extraPackages = with pkgs; [
    # nix
    nil
    nixpkgs-fmt
    statix
    # lua
    lua-language-server
    # typescript
    typescript-nvim
    # rust
    rust-analyzer
  ];
}
