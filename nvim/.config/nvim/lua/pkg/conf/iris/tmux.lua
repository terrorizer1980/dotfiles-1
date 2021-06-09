return function(pal)
  local arg = require("iris").json(pal)
  local cmd = string.format('tmux-theme "%1s"', arg)

  local job = vim.loop.new_async(vim.schedule_wrap(function()
      print(vim.fn.system(cmd))
  end))

  job:send()
end
