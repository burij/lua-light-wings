package.path = "./pkgs/share/lua/5.4/?.lua;" .. package.path
package.path = "./share/lua/5.4/?/init.lua;" .. package.path
package.cpath = "./pkgs/lib/lua/5.4/?.so;" .. package.cpath

local core = require("modules.llw-core")
core.globalize(core)
dofile("app.lua")

dofile("tests.lua")
