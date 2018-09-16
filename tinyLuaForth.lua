require "outerInterpreter"
tinyLuaForth=function(inDictFilePath)
	print "--- tiny LuaForth 1.2 ---"; dofile(inDictFilePath)
	while true do io.write("-> ")
		local line=io.read(); if line=="" then print("bye."); break end
		local result=outerInterpreter(line)
		print(result==nil  and " ok." or "unknown word '"..result.."'") 
	end
end
