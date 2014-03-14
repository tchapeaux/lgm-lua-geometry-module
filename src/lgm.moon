export lgm_path
lgm_path = "./"

require "#{lgm_path}lgm-base"
require "#{lgm_path}lgm-entity"
require "#{lgm_path}lgm-entityset"
require "#{lgm_path}lgm-segment"
require "#{lgm_path}lgm-vector"

export LGM = {
    distance: lgm_distance
    Entity: Entity
    EntitySet: EntitySet
    Segment: Segment
    Vector: Vector
}
