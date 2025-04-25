return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
  keys = {
    { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
    { "<leader>zc", ":CopilotChat<CR>", mode = "v", desc = "Chat with Copilot" },
    { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
  },
  -- See Commands section for default commands if you want to lazy load on them
}
