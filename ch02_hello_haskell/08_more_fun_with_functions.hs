-- Rewrite this code to be usable in REPL (console).
-- It means, the order matters.

-- z = 7
-- x = y ^ 2
-- waxOn = x * 5
-- y = z + 8
z = 7
y = z + 8
x = y ^ 2
waxOn = x * 5

-- 1.
-- What will be the result of following expressions?
-- From the commands above the waxOn is 1125

-- 1135
a1 = 10 + waxOn

-- 1135
a2 = (+10) waxOn

-- -1120
a3 = (-) 15 waxOn

-- 1120
a4 = (-) waxOn 15

-- 2.
-- Define function triple 
triple x = x * 3

-- 3.
-- What will happen when calling function triple on waxOn?
-- triple function will be called with argument of 1125, which is waxOn's value
-- So the result will be 1125 * 3 = 3375
a5 = triple waxOn

-- 4.
-- Rewrite waxOn as an expression with where clause
waxOn2 = x * 5 where
    x = y ^ 2
    y = z + 8
    z = 7

-- 5.
-- Nothing important, just rewriting code from console to source file

-- 6.
-- Define function waxOff
waxOff x = triple x

-- 7.
-- What is the result of waxOff 10 or waxOff (-50)

-- 30
a6 = waxOff 10

-- -150
a7 = waxOff (-50)
