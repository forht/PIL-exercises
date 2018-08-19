-- Ex 10.5: Write a function to format a binary string as a literal in Lua,
-- using the escape sequence \x for all bytes:

function escape(s)
  local function es1(c)
    return string.format("\\x%02X", string.byte(c))
  end
  return string.gsub(s, ".", es1)
end
