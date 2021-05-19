execute 'set packpath+=' .. luaeval('require("ngs.packages").path()')
execute 'source ' .. luaeval('require("ngs.packages").file()')
