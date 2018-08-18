-- Ex 7.6: Using os.execute and io.popen, write functions to create a directory,
-- to remove a directory, and to collect the entries in a directory.

function mkdir(path)
  os.execute("mkdir " .. path)
end

function rmdir(path)
  os.execute("rmdir " .. path)
end

function collectdir(path)
  local ls = io.popen("ls -1")
  local dir = {}
  for l in ls:lines() do
    table.insert(dir, l)
  end
  return dir
end
