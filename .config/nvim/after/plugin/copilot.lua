require("gp").setup({
  -- provider setup
  providers = {
    copilot = {
	  endpoint = "https://api.githubcopilot.com/chat/completions",
      secret = {
		"bash",
		"-c",
	    "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
	  },
    },
    -- configure later
    -- ollama = {
    --   endpoint = "https://ollama.com/api/v1/completions",
    -- }
  },

  -- agent setup
  agents = {
    {
      provider = "copilot",
      name = "ChatCopilot",
      chat = true,
      command = false,
      model = {
        model = "gpt-4o",
        temperature = 1.1,
        top_p = 1
      },
      system_prompt = "You are a general AI assistant."
          .. "The user provided the additional info about how they would like you to respond:\n\n"
          .. "- If you are unsure, say you are unsure.\n"
          .. "- Ask question if you need clarification to provide better answer.\n"
          .. "- Try to answer in short unless asked for detailed explanation. Do not waste user's time.\n" ,
    }
    -- configure later
    -- {
        -- provider = "ollama",
    -- }
  },

  -- chat window setup
  chat_user_prefix = "You:",
  chat_assistant_prefix = { "Copilot: ", "[{{agent}}]" },
  chat_template = require("gp.defaults").short_chat_template,
  toggle_target = "popup",
  style_popup_border = "rounded",
  style_popup_max_width = 100,
})

-- shortcuts
local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

-- ci --> chat init / cci --> chat copy init / cr --> chat respond / na --> next agent
vim.keymap.set({"n"}, "<leader>ci", "<cmd>GpChatToggle split<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set("v", "<leader>ci", ":GpChatToggle split<cr>", keymapOptions("Visual Toggle Chat"))
vim.keymap.set({"n"}, "<leader>ni", "<cmd>GpChatNew split<cr>", keymapOptions("Toggle New Chat"))
vim.keymap.set({"n"}, "<leader>cc", "<cmd>GpChatRespond<cr>", keymapOptions("Respond"))
vim.keymap.set({"n"}, "<leader>na", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))
