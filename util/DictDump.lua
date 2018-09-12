Dict.Dump=function(inWordName)
	if Dict[inWordName]==nil then
		print("No such word.")
		return
	end

	if Dict[inWordName].param==nil then
		print(inWordName.." is core word.")
		return
	end

	local i,v
	print("Word:"..inWordName)
	for i,v in ipairs(Dict[inWordName].param) do
		if type(v)=="table" then
			print(v.name)
		else
			print(v)
		end
	end
end
