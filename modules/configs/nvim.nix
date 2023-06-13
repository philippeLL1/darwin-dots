{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  plugins = with pkgs.vimPlugins; [

    # LSP
    vim-nix
    nvim-lspconfig
    typescript-nvim
    
    # Completion
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    luasnip
    cmp_luasnip

    # Motions
    lightspeed-nvim

    # Syntax highlighting
    nvim-treesitter.withAllGrammars

    # Mappings
    which-key-nvim

    # Status bar
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
    dressing-nvim

    # Sessions 
    auto-session

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
    zenburn

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
