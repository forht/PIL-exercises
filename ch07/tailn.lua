-- Ex 7.4: Write a program that prints the last line of a text file. Try
-- to avoid reading the entire file when the file is large and seekable.
-- Ex 7.5: Generalize the previous program so that it prints the last n
-- lines of a text file. Again, try to avoid reading the entire file when the
-- file is large and seekable.

if #arg ~= 2 then
  os.exit()
end

local f = assert(io.open(arg[1], "r"))
local n = tonumber(arg[2])

size = f:seek("end")
if (not size) or (size < 2^16) then
  f:seek("set")
  local lines = {}
  local count = 0
  for l in f:lines() do
    table.insert(lines, l)
    count = count + 1
  end
  for i = count - n + 1, count do
    io.write(lines[i], "\n")
  end
else
  f:seek("end", -2)
  local lfc = 0
  while true do
    local c = f:read(1)
    if c == "\n" then lfc = lfc + 1 end
    if (not c) or lfc >= n then break end
    f:seek("cur", -2)
  end
  io.write(f:read("a"))
end
