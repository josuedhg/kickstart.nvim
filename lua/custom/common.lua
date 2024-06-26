function File_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end
