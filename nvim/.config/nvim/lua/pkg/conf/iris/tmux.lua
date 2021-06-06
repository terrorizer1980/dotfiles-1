return function (pal)
  local template = [[{
    \"base\": [\"%s\", \"%s\"],
    \"left\": [\"%s\", \"%s\"],
    \"right\": [\"%s\", \"%s\"],
    \"message\": [\"%s\", \"%s\"],
    \"inactive\": [\"%s\", \"%s\"],
    \"active\": [\"%s\", \"%s\"]
  }]]

  local arg = string.format(
    template,

    pal.base06,  -- base_fg
    pal.base01,  -- base_bg

    pal.base01,  -- left_fg
    pal.blue,    -- left_bg

    pal.base01,  -- right_fg
    pal.base05,  -- right_bg

    pal.base00,  -- message_fg
    pal.magenta, -- message_bg

    pal.base06,  -- inactive_fg
    pal.base01,  -- inactive_bg

    pal.base06,  -- active_fg
    pal.base00   -- active_bg
  )

  local cmd = string.format('tmux-theme "%1s"', arg)

  local job = vim.loop.new_async(vim.schedule_wrap(function ()
    vim.fn.system(cmd)
  end))

  job:send()
end
