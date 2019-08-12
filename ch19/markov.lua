function allwords ()
  local line = io.read()
  -- current line
  local pos = 1
  -- current position in the line
  return function ()
    -- iterator function
    while line do
      -- repeat while there are lines
      local w, e = string.match(line, "(%w+[,;.:]?)()", pos)
      if w then
        -- found a word?
        pos = e
        -- update next position
        return w
        -- return the word
      else
        line = io.read()
        -- word not found; try next line
        pos = 1
        -- restart from first position
      end
    end
    return nil
    -- no more lines: end of traversal
  end
end

function prefix (t)
  return table.concat(t, ' ')
end

local statetab = {}
function insert (prefix, value)
  local list = statetab[prefix]
  if list == nil then
    statetab[prefix] = {value}
  else
    list[#list + 1] = value
  end
end

local MAXGEN = 200
local NOWORD = "\n"
-- build table
local PREFIXLEN = 3
local lastwords = {}
for i=1,PREFIXLEN do
  lastwords[i] = NOWORD
end

for nextword in allwords() do
  insert(prefix(lastwords), nextword)
  table.move(lastwords, 2, #lastwords, 1)
  lastwords[#lastwords] = nextword
end

insert(prefix(lastwords), NOWORD)
-- generate text
for i=1,PREFIXLEN do
  lastwords[i] = NOWORD
end
-- reinitialize
for i = 1, MAXGEN do
  local list = statetab[prefix(lastwords)]
  -- choose a random item from list
  local r = math.random(#list)
  local nextword = list[r]
  if nextword == NOWORD then return end
  io.write(nextword, " ")
  table.move(lastwords, 2, #lastwords, 1)
  lastwords[#lastwords] = nextword
end
