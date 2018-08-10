-- compute the volume of a right circular cone, given its height and the angle
-- between a generatrix and the axis.
function volumecone (height, angle)
  local r = math.tan(angle) * height
  return r^2 * math.pi * height / 3
end

local expect = 384 * math.pi
assert((volumecone(18, math.atan(8 / 18)) - expect) < 1e-10)
