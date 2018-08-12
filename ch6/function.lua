-- Ex 6.2 Write a function that takes an arbitrary number of values and returns
-- all of them, except the first one.

function rest(...)
  return select(2, ...)
end

-- Ex 6.3 Write a function that takes an arbitrary number of values and returns
-- all of them, except the last one.

function exceptlast(...)
  args = table.pack(...)
  table.remove(args, args.n)
  return table.unpack(args)
end

-- Ex 6.4 Write a function to shuffle a given list. Make sure that all
-- permutations are equally probable.
function swap(t, i, j)
  local temp = t[i]
  t[i] = t[j]
  t[j] = temp
end
-- Fisher-Yates shuffle
function shuffle(t)
  math.randomseed(os.time())
  for i = #t, 2, -1 do
    swap(t, i, math.random(i))
  end
end

local t = {1,2,3,4,5,6,7,8,9}
shuffle(t)
print(table.unpack(t))
