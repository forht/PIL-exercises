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

-- Ex 5.7 Write a function that inserts all elements of a given list into a
-- given position of another given list.
function insertallat(t1, p, t2)
  return table.move(t1, 1, #t1, p, t2)
end

