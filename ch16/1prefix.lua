function loadwithprefix(prefix, chunk, ...)
  if type(chunk) == "string" then
    local prefixdone = false
    local chunkdone = false
    f = function ()
      if not prefixdone then
        prefixdone = true
        return prefix
      end
      if not chunkdone then
        chunkdone = true
        return chunk
      end
      return nil
    end
    return load(f, ...)
  end
  local prefixdone = false
  return load(function ()
      if not prefixdone then
        prefixdone = true
        return prefix
      end
      return chunk()
              end, ...)
end
