{ pkgs, ... }:
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
      softtabstop = 2;
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
      cmdheight = 0;
    };

    globals.mapleader = " ";

    diagnostic.settings = {
      virtual_text = {
        prefix = "●";
        spacing = 2;
      };
      signs = true;
      underline = true;
      severity_sort = true;
      update_in_insert = false;
      float = {
        border = "rounded";
        source = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<cr>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<cr>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>wq";
        action = "<cmd>wq<cr>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-a>";
        action = "ggVG";
        options = {
          noremap = true;
        };
      }
      {
        mode = "n";
        key = "<C-b>";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cd";
        action.__raw = ''
          function()
            local dir = vim.fn.expand("%:p:h")
            vim.cmd.cd(dir)
            require("nvim-tree.api").tree.open({ path = dir })
          end
        '';
        options = {
          silent = true;
          desc = "cd to file's dir and open tree";
        };
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
      {
        mode = [
          "n"
          "i"
          "v"
        ];
        key = "<C-Up>";
        action.__raw = "function() require('neoscroll').scroll(-0.5, { duration = 200 }) end";
        options = {
          silent = true;
        };
      }
      {
        mode = [
          "n"
          "i"
          "v"
        ];
        key = "<C-Down>";
        action.__raw = "function() require('neoscroll').scroll(0.5, { duration = 200 }) end";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]h";
        action.__raw = "require('gitsigns').next_hunk";
        options = {
          silent = true;
          desc = "Next git hunk";
        };
      }
      {
        mode = "n";
        key = "[h";
        action.__raw = "require('gitsigns').prev_hunk";
        options = {
          silent = true;
          desc = "Prev git hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>hd";
        action.__raw = "require('gitsigns').diffthis";
        options = {
          silent = true;
          desc = "Diff this";
        };
      }
      {
        mode = "n";
        key = "<leader>hb";
        action.__raw = "function() require('gitsigns').blame_line({ full = true }) end";
        options = {
          silent = true;
          desc = "Blame line";
        };
      }
      {
        mode = "n";
        key = "<leader>hp";
        action.__raw = "require('gitsigns').preview_hunk_inline";
        options = {
          silent = true;
          desc = "Preview hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>hs";
        action.__raw = "require('gitsigns').stage_hunk";
        options = {
          silent = true;
          desc = "Stage hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>hr";
        action.__raw = "require('gitsigns').reset_hunk";
        options = {
          silent = true;
          desc = "Reset hunk";
        };
      }
      {
        mode = "v";
        key = "<leader>hs";
        action.__raw = "function() require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end";
        options = {
          silent = true;
          desc = "Stage hunk";
        };
      }
      {
        mode = "v";
        key = "<leader>hr";
        action.__raw = "function() require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end";
        options = {
          silent = true;
          desc = "Reset hunk";
        };
      }
    ];

    plugins = {
      web-devicons.enable = true;

      blink-cmp = {
        enable = true;
        setupLspCapabilities = true;
        settings = {
          keymap = {
            preset = "none";
            "<C-space>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<C-e>" = [ "hide" ];
            "<C-y>" = [ "select_and_accept" ];
            "<CR>" = [
              "select_and_accept"
              "fallback"
            ];
            "<C-p>" = [
              "select_prev"
              "fallback"
            ];
            "<C-n>" = [
              "select_next"
              "fallback"
            ];
            "<C-b>" = [
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-f>" = [
              "scroll_documentation_down"
              "fallback"
            ];
            "<Tab>" = [
              "snippet_forward"
              "select_and_accept"
              "fallback"
            ];
            "<S-Tab>" = [
              "snippet_backward"
              "select_prev"
              "fallback"
            ];
          };
          appearance.nerd_font_variant = "mono";
          completion = {
            list.selection = {
              preselect = true;
              auto_insert = false;
            };
            menu.border = "rounded";
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
              window.border = "rounded";
            };
            ghost_text.enabled = true;
            accept.auto_brackets.enabled = true;
          };
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          signature = {
            enabled = true;
            window.border = "rounded";
          };
        };
      };
      friendly-snippets.enable = true;

      autoclose.enable = true;
      ts-autotag.enable = true;
      highlight-colors = {
        enable = true;
        settings = {
          render = "virtual";
          enable_tailwind = true;
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            vue = [ "prettier" ];
            svelte = [ "prettier" ];
            html = [ "prettier" ];
            css = [ "prettier" ];
            scss = [ "prettier" ];
            less = [ "prettier" ];
            json = [ "prettier" ];
            jsonc = [ "prettier" ];
            yaml = [ "prettier" ];
            markdown = [ "prettier" ];
            python = [ "ruff_format" ];
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            cuda = [ "clang-format" ];
          };
          default_format_opts = {
            lsp_format = "fallback";
          };
          format_on_save = {
            timeout_ms = 2000;
            lsp_format = "fallback";
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt.python = [ "ruff" ];
      };

      gitsigns.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          lspBuf = {
            "gd" = "definition";
            "gr" = "references";
            "gi" = "implementation";
            "K" = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            "F" = "format";
          };
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>d" = "open_float";
          };
          extra = [
            {
              key = "<leader>ih";
              action.__raw = ''
                function()
                  local enabled = vim.lsp.inlay_hint.is_enabled()
                  vim.lsp.inlay_hint.enable(not enabled)
                end
              '';
              options = {
                desc = "Toggle inlay hints";
              };
            }
          ];
        };
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
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          eslint.enable = true;
          emmet_language_server.enable = true;
          tailwindcss = {
            enable = true;
            settings = {
              tailwindCSS = {
                experimental.classRegex = [
                  [
                    "(?:cva|cn|clsx)\\(([^)]*)\\)"
                    "[\"'`]([^\"'`]*).*?[\"'`]"
                  ]
                ];
              };
            };
          };
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<C-f>" = {
            action = "live_grep";
            options = {
              desc = "Telescope live grep";
            };
          };
          "<C-g>" = {
            action = "find_files";
            options = {
              desc = "Telescope find files";
            };
          };
        };
        extensions = {
          ui-select.enable = true;
          project.enable = true;
        };
      };
      project-nvim.enable = true;

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      nvim-tree.enable = true;
      lualine = {
        enable = true;
        settings.options.theme = "auto";
      };

      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              "                                                                       "
              "  ██████   █████                   █████   █████  ███                  "
              " ░░██████ ░░███                   ░░███   ░░███  ░░░                   "
              "  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   "
              "  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  "
              "  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  "
              "  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  "
              "  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ "
              " ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  "
              "                                                                       "
            ];
            center = [
              {
                icon = " ";
                desc = "New File";
                group = "Label";
                key = "n";
                action = "ene | startinsert";
              }
              {
                icon = " ";
                desc = "Recent Files";
                group = "Label";
                key = "r";
                action = "Telescope oldfiles";
              }
              {
                icon = " ";
                desc = "Open Project";
                group = "Label";
                key = "p";
                action = "Telescope project";
              }
            ];
            footer = [ "" ];
            vertical_center = true;
          };
        };
      };

      smear-cursor = {
        enable = true;
        settings = {
          cursor_color = null;
          smear_between_buffers = true;
          smear_between_windows = true;
          smear_insert_mode = true;
          smear_terminal_mode = true;
          legacy_computing_symmetry_mode = false;
          distance_scayle_method = "linear";
          stiffness = 0.8;
          trailing_stiffness = 0.5;
          trailing_exponent = 0.1;
          ghost_exponent = 0.1;
          never_update_overlapping = false;
          max_kept_history = 0;
          filetypes_disabled = [ ];
          hide_target_hack = true;
          gamma = 1;
        };
      };

      neoscroll = {
        enable = true;
        settings = {
          mappings = [
            "<C-u>"
            "<C-d>"
            "<C-y>"
            "<C-e>"
            "zt"
            "zz"
            "zb"
            "G"
            "gg"
          ];
          hide_cursor = true;
          cursor_scrolls_alone = true;
          performance_mode = false;
        };
      };

      cord = {
        enable = true;
        settings.display = {
          theme = "classic";
          flavor = "accent";
        };
      };

      which-key.enable = true;
    };

    extraPackages = with pkgs; [
      stylua
      prettier
      ruff
      clang-tools
    ];
  };
}
