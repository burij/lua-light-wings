local core = require "modules.lua-light-wings" core.globalize(core)
local test = require "modules.tests"
local conf = require "conf"

conf.version = "Lua Light Wings, Version 0.3.0"
-- main was made more universal/portable
-- integration of the need tool to core
-- new functions in extra
-- tests moved to modules
-- default.nix improoved
-- updated readme

_G.debug_mode = conf.debug_mode or true

if debug_mode then test.prestart(conf) end