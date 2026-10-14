{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      scrolloff = 8;
      cursorline = true;
      termguicolors = true;
      signcolumn = "yes";
      undofile = true;
      ignorecase = true;
      smartcase = true;
    };

    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":q<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
      }
    ];

    plugins = {
      treesitter.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      nvim-tree.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>f" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
        };
      };
      which-key.enable = true;
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          pyright.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
          clangd.enable = true;
          bashls.enable = true;
          yamlls.enable = true;
          marksman.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };
  };
}
