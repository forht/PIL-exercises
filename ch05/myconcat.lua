-- Ex 5.8
function myconcat(t)
  local s = ""
  for _, v in ipairs(t) do
    s = s .. v
  end
  return s
end

local t = {}
for i = 1, 100000 do
  table.insert(t, "lua")
end

-- table.concat(t) -- 0.03s
myconcat(t) -- 2.5s
