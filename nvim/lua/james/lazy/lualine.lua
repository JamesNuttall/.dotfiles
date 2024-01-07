local lsp = function()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        globalstatus = true
      },
      sections = {
        lualine_b = {'filename'},
        lualine_c = {'diagnostics'},
        lualine_x = {'location', { lsp }},
        lualine_y = {'branch', 'diff'},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_z = {},
      }
    })
  end
}
