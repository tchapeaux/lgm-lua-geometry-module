export lgm_path = "./"
require "#{lgm_path}lgm-entity"
require "#{lgm_path}lgm-entityset"
require "#{lgm_path}lgm-vector"
require "#{lgm_path}lgm-segment"

-- # Entity Distance Tests

do
    e1 = Entity(0, 0)
    e2 = Entity(3, 5)

    assert (e1\distanceTo e2) == math.sqrt(3*3 + 5*5), "distance Test Failed: #{e1\distanceTo e2}"

    e1 = Entity(10, 10)
    e2 = Entity(10, 15)

    assert (e1\distanceTo e2) == 5, "distance Test Failed: #{e1\distanceTo e2} != 5"

do
    e1 = Entity(5, 2)
    e2 = Entity(-3, 10)

    assert (e1\distanceTo e2) == math.sqrt(8*8 + 8*8)

-- # EntitySet

do
    es = EntitySet()
    e1 = Entity(1, 1)
    e2 = Entity(225, 130)
    e3 = Entity(-300, -103)

    closest, d = e1\getClosestOf(es\as_list())
    assert closest == nil and d == nil

    es\add(Entity(50, 25))
    es\add(Entity(200, 150))
    es\add(Entity(-140, 20))
    es\add(Entity(53, -12))
    es\add(Entity(0, 0))
    es\add(e3)

    closest, d = e1\getClosestOf(es\as_list())
    assert closest\getX() == 0 and closest\getY() == 0 and d == math.sqrt(2), "#{closest}"

    closest, d = e2\getClosestOf(es\as_list())
    assert closest\getX() == 200 and closest\getY() == 150, "#{closest}"

    e = es\find(e3.id)
    assert e == e3

-- # Vector Angle Tests

do
    v1 = Vector(10, 0)
    v2 = Vector(0, 10)

    assert (v1\angleWith v2) == math.pi / 2, "vector test failed, #{v1\angleWith v2} != math.pi / 2 (#{math.pi / 2})"

do
    v1 = Vector(10, 0)
    v2 = Vector(5, 5)

    assert (v2\angle()) == -math.pi / 4, "angle is #{v2\angle()} not #{math.pi / 4}"
    assert (v1\angleWith(v2)) == math.pi / 4

do
    v1 = Vector(5, 5)
    v2 = Vector(-5, 5)

    assert (v1\angleWith(v2)) == math.pi / 2, "#{v1\angleWith v2}"

do
    v1 = Vector(1, 1)
    v2 = Vector(200, 0)
    assert (v1\angleWith(v2)) == -1 * math.pi / 4

-- # Vector Scalar Product Test

do
    v1 = Vector(1, 1)
    v2 = v1\scalarProduct(2)
    assert (v2.x == 2 and v2.y == 2), "#{v2}"

do
    v1 = Vector(0, 20)
    v2 = v1\scalarProduct(-1.5)
    assert (v2.x == 0 and v2.y == -30), "#{v2}"

do
    v1 = Vector(180, 243)
    v2 = v1\scalarProduct(5.25)
    assert (v2.x == 945 and v2.y == 1275.75), "#{v2}"

do
    v1 = Vector(0, 0)
    v2 = v1\scalarProduct(4)
    assert (v2.x == 0 and v2.y == 0), "#{v2}"

-- # Vector Dot Product Test

do
    v1 = Vector(0, 10)
    v2 = Vector(0, 20)
    assert (v1\dotProduct(v2)) == 200

do
    v1 = Vector(0, 430)
    v2 = Vector(242, 0)
    assert (v1\dotProduct(v2)) == 0

do
    v1 = Vector(24, -58)
    v2 = Vector(-7, 24)
    assert (v1\dotProduct(v2)) == -1560

-- # Angle Cross Product Test

do
    v1 = Vector(1, 0)
    v2 = Vector(5, 0)
    assert (v1\crossProduct(v2)) == 0

do
    v1 = Vector(2, 0)
    v2 = Vector(0, -8)
    assert (v1\crossProduct(v2)) == -16

-- # Right turn test

do
    v1 = Vector(1, 0)
    v2 = Vector(0, 1)
    assert v1\isLeftTurn(v2)

do
    v1 = Vector(5, 5)
    v2 = Vector(7, -2)
    assert not v1\isLeftTurn(v2)

do
    v1 = Vector(7, 12)
    v2 = Vector(14, 24)
    assert v1\isLeftTurn(v2)
    assert not v1\isLeftTurn(v2, true) -- strict


-- # Segment Intersection test

do
    seg1 = Segment(Vector(-1, 0), Vector(1, 0))
    seg2 = Segment(Vector(0, -1), Vector(0, 1))
    assert seg1\intersect(seg2), "Segment Intersection failed"

do
    seg1 = Segment(Vector(3, 10), Vector(17, 56))
    seg2 = Segment(Vector(0, -1), Vector(-12, 207))
    assert not seg1\intersect(seg2), "Segment Intersection failed"

do
    seg1 = Segment(Vector(-200, -200), Vector(700, 700))
    seg2 = Segment(Vector(-0.5, 0), Vector(0.5, 0))
    assert seg1\intersect(seg2), "Segment Intersection failed"


-- isNaN test
do
    assert is_nan(0/0)
    assert is_nan(-0/0)
    assert is_nan((-1)^.5)
    assert not is_nan(1)
    assert not is_nan(0)
    assert not is_nan(false)

print "All tests have passed!"
