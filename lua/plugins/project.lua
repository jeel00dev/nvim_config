-- plugins/project.lua — Project & session plugin registrations
return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("features.project").setup()
    end,
  },
  {
    "olimorris/persisted.nvim",
    event = "VeryLazy",
    cmd = { "SessionLoad", "SessionSave", "SessionDelete" },
    config = function()
      require("features.sessions").setup()
    end,
  },
}
