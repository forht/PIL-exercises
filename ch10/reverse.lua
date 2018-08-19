-- Exercise 10.7: Write a function to reverse a UTF-8 string.

function reversetable(t)
  for i=1, math.floor(#t / 2) do
    t[i], t[#t - i + 1] = t[#t - i + 1], t[i]
  end
end

function utf8reverse(s)
  t = {}
  for c in string.gmatch(s, utf8.charpattern) do
    table.insert(t, c)
  end
  reverse(t)
  return table.concat(t)
end

assert(utf8reverse("æßð»") == "»ðßæ")

