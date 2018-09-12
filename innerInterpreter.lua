innerInterpreter=function(inThread)
	IP={thread=inThread, index=1}
	while IP.index<=#IP.thread do
		local word=IP.thread[IP.index]; IP.index=IP.index+1; word.code()
	end
end
