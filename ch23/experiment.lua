mt = {__mode = 'k'}
o = {}
setmetatable(o, mt)
k = {text = 'No Ephemeron tables'}
o[k] = {}
k = nil
collectgarbage()
k = next(o)
if k then
  print(k.text)
else
  print("Ephemeron tables")
end
