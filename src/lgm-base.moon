export *

lgm_distance = (x1, y1, x2, y2) ->
    dxx = x2 - x1
    dyy = y2 - y1
    math.sqrt(dxx^2 + dyy^2)

