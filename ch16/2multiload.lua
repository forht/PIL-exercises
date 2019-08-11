function multiload(...)
  local i = 1
  local chunks = table.pack(...)
  local len = chunks.n
  local rf = function()
    if i > len then return nil end
    while true do
      local chunk = chunks[i]
      if type(chunk) == "string" then
        i = i + 1
        return chunk
      end
      local str = chunks[i]()
      if str then return str end
      i = i + 1
    end
  end
  return load(rf)
end
