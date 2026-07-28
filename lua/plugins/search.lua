-- plugins/search.lua — Search plugin registrations
return {
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<leader>ff", desc = "Find files" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fr", desc = "Recent files" },
      { "<C-S-P>", mode = { "n", "i", "v" }, desc = "Show all keybinds" },
      { "<C-S-p>", mode = { "n", "i", "v" }, desc = "Show all keybinds" },
      { "<C-p>", mode = { "n" }, desc = "Show all keybinds" },
      { "<C-P>", mode = { "n" }, desc = "Show all keybinds" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    config = function()
      require("features.search").setup()
      require("keymaps.search")
    end,
  },
}
