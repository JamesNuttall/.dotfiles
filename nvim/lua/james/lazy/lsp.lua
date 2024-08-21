return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'prettier/vim-prettier',
  },

  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'intelephense', 'tsserver', 'volar', 'emmet_ls', 'clangd', 'pyright', 'tailwindcss' },

      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
        ["lua_ls"] = function()
          local lspconfig = require('lspconfig')
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          })
        end,
        ['tailwindcss'] = function()
          local lspconfig = require('lspconfig')
          lspconfig.tailwindcss.setup({
            filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'twig' },
          })
        end,
      }
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Insert }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' }
      }),
    })

    vim.diagnostic.config({
      update_in_insert = true,
    })

    vim.cmd([[
      let g:prettier#autoformat_require_pragma = 0
      let g:prettier#autoformat_config_present = 1
      let g:prettier#exec_cmd_async = 1
      augroup Prettier
        autocmd!
        autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md,*.vue,*.php,*.twig PrettierAsync
      augroup END
    ]])
  end,
}
