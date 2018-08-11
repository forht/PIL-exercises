-- Ex3.6: compute the volume of a right circular cone, given its height and the
-- angle between a generatrix and the axis.
function volumecone(height, angle)
  local r = math.tan(angle) * height
  return r^2 * math.pi * height / 3
end

local expect = 384 * math.pi
assert((volumecone(18, math.atan(8 / 18)) - expect) < 1e-10)

-- Ex3.7 produce a pseudo-random number with a standard normal (Gaussian)
-- distribution.
function randomnormal()
  u1 = math.random()
  u2 = math.random()
  -- Box-Muller Transform
  z1 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
  return z1
end

function mean(t)
  local sum = 0
  for _, v in pairs(t) do
    sum = sum + v
  end
  return sum / #t
end

function std(t)
  local squares, avg = 0, mean(t)
  for _, v in pairs(t) do
    squares = squares + ((avg - v) ^ 2)
  end
  local variance = squares / #t
  return math.sqrt(variance)
end

math.randomseed(os.time())
t = {}
for i = 1, 1000 do
  t[i] = randomnormal()
end

print("Mean: ", mean(t))
print("Deviation: ", std(t))
