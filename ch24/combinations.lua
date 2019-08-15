function combgen(t, tbs, el, from)
  if tbs == 0 then
    coroutine.yield(t)
    return
  end
  for i = from, #el - tbs + 1 do
    t[tbs] = el[i]
    combgen(t, tbs-1, el, i+1)
  end
end

function combinations(t, s)
  -- return coroutine.wrap(function() combgen({}, s, t, 1) end)
  local co = coroutine.create(function() combgen({}, s, t, 1) end)
  return function()
    local code, res = coroutine.resume(co)
    return res
  end
end

for v in combinations({1,2,3,4}, 2) do
  print(table.unpack(v))
end
