-- Exercise 2.2: this solution is slower as we are checking the 8!=40320
-- permutations while isplace ok is run only 15720 times

N = 8

function print_table(a)
  for i,j in pairs(a) do
    io.write(i, '.', j, '-')
  end
end

function checksolution(t)
  for i=1, N do
    c = t[i]
    for j=1, N do
      if i ~= j then
        if (t[j] == c) or (t[j] - j == c - i) or (t[j] + j == c + i) then
          return false
        end
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

function in_table_til(t, m, e)
  for i=1,m-1 do
    if t[i] == e then
      return true
    end
  end
  return false
end

function perm (b, s)
  if s == N + 1 and checksolution(b) then
    printsolution(b)
  else
    for i = 1, N do
      if not in_table_til(b, s, i) then
        b[s] = i
        perm(b, s + 1)
      end
    end
  end
end

perm({}, 1)
