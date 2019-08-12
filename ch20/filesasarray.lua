function filesAsArray(filename)
  file = io.open(filename, 'r+')
  local len = file:seek('end')
  local proxy = {__file = file, __len = len}
  local mt = {
    __index = function (p, k)
      local f = p.__file
      f:seek('set', k)
      return f:read(1)
    end,
    __newindex = function (p, k, v)
      local f = p.__file
      f:seek('set', k)
      f:write(v)
    end,
    __len = function(p) return p.__len end,
    __pairs = function(p)
      return function(s, _)
        s.i = s.i + 1
        local i,p = s.i, s.p
        if i >= p.__len then return nil end
        return p[i]
      end, {i=-1, p=p}, nil
    end
  }
  setmetatable(proxy, mt)
  return proxy, file
end

p, f = filesAsArray('data.txt')

for v in pairs(p) do
  print(v)
end
f:close()
