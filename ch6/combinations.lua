-- Ex 6.5 Write a function that takes an array and prints all combinations of
-- the elements in the array.
function combinations(t, k, acc)
  if k == 0 then
    print(acc)
    return
  end
  if #t < k then
    return
  end
  local nextacc
  if acc == "" then
    nextacc = tostring(t[1])
  else
    nextacc = acc .. ", " .. tostring(t[1])
  end
  local t1 = table.move(t, 2, #t, 1, {})
  -- C(n - 1, m - 1):
  combinations(t1, k - 1, nextacc)
  -- C(n - 1, m):
  return combinations(t1, k, acc)
end

function allcombinations(t)
  for i in ipairs(t) do
    print("Combinations of " .. i .. " elements:")
    combinations(t, i, "")
  end
end


