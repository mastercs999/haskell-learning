-- What is the result of the expressions using these function definitions:
dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

-- So what is the result?
a1 = dodgy 1 0   -- 1 
a2 = dodgy 1 1   -- 11
a3 = dodgy 2 2   -- 22
a4 = dodgy 1 2   -- 21
a5 = dodgy 2 1   -- 12
a6 = oneIsOne 1  -- 11
a7 = oneIsOne 2  -- 21
a8 = oneIsTwo 1  -- 21
a9 = oneIsTwo 2  -- 22
a10 = oneIsOne 3 -- 31
a11 = oneIsTwo 3 -- 23
