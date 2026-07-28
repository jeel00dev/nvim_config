-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/icons.lua — Centralized icon definitions                     ║
-- ║                                                                      ║
-- ║  Purpose: Every icon used in the config lives here.                  ║
-- ║  Nerd Font icons. Change these if switching icon sets.               ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

return {
  -- Diagnostics
  diagnostics = {
    error = " ",
    warn = " ",
    info = " ",
    hint = " ",
  },

  -- Git
  git = {
    branch = "",
    added = " ",
    modified = " ",
    removed = " ",
    renamed = " ",
    untracked = " ",
    ignored = " ",
    unstaged = "󰄱 ",
    staged = " ",
    conflict = " ",
  },

  -- File operations
  files = {
    file = " ",
    folder = " ",
    folder_open = " ",
    folder_empty = " ",
    new_file = " ",
    symlink = " ",
    modified = "● ",
    readonly = " ",
  },

  -- UI elements
  ui = {
    arrow_right = "",
    arrow_left = "",
    arrow_down = "",
    breadcrumb = " ",
    separator_left = "",
    separator_right = "",
    separator_thin_left = "",
    separator_thin_right = "",
    circle = "●",
    dot = "·",
    ellipsis = "…",
    pin = " ",
    close = " ",
    search = " ",
    gear = " ",
    lightning = " ",
    rocket = " ",
    star = " ",
    check = " ",
    fire = " ",
    bug = " ",
    code = " ",
    telescope = " ",
    terminal = " ",
    package = " ",
    lazy = "💤 ",
  },

  -- DAP / Debug
  dap = {
    breakpoint = " ",
    breakpoint_condition = " ",
    breakpoint_rejected = " ",
    log_point = " ",
    stopped = " ",
    pause = " ",
    play = " ",
    step_into = " ",
    step_over = " ",
    step_out = " ",
    step_back = " ",
    restart = " ",
    terminate = " ",
  },

  -- Completion kinds
  kinds = {
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
}
