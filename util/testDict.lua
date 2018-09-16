local dataStack,returnStack={},{}
local makePush=function(t) return function(v) table.insert(t,v) end end
local makePop =function(t) return function() return table.remove(t) end end
DS={Push=makePush(dataStack),   Pop=makePop(dataStack)}
RS={Push=makePush(returnStack), Pop=makePop(returnStack)}
Dict={}
Dict.Add=function(inWord) Dict[inWord.name]=inWord end
docol=function() local newThread=IP.thread[IP.index-1].param
	RS.Push(IP); IP={thread=newThread,index=1} end
readIP=function() return IP.thread[IP.index] end
incIP=function() IP.index=IP.index+1 end
Dict.Add { name="semis", code=function() IP=RS.Pop() end }
Dict.Add { name="lit", code=function() DS.Push(readIP()); incIP() end }
Dict.Add { name="*",
	code=function() local a,b=DS.Pop(),DS.Pop(); DS.Push(a*b) end }
Dict.Add { name="dup",
	code=function() local t=DS.Pop(); DS.Push(t); DS.Push(t) end }
Dict.Add { name=".", code=function() io.write(DS.Pop()); io.write(" ") end }
Dict.Add { name="cr", code=function() print() end }
Dict.Add { name="square", code=docol,
	param={Dict["dup"], Dict["*"], Dict["semis"]} }
