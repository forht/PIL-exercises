function fromto(a,b,s)
  s = s or 1
  if s > 0 then
    return function()
      if a > b then return nil end
      local r = a
      a = a + s
      return r
    end
  end
  return function()
    if a < b then return nil end
    local r = a
    a = a + s
    return r
  end
end


function fromtosl(a,b,s)
  s = s or 1
  local function fromto_it(state, i)
    local upto = state[1]
    local s = state[2]
    if s > 0 then
      if i+s >= upto then return nil end
    else
      if i+s <= upto then return nil end
    end
    i = i + s
    return i
  end
  return fromto_it, {b,s}, a-s
end

for i in fromtosl(1,8,2) do print(i) end
