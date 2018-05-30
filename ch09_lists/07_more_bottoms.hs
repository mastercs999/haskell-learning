import Data.Bool

-- 1. Will it return a value or fails?
a1 = take 1 $ map (+1) [undefined, 2, 3]
-- Fails

-- 2. Will it return a value or fails?
a2 = take 1 $ map (+1) [1, undefined, 3]
-- Returns a value

-- 3. Will it return a value or fails?
a3 = take 2 $ map (+1) [1, undefined, 3]
-- Fails

-- 4. What does this function do? What is it's type?
itIsMystery xs = map (\x -> elem x "aeiou") xs
-- itIsMystery :: [Char] -> [Bool]
-- Replace every character in given string with a bool indicating whether
-- the character was a vowel or not

-- 5. What are the results of following expressions?
a4a = map (^2) [1..10]
-- [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

a4b = map minimum [[1..10], [10..20], [20..30]]
-- [1, 10, 20]

a4c = map sum [[1..5], [1..5], [1..5]]
-- [15, 15, 15]

-- 6. Given a function: map (\x -> if f == 3 then (-x) else (x))
--    Write the same function, but use bool function instead of if-then-else
negate3 = map (\x -> bool x (-x) (x == 3))