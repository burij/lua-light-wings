need = require "modules.need"
local core = need "lua-light-wings" core.globalize(core)
local conf = need "conf"
if conf.debug_mode then dofile("tests.lua") end
--------------------------------------------------------------------------------

local function application()

end

--------------------------------------------------------------------------------
application()
