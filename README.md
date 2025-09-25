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


### lua-light-wings-extra.lua
Unsorted collection of helper functions, will not be documented, read the code to use.


# License
This project is licensed under the MIT License. See the LICENSE file for more details.
