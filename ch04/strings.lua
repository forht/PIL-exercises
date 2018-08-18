-- Ex 4.1
s1 = [=[
<![CDATA[
Hello world
]]>]=]

s2 = "<![CDATA[\n" .. "  Hello world\n" .. "]]>"

-- Ex 4.2

b = "\231\127\100\z
     \111\112\113\z
     \114"

-- Ex 4.3

function insert(s1, pos, s2)
  return s1:sub(1, pos - 1) .. s2 .. s1:sub(pos, -1)
end

assert(insert("hello world", 7, "small ") == "hello small world")

-- Ex 4.4

function utf8insert(s1, pos, s2)
  off = utf8.offset(s1, pos)
  return s1:sub(1, off - 1) .. s2 .. s1:sub(off, -1)
end

assert(utf8insert("ação", 5, "!") == "ação!")

-- Ex 4.5

function remove(s, i, l)
  return s:sub(1, i - 1) .. s:sub(i + l, -1)
end

assert(remove("hello world", 7, 4) == "hello d")

-- Ex 4.6

function utf8remove(s, i, l)
  offbegin = utf8.offset(s, i)
  offend = utf8.offset(s, i + l)
  return s:sub(1, offbegin - 1) .. s:sub(offend, -1)
end

assert(utf8remove("ação", 2, 2) == "ao")

-- Ex 4.7

function ispali(s)
  return s == string.reverse(s)
end

-- Ex 4.8
local punct = { string.byte(" .,;:", 1, -1) }
function ispali2(s)
  for _, p in pairs(punct) do
    s = string.gsub(s, '[' .. string.char(p) .. ']', "")
  end
  return s == string.reverse(s)
end

assert(ispali2("an;a.n a"))
assert(not ispali2("ban;a.n a"))

-- Ex 4.9
function ispaliutf8(s)
  for _, p in pairs(punct) do
    s = string.gsub(s, '[' .. string.char(p) .. ']', "")
  end
  s = { utf8.codepoint(s, 1, -1) }
  local ls = #s
  for i in ipairs(s) do
    if s[i] ~= s[ls - i + 1] then
      return false
    end
  end
  return true
end

assert(ispaliutf8("æß;ðð ßæ"))
assert(not ispaliutf8("æß;ðð ßæ€"))
