-- usage:
-- 		cd tinyLuaForth
-- 		lua
-- 		dofile "util/test_outerInterpreter.lua"

dofile "outerInterpreter.lua"
dofile "tinyDict.lua"

-- 25
-- nil
outerInterpreter("5 dup * . cr")

-- nil
outerInterpreter(": fact dup 1 > if dup 1 - fact * then ;")

-- 120
-- nil
outerInterpreter("5 fact . cr")

