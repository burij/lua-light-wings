local core = require "modules.lua-light-wings" core.globalize(core)
local test = require "modules.tests"
local conf = require "conf"

conf.version = "Lua Light Wings, Version 0.3-dev"
-- main was made more universal/portable
-- tests moved to modules
-- default.nix improoved
-- integration of the need tool to core
-- TODO new functions in extra
-- TODO update readme
-- TODO update rockspecs

_G.debug_mode = conf.debug_mode or true

if debug_mode then test.prestart(conf) end