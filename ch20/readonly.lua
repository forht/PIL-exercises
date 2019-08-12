local mt = {
  -- create metatable
  __index = function(p, k)
    return p.__table[k]
  end,
  __newindex = function (t, k, v)
    error("attempt to update a read-only table", 2)
  end
}

function readOnly (t)
  local proxy = {}
  proxy.__table = t
  setmetatable(proxy, mt)
  return proxy
end
