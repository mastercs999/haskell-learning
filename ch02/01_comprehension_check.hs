-- 1. How would we enter given function in GHCi?
half x = x / 2
square x = x * x

-- Answer
-- let half x = x /2
-- let square x = x * x

-- 2. Write a function for following expressions
-- 3.14 * (5 * 5)
-- 3.14 * (10 * 10)
-- 3.14 * (2 * 2)
-- 3.14 * (4 * 4)
area r = 3.14 * r ^ 2

-- 3. Rewrite the area function to use pi constant
areaPi r = pi * r ^ 2
