local core = require "modules.lua-light-wings" core.globalize(core)
local test = require "modules.tests"
local conf = require "conf"

conf.version = "Lua Light Wings, Version 0.3.1"
-- fixed README
-- fixed typo in extra

_G.debug_mode = conf.debug_mode or true

if debug_mode then test.prestart(conf) end