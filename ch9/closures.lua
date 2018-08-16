-- Ex 9.3 Exercise 5.4 asked you to write a function that receives a polynomial
-- (represented as a table) and a value for its variable, and returns the
-- polynomial value. Write the curried version of that function.

function newpoly(t)
  return function (x)
    local res = t[#t]
    for i = #t - 1, 1, -1 do
      res = res * x + t[i]
    end
    return res
  end
end

f = newpoly({3, 0, 1})
print(f(0))
print(f(5))
print(f(10))
