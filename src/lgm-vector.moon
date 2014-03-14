require "#{lgm_path}lgm-base"

export ^

class Vector
    new: (@x, @y) =>

    copy: =>
        return Vector @x, @y

    norm: =>
        lgm_distance 0, 0, @x, @y

    setNorm: (newNorm) =>
        curNorm = @norm!
        normFactor = newNorm / curNorm
        @x *= normFactor
        @y *= normFactor

    scalarProduct: (number) =>
        newV = @copy!
        newV\setNorm @norm! * number
        return newV

    add: (v2) =>
        return Vector @x + v2.x, @y + v2.y

    minus: (v2) =>
        return v2\add (@scalarProduct -1)

    angle: =>
        @angleWith(Vector(1, 0))

    angleWith: (v2) =>
        -- returns a value in [-pi, pi]
        a = math.atan2(v2.y, v2.x) - math.atan2(@y, @x)
        if a < -math.pi
            a += 2 * math.pi
        if a > math.pi
            a -= 2 * math.pi
        return a

    dotProduct: (v2) =>
        @x * v2.x + @y * v2.y

    crossProduct: (v2) =>
        @norm! * v2\norm! * math.sin @angleWith v2

    isLeftTurn: (v2, strict=false) =>
        if strict
            return (@crossProduct v2) > 0
        else
            return (@crossProduct v2) >= 0
