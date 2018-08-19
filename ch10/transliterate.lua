-- Ex 10.3: Write a function transliterate. This function receives a string and
-- replaces each character in that string with another character, according to a
-- table given as a second argument. If the table maps a to b, the function
-- should replace any occurrence of a with b. If the table maps a to false, the
-- function should remove occurrences of a from the resulting string.

function transliterate(s, t)
  local function tr(c)
    local m = t[c]
    return m == false and "" or m
  end
  return string.gsub(s, ".", tr)
end

-- Exercise 10.6: Rewrite the function transliterate for UTF-8 characters.

function utf8transliterate(s, t)
  local function tr(c)
    local m = t[c]
    return m == false and "" or m
  end
  return string.gsub(s, utf8.charpattern, tr)
end
