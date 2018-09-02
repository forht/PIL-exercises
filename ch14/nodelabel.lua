-- Exercise 14.3: Modify the graph structure so that it can keep a label for
-- each arc. The structure should represent each arc by an object, too, with two
-- fields: its label and the node it points to. Instead of an adjacent set, each
-- node keeps an incident set that contains the arcs that originate at that
-- node.
--
-- Adapt the function readgraph to read two node names plus a label from each
-- line in the input file. (Assume that the label is a number.)

local function name2node (graph, name)
  local node = graph[name]
  if not node then
    node = {name = name, inc = {}}
    graph[name] = node
  end
  return node
end

function readgraph ()
  local graph = {}
  for line in io.lines() do
    local namefrom, nameto, label = string.match(line, "(%S+)%s+(%S+)%s+(%d+)")
    local from = name2node(graph, namefrom)
    local to = name2node(graph, nameto)
    from.inc[{to = to, label = tonumber(label)}] = true
  end
  return graph
end

function findpath (curr, to, path, visited)
  path = path or {}
  visited = visited or {}
  if visited[curr] then
    return nil
  end
  visited[curr] = true
  path[#path + 1] = curr
  if curr == to then
    return path
  end
  for arc in pairs(curr.inc) do
    local p = findpath(arc.to, to, path, visited)
    if p then return p end
  end
  table.remove(path)
end

g = readgraph()
a = name2node(g, "a")
b = name2node(g, "b")
p = findpath(a, b)
