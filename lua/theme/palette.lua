-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/palette.lua — Custom color palette                           ║
-- ║                                                                      ║
-- ║  Purpose: Single source of truth for all colors in the config.       ║
-- ║  Every module that needs a color imports from here.                  ║
-- ║  Never hardcode hex values elsewhere.                                ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

return {
  -- Primary foreground colors
  red = "#fe605e",
  green = "#8daf62",
  blue = "#85afd6",
  orange = "#fbb065",
  white = "#bebfb8",
  brown = "#977c48",
  purple = "#a983ac",

  -- Background hierarchy (darkest → lightest)
  bg = "#000000", -- Primary background
  bg2 = "#000000", -- Secondary background
  bg3 = "#2b2620", -- Elevated surfaces (floating windows, popups)
  bg4 = "#313131", -- Active/selected items
  bg5 = "#383430", -- Borders, separators

  -- Accent colors
  quartz = "#cfcfc6", -- Bright foreground (titles, emphasis)
  orangebg = "#d19a66", -- Warm accent

  -- Derived semantic colors (mapped from primary palette)
  error = "#fe605e", -- = red
  warn = "#fbb065", -- = orange
  info = "#85afd6", -- = blue
  hint = "#8daf62", -- = green
  added = "#8daf62", -- = green
  changed = "#fbb065", -- = orange
  removed = "#fe605e", -- = red

  -- Dimmed variants (for subtle UI elements)
  comment = "#6a6a5e",
  line_nr = "#4a4a40",
  selection = "#2b2620", -- = bg3
  match = "#977c48", -- = brown (search matches)

  -- UI-specific
  cursor_line = "#0a0a08",
  visual = "#1e1c18",
  border = "#b0b0b0", -- Soft silver-white for all floating borders
  float_bg = "#0a0a08",
  statusline_bg = "#0a0a08",

  -- Special
  none = "NONE",
}
