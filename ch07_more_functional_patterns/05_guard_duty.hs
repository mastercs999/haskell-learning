avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
         | y >= 0.9  = 'A'
         | y >= 0.8  = 'B'
         | y >= 0.7  = 'C'
         | y >= 0.59 = 'D'
         | y < 0.59  = 'F'
         where y = x / 100

-- 1. What happens if otherwise will be first in avgGrade?
avgGrade2 x
    | otherwise = 'F'
    | x >= 0.9  = 'A'
    | x <  0.9  = 'B'
-- It will always return 'F'

-- 2. What will happen if order in avgGrade will be different? Try to move y >= 0.7 to the top.
avgGrade3 x
    | y >= 0.7  = 'C'
    | y >= 0.9  = 'A'
    | y >= 0.8  = 'B'
    | y >= 0.59 = 'D'
    | y < 0.59  = 'F'
    where y = x / 100
-- It will return 'C' for all above 0.7. Otherwise it will behave the same.

-- 3. What returns function pal?
pal xs
    | xs == reverse xs = True
    | otherwise        = False
--   a) xs written backwards when it's True
-- X b) True when xs is a palindrome
--   c) False when xs is a palindrome
--   d) False when xs is reversed

-- 4. What types of arguments can pal take?
-- Lists

-- 5. What is the type of function pal?
-- pal :: (Eq a) => [a] -> Bool

-- 6. What does the numbers function return?
numbers x
    | x < 0  = -1
    | x == 0 = 0
    | x > 0  = 1
--   a) the value of its argument plus or minus 1
--   b) the negation of its argument
-- X c) an indication of whether its arguments is a positive or negative
--      number or zero
--   d) binary machine language

-- 7. What types of argument can numbers take?
-- Numbers

-- 8. What is the type of function numbers?
-- numbers :: (Ord a, Num a, Num b) => a -> b