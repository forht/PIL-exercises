-- Exercise 14.1: Write a function to add two sparse matrices.

function addm(a, b)
  local c = {}
  for i=1, #a do
    local row = {}
    c[i] = row
    for k,v in pairs(a[i]) do
      row[k] = v
    end
    for k,v in pairs(b[i]) do
      local res = (row[k] or 0) + v
      row[k] = (res == 0) and nil or res
    end
  end
  return c
end
