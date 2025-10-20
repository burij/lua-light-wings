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

    -- custom test runs:
    M.validate_pipe()


end

--------------------------------------------------------------------------------


function M.case()
    print "testing case function"

    local function output(input)
        local result = input
        return result
    end

    local a = 1
    local b = 2
    local c = 3
    local x = require("lua-light-wings")

    local result = x.case(
        {true, "1. ok: 1 case, cond = boolean, act = string"}
    ) msg(result)

    local result = x.case(
        {a < b, "2. ok: 1 case, cond = expression, act = string"}
    ) msg(result)

    local result = x.case{a < b, "3. ok: 1 case, no ()"}
     msg(result)

     local result = x.case (
        {true, output("4. ok: 1 case, cond = boolean, act = call")}
    ) msg(result)

    local result = x.case(
        {true, "5. ok: 2 cases, cond = boolean, act = string, 1st true"},
        {false, "you shoudn't see this"}
    ) msg(result)

    local result = x.case(
        {a < b, output("6. ok: 1 case, cond = expression, act = call")}
    ) msg(result)

    local result = x.case(
        "7. ok: no cases, arg is a string"
    ) msg(result)

    local result = x.case(
        function() return "8. ok: no cases, arg is anonymus function" end
    ) msg(result)

    local result = x.case(
        {false, "you shoudn't see this"},
        {true, "9. ok: 2 cases, 2nd is a string"}
    ) msg(result)

    local result = x.case(
        {false, "you shoudn't see this"},
        {false, "you shoudn't see this"},
        "10. ok: 2 cases false, default case is a string"
    ) msg(result)

    local result = x.case(
        {"11. ok: table without condition"},
        {false, "you shoudn't see this"},
        "you shoudn't see this"
    ) msg(result)
end

--------------------------------------------------------------------------------

function M.pipe(...)
    local args = {...}
    local result, start_index

    if type(args[1]) == "function" then
        result = nil
        start_index = 1
    else
        result = args[1]
        start_index = 2
    end

    for i = start_index, #args do
        result = args[i](result)
    end
    return result
end

--------------------------------------------------------------------------------

function M.validate_pipe()
    local pipe = M.pipe

    pipe(1,
        function(x) return x + 1 end,
        function(x) print("1. ok, if " .. x .. " is 2") end
    )

    pipe(1,
        function(x) return x * 2 end,
        function(x) return x + 1 end,
        function(x) print("2. ok, if " .. x .. " is 3") end
    )

    pipe(
        function() return 5 end,
        function(x) return x * 2 end,
        function(x) print("3. ok, if " .. x .. " is 10") end
    )
end

--------------------------------------------------------------------------------

return M