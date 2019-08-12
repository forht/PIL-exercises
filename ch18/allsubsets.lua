function settolist(t)
  local i = 1
  local tn = {}
  for k in pairs(t) do
    tn[i] = k
    i = i + 1
  end
  return tn
end

function clean(t)
  for k in pairs(t) do
    t[k] = nil
  end
end

function allsubsets(t)
  local tn = settolist(t)
  local max = (math.pow(2, #tn) - 1) | 0
  local function iterator(state, last)
    state.i = state.i + 1
    local i = state.i
    if i > state.max then return nil end
    clean(last)
    for j=1,state.len do
      if (1 << j - 1) & i ~= 0 then
        last[tn[j]]=true
      end
    end
    return last
  end
  return iterator, {max = max, i = 0, tn = tn, len = #tn}, {}
end

  
for ss in allsubsets({a=true,b=true,c=true,d=true,e=true}) do
  for k in pairs(ss) do
    io.write(k, ' ')
  end
  print()
end
