local M = {}

function M.prestart(userconfig)
    print(
    [[
    debug mode is on.
    ............................................................................
    ]])
    local core = need "lua-light-wings"
    core.msg("lua-light-wings succefully loaded localy")
    msg("llw-core succefully loaded globaly")
    msg("lua documention: https://lua-docs.vercel.app")
    local inspect = need "inspect"
    print(
        inspect({
            "inspect succefully loaded via nix-pkgs"
        }))
    msg("prestart finished...")
    msg([[
    ............................................................................
    ]])

    M.case()

end

function M.case()
    print "testing case function"
    local result = case(
        {false, true},
        {false, function() print "das sollte erscheinen" end},
        function() return true end
    )
    print(result)
end


return M