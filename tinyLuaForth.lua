require "outerInterpreter"
tinyLuaForth=function(inDictFilePath)
	print "--- tiny LuaForth 1.1 ---"; dofile(inDictFilePath)
	while true do io.write("-> ")
		local line=io.read(); if line=="" then print("bye."); break end
		print(outerInterpreter(line) and " ok." or "unknown word.") 
	end
end
