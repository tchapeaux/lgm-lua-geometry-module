export ^

class EntitySet
    new: =>
        @currentID = 0
        @entList = {}

    size: =>
        #@entList

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
                return
