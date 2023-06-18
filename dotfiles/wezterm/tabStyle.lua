local wezterm = require 'wezterm'

-- The filled in variant of the < symbol
local LEFT_SYMBOL = wezterm.nerdfonts.ple_left_half_circle_thick

-- The filled in variant of the > symbol
local RIGHT_SYMBOL = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end
 
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background ='rgba(0,0,0,0)'
    local background = '#A98165'
    local foreground = '#E4DEC8'

    if tab.is_active then
      background = '#F2D0A4'
      foreground = '#222222'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = LEFT_SYMBOL },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = RIGHT_SYMBOL .. ' ' },
    }
  end
)

return {}

