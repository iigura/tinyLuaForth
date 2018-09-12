Dict={}
Dict.Add=function(inWord) Dict[inWord.name]=inWord end
local docol=function() local newThread=IP.thread[IP.index-1].param
	RS.Push(IP); IP={thread=newThread,index=1} end
local readIP=function() return IP.thread[IP.index] end
local incIP=function() IP.index=IP.index+1 end
local compile=function(inWordName) table.insert(NewWord.param,Dict[inWordName]) end
local compileEmptySlot=function() table.insert(NewWord.param,"EMPTY_SLOT") end
Dict.Add { name=":", immediate=true, code=function()
	NewWord={code=docol, name=GetToken(), param={}}
	Dict[NewWord.name]=NewWord; Mode="compile" end }
Dict.Add { name="semis", code=function() IP=RS.Pop() end }
Dict.Add { name=";", immediate=true, code=function() compile("semis")
	Dict[NewWord.name]=NewWord; Mode="interpret" end }
Dict.Add { name="0branch", code=function()
	if DS.Pop()==0 then IP.index=IP.index+readIP() else incIP() end end }
Dict.Add { name="if", immediate=true, code=function()
	compile("0branch"); RS.Push(#NewWord.param+1); compileEmptySlot() end }
Dict.Add { name="then", immediate=true, code=function()
	local p=RS.Pop(); NewWord.param[p]=#NewWord.param+1-p end }
Dict.Add { name="lit", code=function() DS.Push(readIP()); incIP() end }
Dict.Add { name="dup", code=function() local t=DS.Pop(); DS.Push(t); DS.Push(t) end }
Dict.Add { name="-", code=function() local a,b=DS.Pop(),DS.Pop(); DS.Push(b-a) end }
Dict.Add { name="*", code=function() local a,b=DS.Pop(),DS.Pop(); DS.Push(a*b) end }
Dict.Add { name=">", code=function() local a,b=DS.Pop(),DS.Pop(); 
		if b>a then DS.Push(-1) else DS.Push(0) end end }
Dict.Add { name=".", code=function() local t=DS.Pop(); io.write(" "); io.write(t) end }
Dict.Add { name="cr", code=function() print() end }
