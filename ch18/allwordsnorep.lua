function allwordsnorep (f)
  local line = f:read()
  local pos = 1
  local words = {}
  return function ()
    while line do
      while true do
        local w, e = string.match(line, "(%w+)()", pos)
        if w then
          pos = e
          if not words[w] then
            words[w] = true
            return w
          end
        end
        break
      end
      line = f:read()
      pos = 1
    end
    return nil
  end
end
