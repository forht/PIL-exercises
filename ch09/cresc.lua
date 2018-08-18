-- Exercise 9.4: Using our system for geometric regions, draw a waxing crescent
-- moon as seen from the Northern Hemisphere.
function difference (r1, r2)
  return function (x, y)
    return r1(x, y) and not r2(x, y)
  end
end

function disk (cx, cy, r)
  return function (x, y)
    return (x - cx)^2 + (y - cy)^2 <= r^2
  end
end

function translate (r, dx, dy)
  return function (x, y)
    return r(x - dx, y - dy)
  end
end

function plot (r, M, N)
  io.write("P1\n", M, " ", N, "\n")
  -- header
  for i = 1, N do
    -- for each line
    local y = (N - i*2)/N
    for j = 1, M do
      -- for each column
      local x = (j*2 - M)/M
      io.write(r(x, y) and "1" or "0")
    end
    io.write("\n")
  end
end


c1 = disk(0, 0, 1)
plot(difference(c1, translate(c1, -0.3, 0)), 500, 500)

-- Ex 9.5: In our system for geometric regions, add a function to rotate a
-- given region by a given angle.
function rotate(r, a)
  local s = math.sin(-a)
  local c = math.cos(-a)
  return function (x, y)
    return r(x * c - y * s, x * s + y * c)
  end
end

