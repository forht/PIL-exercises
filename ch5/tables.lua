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
