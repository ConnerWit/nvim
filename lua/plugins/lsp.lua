-- lua/plugins/lsp.lua
-- Clean LSP setup optimized for COQ completion

return {
  -- Mason for LSP server management
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Automatic LSP server installation
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    -- Setup will be called from nvim-lspconfig block
  },



  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'ms-jpq/coq_nvim', -- References your existing COQ config
    },
    config = function()
      local lspconfig = require('lspconfig')
      local coq = require('coq')

      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Diagnostic symbols
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- LSP on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- LSP keymaps
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set({'n', 'v'}, '<leader>f', vim.lsp.buf.format, opts)
        
        -- Diagnostic keymaps
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
      end

      -- Ensure mason-lspconfig is available
      local mason_lspconfig = require('mason-lspconfig')
      
      -- Setup mason-lspconfig first
      mason_lspconfig.setup({
        automatic_installation = true,
      })

      -- Get installed servers and set them up
      local servers = mason_lspconfig.get_installed_servers()
      
      -- Setup each server
      for _, server_name in ipairs(servers) do
        if server_name == "lua_ls" then
          lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = {'vim'} },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          }))
        elseif server_name == "rust_analyzer" then
          lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = { command = "clippy" },
                procMacro = { enable = true },
              },
            },
          }))
        else
          -- Default setup for all other servers
          lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
          }))
        end
      end
      
      -- Also setup servers that get installed later
      local group = vim.api.nvim_create_augroup("MasonLspSetup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "MasonLspInstall",
        callback = function(args)
          local server_name = args.data
          if server_name and lspconfig[server_name] then
            lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
              on_attach = on_attach,
            }))
          end
        end,
      })

      -- Toggle diagnostics
      vim.keymap.set('n', '<leader>td', function()
        local current = vim.diagnostic.config().virtual_text
        vim.diagnostic.config({ virtual_text = not current })
      end, { desc = "Toggle Diagnostics" })
    end
  }
}

