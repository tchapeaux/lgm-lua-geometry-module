export lgm_path
lgm_path = "lgm."

base = require "#{lgm_path}lgm-base"
entity = require "#{lgm_path}lgm-entity"
entityset = require "#{lgm_path}lgm-entityset"
segment = require "#{lgm_path}lgm-segment"
vector = require "#{lgm_path}lgm-vector"

return {
    _VERSION: 'LGM-alpha'
    _DESCRIPTION: '"Good enough" implementation of basic computational geometry techniques for 2D drawing'
    _URL: 'https://github.com/tchapeaux/lgm-lua-geometry-module'
    _LICENSE: "The MIT License (MIT)"

    base: base
    Entity: entity.Entity
    EntitySet: entityset.EntitySet
    Segment: segment.Segment
    Vector: vector.Vector
}
