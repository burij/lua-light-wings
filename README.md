 # Lua Light Wings
Personal set of useful functions with beautiful syntax to extend Lua Language to my needs, based on [Meelua](https://github.com/burij/meelua).

## Quickstart

```
luarocks install lua-light-wings
```
or

```
git clone https://github.com/burij/lua-light-wings.git
cd lua-light-wings
```

## Modules
### lua-light-wings.lua --core module

```
msg(x)
-- console output, can handle tables
```

```
is_any(x)
is_function(x)
is_boolean(x)
is_number(x)
is_string(x)
is_table(x)
is_list(x)
is_dictionary(x)
is_path(x)
is_url(x)
is_email(x)
-- raises error, in case the variable is not of the right type
```

```
globalize(x)
-- loads content of a module to a global space
is_dictionary(x)
```

```
map(x, y)
-- calls function on every element of a table
is_table(x)
is_function(y)
```

```
filter(x, y)
-- filters table elements based on predicate function
is_table(x)
is_function(y)
```

```
reduce(x, y, var)
-- reduces table to single value using accumulator function
is_table(x)
is_function(y)
```

```
need(module, [module_name_on_luarocks / download_link], [autodownload])
-- Drop-in replacement for 'require' function. 
-- Extends path-variables to find lua-modules in more locations. Able to download modules via luarocks (if installed) or via wget/curl (due potential security reasons of this feature, it's disabled by default. Pass true as third argument to activate).
```

```
M.pipe(...)
-- passes previous evaluation to the next function as argument

Example usage:

    pipe(
        1,
        function(x) return tostring(x + 1) end,
        function(x) msg("1. ok, if result is 2. result: " .. x) end
    )

    pipe(
        function(x) return tostring(3 + 3) end,
        function(x) msg("2. ok, if result is 6. result: " .. x) end
    )

```

```
function M.case(...)
    -- returns first passed value, aslong it is not a table with boolean or expression, which evaluates to boolean as 1st item. In that case 2nd item of that table will be returned, if 1st item == true, functions are returned as calls

Example usage:

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

```


### lua-light-wings-extra.lua
Unsorted collection of helper functions, will not be documented, read the code to use.


# License
This project is licensed under the MIT License. See the LICENSE file for more details.
