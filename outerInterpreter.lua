require "innerInterpreter"
local dataStack,returnStack={},{}
local makePush=function(t) return function(v) table.insert(t,v) end end
local makePop =function(t) return function() return table.remove(t) end end
DS={Push=makePush(dataStack),   Pop=makePop(dataStack)}
RS={Push=makePush(returnStack), Pop=makePop(returnStack)}
local execWord=function(inWordName) innerInterpreter({Dict[inWordName]}) end
local action={};
action.interpret={number=DS.Push, string=execWord}
action.compile  ={
	number=function(inValue) local ins=table.insert
		ins(NewWord.param,Dict["lit"]); ins(NewWord.param,inValue)
	end,
	string=function(inWordName)
		if Dict[inWordName].immediate then execWord(inWordName)
		else table.insert(NewWord.param,Dict[inWordName]) end
	end
}
function GetToken() local token
	token,scanPos=string.match(Line,"^([ \t]*)()", scanPos)
	token,scanPos=string.match(Line,"^([^ \t]*)()",scanPos)
	return token~="" and token or nil	-- token!="" ? token : nil
end
Mode="interpret"
outerInterpreter=function(inLine)
	Line=inLine; scanPos=1; local token=GetToken()
	while token do local tokVal = Dict[token] and token or tonumber(token)
		if tokVal then action[Mode][type(tokVal)](tokVal); token=GetToken() 
		else return false end
	end
	return true
end
