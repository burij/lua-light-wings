print(
[[

debug mode is on.
to run in production mode comment out or remove dofile("tests.lua") from main]]
)
--------------------------------------------------------------------------------
core = require( "modules.llw-core" )
core.msg("llw-core succefully loaded localy")
msg("llw-core succefully loaded globaly")
msg("lua documention: https://lua-docs.vercel.app")
local lib = require( "modules.llw-extended-lib" )
local lib_success = "extended lib loaded"
local lib_failure = "extended lib failed to load"
msg(
    lib.pick(true, lib_success, lib_failure)
)