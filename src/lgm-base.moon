export *

lgm_distance = (x1, y1, x2, y2) ->
    dxx = x2 - x1
    dyy = y2 - y1
    return math.sqrt(dxx^2 + dyy^2)


modulo_lua = (x, y) ->
        -- can be used to loop through lua arrays, which are 1-indexed
        -- e.g.
        -- 1 2 3 4 5 6 7 8 9  - x
        -- 1 2 0 1 2 0 1 2 0  - x % 3
        -- 1 2 3 1 2 3 1 2 3  - modulo_lua(x, 3)
        return ((x - 1) % y) + 1

is_nan = (x) ->
-- from http://stackoverflow.com/questions/12102222/how-to-test-for-1-ind-indeterminate-in-lua
--local nanString = (tostring((-1) ^ 0.5)); --sqrt(-1) is also NaN.
--Unfortunately,
--  tostring((-1)^0.5))       = "-1.#IND"
--  x = tostring((-1)^0.5))   = "0"
--With this bug in LUA we can't use this optimization
    if (x ~= x) then
        return true --only NaNs will have the property of not being equal to themselves

    --but not all NaN's will have the property of not being equal to themselves
    --only a number can not be a number
    if type(x) ~= "number" then
       return false

    --fails in cultures other than en-US, and sometimes fails in enUS depending on the compiler
    --Slower, but works around the three above bugs in LUA
    if tostring(x) == tostring((-1)^0.5) then
        return true

    --i really can't help you anymore.
    --You're just going to have to live with the exception
    return false
