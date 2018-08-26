-- Exercise 13.3: How can you test whether a given integer is a power of two?

function ispow2 (n)
  for i = 0, 62 do
    if n == (1 << i) then
      return true
    end
  end
  return false
end

