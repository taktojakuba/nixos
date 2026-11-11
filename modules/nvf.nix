{pkgs, lib, ...}: {
	programs.nvf = {
		enable = true;
		settings.vim = {
			options = {
				tabstop = 4;
				shiftwidth = 4;
			};

			theme.enable = true;
			theme.name = "gruvbox";
			theme.style = "dark";

			dashboard.dashboard-nvim = {
				enable = true;
				setupOpts.config.header = [
					"██╗    ██╗███████╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗"
					"██║    ██║██╔════╝██╔════╝██╔══██╗██║   ██║██║████╗ ████║"
					"██║ █╗ ██║█████╗  █████╗  ██████╔╝██║   ██║██║██╔████╔██║"
					"██║███╗██║██╔══╝  ██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║"
					"╚███╔███╔╝███████╗███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
					" ╚══╝╚══╝ ╚══════╝╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
				];
			};

			statusline.lualine.enable = true;
			telescope.enable = true;
			autocomplete.nvim-cmp.enable = true;
			filetree.nvimTree.enable = true;
			filetree.nvimTree.openOnSetup = false;
			filetree.nvimTree.mappings.toggle = "<leader>b";

			clipboard = { enable = true; registers = "unnamedplus"; };

			binds.whichKey.enable = true;
			git.gitsigns.enable = true;
			autopairs.nvim-autopairs.enable = true;
			comments.comment-nvim.enable = true;

			tabline.nvimBufferline.enable = true;
			tabline.nvimBufferline.mappings = {
				cycleNext = "<C-q>";
				cyclePrevious = "<C-e>";
				closeCurrent = "<C-w>";
			};
			visuals.nvim-web-devicons.enable = true;
			visuals.indent-blankline.enable = true;

			terminal.toggleterm.enable = true;
			terminal.toggleterm.mappings.open = "<leader>t";

			languages = {
				enableTreesitter = true;
				enableExtraDiagnostics = true;
				nix.enable = true;
				python.enable = true;
				lua.enable = true;
                bash.enable = true;
                cmake.enable = true;
                docker.enable = true;
                env.enable = true;
                json.enable = true;
                json5.enable = true;
                just.enable = true;
                make.enable = true;
                markdown.enable = true;
                toml.enable = true;
                xml.enable = true;
                yaml.enable = true;
                angular.enable = true;
                css.enable = true;
                html.enable = true;
                php.enable = true;
                scss.enable = true;
                svelte.enable = true;
                tsx.enable = true;
                twig.enable = true;
                typescript.enable = true;
                vue.enable = true;
                rust.enable = true;
                java.enable = true;
                clang.enable = true;
			};
			keymaps = [
				{
					key = "<leader>cd";
					mode = "n";
					action = "<cmd>NvimTreeFocus<CR>";
					silent = true;
				}
				{
					key = "<C-a>";
					mode = "n";
					action = "ggVG";
				}
			];
		};
	};
}
