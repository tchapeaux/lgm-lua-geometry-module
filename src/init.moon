export lgm_path
lgm_path = "./"

base = require "#{lgm_path}lgm-base"
entity = require "#{lgm_path}lgm-entity"
entityset = require "#{lgm_path}lgm-entityset"
segment = require "#{lgm_path}lgm-segment"
vector = require "#{lgm_path}lgm-vector"

return {
    base: base
    Entity: entity.Entity
    EntitySet: entityset.EntitySet
    Segment: segment.Segment
    Vector: vector.Vector
}
