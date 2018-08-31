-- Exercise 14.2: Modify the queue implementation in Figure 14.2, “A
-- double-ended queue” so that both indices return to zero when the queue is
-- empty.

function listNew ()
  return {first = 0, last = -1}
end

function pushFirst (list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end

function pushLast (list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
end

function popFirst (list)
  local first = list.first
  if first > list.last then error("list is empty") end
  local value = list[first]
  list[first] = nil
  -- to allow garbage collection
  if first + 1 > list.last then
    list.first = 0
    list.last = -1
  else
    list.first = first + 1
  end
  return value
end

function popLast (list)
  local last = list.last
  if list.first > last then error("list is empty") end
  local value = list[last]
  list[last] = nil
  -- to allow garbage collection
  if list.first > last - 1 then
    list.first = 0
    list.last = -1
  else
    list.last = last - 1
  end
  return value
end
