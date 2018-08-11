-- Exercise 2.2: this solution is slower as we are checking the 8!=40320
-- permutations while isplaceok is run only 15720 times

N = 8

function checksolution(t)
  for i = 1, N do
    c = t[i]
    for j = 1, N do
      if i ~= j and
      ((t[j] == c) or (t[j] - j == c - i) or (t[j] + j == c + i)) then
        return false
      end
    end
  end
  return true
end

function printsolution(a)
  io.write("\n")
  for i = 1, N do
    for j = 1, N do
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

function in_table_upto(t, m, e)
  for i = 1, m - 1 do
    if t[i] == e then
      return true
    end
  end
  return false
end

function perm_and_check (b, s)
  if s == N + 1 and checksolution(b) then
    printsolution(b)
  else
    for i = 1, N do
      if not in_table_upto(b, s, i) then
        b[s] = i
        perm_and_check(b, s + 1)
      end
    end
  end
end

perm_and_check({}, 1)
