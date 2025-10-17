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

    local function output(input)
        output = input
        return output
    end

    local a = 1
    local b = 2
    local c = 3

    local result = case(
        {true, "ok: 1 case, cond = boolean, act = string"}
    ) msg(result)

    local result = case(
        {a < b, "ok: 1 case, cond = expression, act = string"}
    ) msg(result)

    local result = case{a < b, "ok: 1 case, no ()"}
     msg(result)

     local result = case (
        {true, output("ok: 1 case, cond = boolean, act = call")}
    ) msg(result)

    local result = case(
        {true, "ok: 2 cases, cond = boolean, act = string, 1st true"},
        {false, output("you shouldn't see this")}
    ) msg(result)

    local result = case(
        {a < b, output("ok: 1 case, cond = expression, act = call")}
    ) msg(result)



end


return M