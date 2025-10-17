return {
  "numToStr/Comment.nvim",
  event = {"BufReadPre","BufNewFile"},
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    --import comment plugin safely
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    
    -- local ft = require("Comment.ft")


    comment.setup({
      --for commenting tsc,jsx,scelete , html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
