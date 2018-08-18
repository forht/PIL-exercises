-- Ex 7.3 Compare the performance of Lua programs that copy the standard input stream
-- to the standard output stream in the following ways: • byte by byte; • line
-- by line; • in chunks of 8 kB; • the whole file at once. For the last option,
-- how large can the input file be?

-- For a 1mb stream
-- byte by byte: ~0.85s
-- line by line: ~0.35s
-- chunks of 8kB: ~0.05s
-- whole file at once: ~0.05s

while true do
  c = io.read(2^13)
  if not c then break end
  io.write(c)
end

-- io.write(io.read("a"))
