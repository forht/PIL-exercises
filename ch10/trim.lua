-- Exercise 10.4: At the end of the section called “Captures”, we defined a trim
-- function. Because of its use of backtracking, this function can take a
-- quadratic time for some strings. (For instance, in my new machine, a match
-- for a 100 KB string can take 52 seconds.)
-- • Create a string that triggers this quadratic behavior in function trim.
-- • Rewrite that function so that it always works in linear time.

local s1 = "a" .. string.rep("  ", 8000) .. "a"

function my_trim_no_0char (s)
  local s = string.gsub(s, "^%s*%f[^%s\000](.-)%s*$", "%1")
  return s
end

function my_trim (s)
  local _, s1 = string.find(s, "^%s*")
  local s2 = string.find(s, "%f[%s]%s+$")
  s2 = s2 or 0
  return string.sub(s, s1 + 1, s2 - 1)
end
