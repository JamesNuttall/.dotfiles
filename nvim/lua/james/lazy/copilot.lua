return {
  --[[ {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      show_help = true,
      mappings = {
        complete = {
          insert = '',
        },
      },
      window = {
        layout = 'float',
        relative = 'editor',
        width = 0.8,
        height = 0.6,
        row = 1
      },
    },
    keys = {
      {
        "<M-Space>",
        function()
          local mode = vim.api.nvim_get_mode().mode
          local selection
          if mode == 'v' or mode == 'V' or mode == '' then
            selection = require("CopilotChat.select").visual
          else
            selection = require("CopilotChat.select").buffer
          end
          require("CopilotChat").toggle({ selection = selection })
        end,
        mode = { "n", "v" },
        noremap = true,
        silent = true,
      },
    },
  }, ]]
}
