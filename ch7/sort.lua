#!/usr/bin/env lua
-- Ex 7.1 Write a program that reads a text file and rewrites it with its lines
-- sorted in alphabetical order. When called with no arguments, it should read
-- from standard input and write to standard output. When called with one
-- file-name argument, it should read from that file and write to standard
-- output. When called with two file-name arguments, it should read from the
-- first file and write to the second.
--
-- Exercise 7.2: Change the previous program so that it asks for confirmation if
-- the user gives the name of an existing file for its output.

local inpf = io.input()
local outf = io.output()
argn = #arg
if argn >= 1 then inpf = assert(io.open(arg[1], "r")) end
if argn == 2 then
  outf = io.open(arg[2])
  if outf then
    outf:close()
    io.write("Output file already exists, continue? y/n\n")
    while true do
      local a = io.read()
      if a == "y" or a == "Y" then
        break
      elseif a == "n" or a == "N" then
        os.exit()
      else
        io.write("Please answer y/n\n")
      end
    end
  end
  outf = io.open(arg[2], "w")
end

lines = {}
for l in inpf:lines() do
  table.insert(lines, l)
end
table.sort(lines)
for _, l in ipairs(lines) do
  outf:write(l, "\n")
end
inpf:close()
outf:close()
