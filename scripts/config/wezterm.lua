local wezterm = require 'wezterm';
return {

  default_prog = {"cmd.exe","/K c:/tools/start-ssh-agent.cmd"},
  initial_cols = 120,
  initial_rows = 40,

  set_environment_variables = {
    prompt = "$E[31m$T $E[35m$P$G$E[0m "
  },

  keys = {
    {key="-", mods="CTRL", action="DecreaseFontSize"},
    {key="+", mods="CTRL", action="IncreaseFontSize"},
    {key="0", mods="CTRL", action="ResetFontSize"},
    {key="PageUp", mods="SHIFT", action=wezterm.action{ScrollByPage=-1}},
    {key="PageDown", mods="SHIFT", action=wezterm.action{ScrollByPage=1}}
  },

  mouse_bindings = {
    {
      event={Down={streak=1, button="Right"}},
      mods="NONE",
      action="Paste"
    }
  },

  font_size = 20.0,
  scrollback_lines = 10000,
  enable_scroll_bar = true,
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 500,

  colors = {
    cursor_bg = "yellow",
    cursor_border = "yellow",
    scrollbar_thumb = "#DDDDDD"
  },

  window_padding = {
    left = 8,
    right = 32,
    top = 0,
    bottom = 8,
  },

}

