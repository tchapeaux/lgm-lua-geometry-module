export ^

class EntitySet
    new: =>
        @currentID = 0
        @entList = {}

    size: =>
        return #@entList

    nextID: =>
        @currentID += 1
        return @currentID

    iter: =>
        i = 1
        return ->
            i += 1
            return @entList[i] if i <= #@entList

    as_list: =>
        return @entList

    add: (ent) =>
        assert ent.id == nil
        -- This means that an Entity can only be part of one EntitySet
        -- which does not seem elegant or intuitive
        -- TODO: either document this constraint or remove it (identity map?)
        ent.id = @nextID()
        table.insert(@entList, ent)

    find: (id) =>
        for _, e in ipairs(@entList)
            if e.id == id
                return e
        return nil

    removeID: (id) =>
        for n, e in ipairs(@entList)
            if e.id == id
                table.remove(@entList, n)
                break
