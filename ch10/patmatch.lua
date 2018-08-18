-- Exercise 10.1: Write a function split that receives a string and a delimiter
-- pattern and returns a sequence with the chunks in the original string
-- separated by the delimiter:

function split(s, d)
  local pointer = 1
  local t = {}
  local len = #s
  while pointer <= len do
    local b, e = string.find(s, d, pointer)
    if b == nil then
      table.insert(t, string.sub(s, pointer, len))
      break
    end
    -- if there is something between the previous and the next delimiter
    if b > pointer then
      table.insert(t, string.sub(s, pointer, b - 1))
    end
    pointer = e + 1
  end
  return t
end
