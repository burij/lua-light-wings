local M = {}

function M.case(...)
    -- returns first passed value, aslong it is not a table with boolean or
    -- expression, which evaluates to boolean as 1st item.
    -- in that case 2nd item of that table will be return, if 1st item == true
    -- functions are returned as calls
    -- this function can be used as replacement for if-constructs
    local n = select('#', ...)
    local x = select(1, ...)

    for i = 1, n do
        local x = select(i, ...)
        if type(x) == "function" then
            return x()
        end
        if type(x) ~= "table" or type(x[1]) ~= "boolean" then
            return x
        end
        if type(x) == "table" then
            if x[1] == true then
                if type(x[2]) == "function" then
                    return x[2]()
                end
                if not x[2] then return x[1] end
                return x[2]
            end
        end
    end
end


return M