-- Exercise 13.1: Write a function to compute the modulo operation for unsigned
-- integers.

function umod (n, d)
  if d < 0 then
    if math.ult(n, d) then return n
    else return n - d
    end
  end
  local q = ((n >> 1) // d) << 1
  local r = n - q * d
  if not math.ult(r, d) then r = r - d end
  return r
end
