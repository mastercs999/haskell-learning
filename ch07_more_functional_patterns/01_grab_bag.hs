-- 1. Which functions are equivalent?
--   a) mTh x y z = x * y * z
--   b) mTh x y = \z -> x * y * z
--   c) mTh x = \y -> \z -> x * y * z
--   d) mTh = \x -> \y -> \z -> x * y * z
-- All of them are equivalent.

-- 2. Type of mTh above is Num => a -> a -> a -> a. What is the type of mTh 3?
--   a) Integer -> Integer -> Integer
--   b) Num a => a -> a -> a -> a
--   c) Num a => a -> a
-- X d) Num a => a -> a -> a

-- 3.
--   a) Rewrite f function using lambda function
--      addOneIfOdd n = case odd n of
--          True -> f n
--          False -> n
--          where f n = n + 1 
addOneIfOdd n = case odd n of 
    True -> (\x -> x + 1) n
    False -> n

--    b) Rewrite this using lambda syntax
--       addFive x y = (if x > y then y else x) + 5
addFive = \x -> \y -> (if x > y then y else x) + 5

--    c) Rewrite this functions without anonymous lambda syntax
--       mflip f = \x -> \y -> f y x
mflip f x y = f y x