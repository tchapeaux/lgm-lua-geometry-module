require "lgm-base"

export ^

class Entity
    new: (@x, @y) =>
    getX: => @x
    getY: => @y

    distanceTo: (ent2) =>
        lgm_distance @x, @y, ent2.x, ent2.y

    getClosestOf = (candidateList, maxDistance=nil) ->
        -- Returns the entity from entities closest to origin with a distance less
        --  than maxDistance (if specified)
        -- parameters:
        --      candidateList:  list of entities
        --      origin:         Entity
        --      maxDistance:    number (or nil)
        -- return:
        --      two values: closest entity, distance
        --      (or nil, nil if there are no acceptable candidates)
        -- remark:
        --      if @ is present in entities, it will be ignored

        if #candidateList == 0
            return nil, nil

        if maxDistance == nil
            -- make sure the first candidate is not @
            while candidateList[1] == @
                table.remove candidateList, 1
            if #candidateList == 0
                return nil, nil
            -- set maxDistance to the first distance
            maxDistance = @distanceTo candidateList[1]

        closestCandidate = candidateList[1]
        closestDistance = maxDistance

        for _,e in ipairs(candidateList)
            if e ~= @
                -- filtering with rectangular bounding box
                dx = math.abs(e\getX! - @getX!)
                dy = math.abs(e\getY! - @getY!)
                if dx < closestDistance and dy < closestDistance
                    -- if the bbox check passes, perform actual distance check
                    distance = @distanceTo e
                    if distance < closestDistance
                        closestCandidate = e
                        closestDistance = distance
        return closestCandidate, closestDistance
