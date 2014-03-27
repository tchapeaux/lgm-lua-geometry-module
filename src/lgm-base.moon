export *

lgm_distance = (x1, y1, x2, y2) ->
    dxx = x2 - x1
    dyy = y2 - y1
    math.sqrt(dxx^2 + dyy^2)


modulo_lua = (x, y) ->
        -- can be used to loop through lua arrays, which are 1-indexed
        -- e.g.
        -- 1 2 3 4 5 6 7 8 9  - x
        -- 1 2 0 1 2 0 1 2 0  - x % 3
        -- 1 2 3 1 2 3 1 2 3  - modulo_lua(x, 3)
        return ((x - 1) % y) + 1
