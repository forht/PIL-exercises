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
