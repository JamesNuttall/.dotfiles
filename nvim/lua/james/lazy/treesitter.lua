return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {'html', 'javascript', 'typescript', 'lua', 'php', 'python', 'cpp', 'json', 'twig', 'vue'},
      sync_install = true,
      auto_install = true,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })
  end
}
