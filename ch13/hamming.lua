-- Exercise 13.4: Write a function to compute the Hamming weight of a given integer. (The
-- Hamming weight of a number is the number of ones in its binary
-- representation.)

function hamming(n)
  local w = 0
  for i = 0, 63 do
    w = w + ((n & (1 << i)) == 0 and 0 or 1)
  end
  return w
end
