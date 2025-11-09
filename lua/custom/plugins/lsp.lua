return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup({
				ui = {
					border = 'rounded',
					icons = {
						package_installed = '✓',
						package_pending = '➜',
						package_uninstalled = '✗',
					},
				},
			})
		end,
	},

	-- Add to mason.nvim dependencies in lsp.lua
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		config = function()
			require('mason-tool-installer').setup({
				ensure_installed = {
					'stylua', -- Lua formatter
					'black', -- Python formatter
					'isort', -- Python import sorter
					'prettier', -- JS/TS/JSON formatter
					'rustfmt', -- Rust formatter
				},
			})
		end,
	},

	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			local available = mason_lspconfig.get_available_servers()
			local tsserver_name = vim.tbl_contains(available, 'tsserver') and 'tsserver' or 'ts_ls'
			local servers = {
				'lua_ls', -- Lua
				tsserver_name, -- TypeScript/JavaScript
				'pyright', -- Python
				'rust_analyzer', -- Rust
			}

			mason_lspconfig.setup({
				ensure_installed = servers,
				automatic_enable = false,
			})

			local server_settings = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { 'vim' } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
			}

			for _, server in ipairs(servers) do
				if server_settings[server] then
					vim.lsp.config(server, server_settings[server])
				end
				vim.lsp.enable(server)
			end
		end,
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = { 'williamboman/mason-lspconfig.nvim' },
		config = function()
			-- LSP keybindings (only active when LSP attaches)
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					map('K', vim.lsp.buf.hover, 'Hover Documentation')
					map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
					map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				end,
			})
		end,
	},
}
