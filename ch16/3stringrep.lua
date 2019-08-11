function stringrepf (n)
  local f = "local r,s = '',...\n"
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then f = f .. "r = r .. s\n" end
      f = f .. "s = s .. s\n"
      n = math.floor(n / 2)
    end
    f = f .. "r = r .. s\n"
  end
  return load(f .. "return r\n")
end
