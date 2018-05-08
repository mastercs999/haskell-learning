-- Define some expressions
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The simons"]
allAwesome = [awesome, alsoAwesome]

-- 1. Function length returns number of items in the list.
--    What is it's type signature? 
--    How many arguments does it take?
--    What's the type of its result?
--    Using :i length we found out answers:
--    [a] -> Int
--    1 argument
--    Int


-- 2. What are results of these expressions?

-- a) 5
a1 = length [1, 2, 3, 4, 5]

-- b) 3
a2 = length [(1, 2), (2, 3), (3, 4)]

-- c) 2
a3 = length allAwesome

-- d) 5
a4 = length (concat allAwesome)


-- 3. Determine which expressions gives an error and why.
-- 6 / 3
-- 6 / length [1, 2, 3]
-- The second one. Because we divide (/) works with Franctionals, but length returns Int


-- 4. Fix previous error expression using differen division operator
b1 = 6 `div` length [1, 2, 3]


-- 5. What is type of 2 + 3 == 5 expressions? What is its result?
-- Its Bool type and output is True
b2 = 2 + 3 == 5


-- 6. Again. What is result and what type is it?
-- let x = 5
-- x + 3 == 5
-- Output type its Bool and result is False
x = 5
b3 = x + 3 == 5


-- 7. Decide whether following expressions are OK. If yes, what is their result?

-- length allAwesome == 2
-- YES, result is True
c1 = length allAwesome == 2

-- length [1, 'a', 3, 'b']
-- NO, cannot have list with elements of different type

-- length allAwesome + length awesome
-- YES, result is 5
c3 = length allAwesome + length awesome

-- (8 == 8) && ('b' < 'a')
-- YES, result is False
c4 = (8 == 8) && ('b' < 'a')

-- (8 == 8) && 9
-- NO, 9 is not of Bool type


-- 8. Write a function which returns True if given string is palindrome.
--    It is adviced to use reverse function
isPalindrome :: String -> Bool
isPalindrome x = x == reverse x


-- 9. Write a function which returns absolute value of a number. Use if-then-else.
myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else -x


-- 10. Fill definition of following functions using fst and snd
--     f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))