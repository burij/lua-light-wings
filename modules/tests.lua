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

function M.validate_pipe()

    local core = require("modules.lua-light-wings")
    local pipe = core.pipe

    pipe(
        1,
        function(x) return tostring(x + 1) end,
        function(x) msg("1. ok, if result is 2. result: " .. x) end
    )

    pipe(
        function(x) return tostring(3 + 3) end,
        function(x) msg("2. ok, if result is 6. result: " .. x) end
    )

    local function add(x)
        return x + 5
    end

    pipe(
        5,
        add,
        function(x) return msg("3. ok, if result is 10. result: " .. x) end
    )

    local result = pipe(
        function(x) return tostring(7 + 7) end
    ) msg("4. ok, if result is 14. result: " .. result)

    pipe(
        2 + 2,
        function(x) return tostring(x + 4) end,
        function(x) msg("5. ok, if result is 8. result: " .. x) end
    )

end

--------------------------------------------------------------------------------

return M