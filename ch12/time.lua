-- Exercise 12.1: Write a function that returns the date–time exactly one month
-- after a given date–time. (Assume the numeric coding of date–time.)

function add1month(t)
  local t = os.date("*t", t)
  t.month = t.month + 1
  return os.time(t)
end

-- Exercise 12.2: Write a function that returns the day of the week (coded as an
-- integer, one is Sunday) of a given date.

function dayofweek(y, m, d)
  local d = os.time({year = y, month = m, day = d})
  return os.date("*t", d).wday
end

-- Exercise 12.3: Write a function that takes a date–time (coded as a number)
-- and returns the number of seconds passed since the beginning of its
-- respective day.

function elapsec(t)
  local t0 = os.date("*t", t)
  t0.hour, t0.min, t0.sec = 0, 0, 0
  return os.difftime(t, os.time(t0))
end

-- Exercise 12.4: Write a function that takes a year and returns the day of its
-- first Friday.

function firstfriday(y)
  local t = {year = y, month = 1, day = 1}
  local wday = os.date("*t", os.time(t)).wday
  return (6 - wday) % 7 + 1
end

-- Exercise 12.5: Write a function that computes the number of complete days
-- between two given dates.

function between(d1, d2)
  os.difftime(os.time(d1), os.time(d2)) // 86400
end
