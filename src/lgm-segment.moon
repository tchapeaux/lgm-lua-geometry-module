require "#{lgm_path}lgm-vector"

export ^

class Segment
    new: (@pA, @pB) =>
        -- pA and pB are Vectors

    asVector: =>
        return @pB\minus(@pA)

    intersect: (seg2) =>
        -- left/right based : seg1 intersect seg2 if
        --    seg1.A and seg1.B are of opposite sides of seg2
        --    seg2.A and seg2.B are of opposite sides of seg1

        v1 = @asVector()
        seg1CheckA = v1\isLeftTurn(seg2.pA\minus(@pB))
        seg1CheckB = v1\isLeftTurn(seg2.pB\minus(@pB))
        seg1Check = seg1CheckA ~= seg1CheckB

        v2 = seg2\asVector()
        seg2CheckA = v2\isLeftTurn(@pA\minus(seg2.pB))
        seg2CheckB = v2\isLeftTurn(@pB\minus(seg2.pB))
        seg2Check = (seg2CheckA ~= seg2CheckB)

        return (seg1Check and seg2Check)

    isLeft: (p, strict=false) =>
        vecP = Vector(@pB.x - p.x, @pB.y - p.y)
        return @asVector()\isLeftTurn(vecP, strict)

    __tostring: =>
        return "S(" .. tostring(@pA) .. ", " .. tostring(@pB) .. ")"
