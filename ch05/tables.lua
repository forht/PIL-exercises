-- Ex 5.4

function polyval(t, x)
  local res = t[1]
  for i = 2, #t do
    res = res + x^(i-1) * t[i]
  end
  return res
end

-- Ex 5.5
-- Horner's Method
function polyval2(t, x)
  local res = t[#t]
  for i = #t - 1, 1, -1 do
    res = res * x + t[i]
  end
  return res
end

-- Ex 5.6
-- Write a function to test whether a given table is a valid sequence.
-- (I consider only holes in keys with positive integer values)
function isseq(t)
  max = 0
  for i in ipairs(t) do
    max = i
  end
  for k in pairs(t) do
    if type(k) == "number" and k > max and math.floor(k) == k then
      return false
    end
  end
  return true
end

assert(isseq({3,4,5,"lua"}))
assert(isseq({3,4,5, n = 4,"lua"}))
assert(not isseq({3,4,5, "lua", [6] = 6}))

-- Ex 5.7 Write a function that inserts all elements of a given list into a
-- given position of another given list.
function insertallat(t1, p, t2)
  return table.move(t1, 1, #t1, p, t2)
end

