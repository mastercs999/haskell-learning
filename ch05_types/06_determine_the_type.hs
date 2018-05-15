{-# LANGUAGE NoMonomorphismRestriction #-}

-- 1. Determine type of these values
a1 = (* 9) 6
-- 54 :: Num a => a     
a2 = head [(0, "doge"), (1, "kitteh")]
-- (0, "doge") :: Num a => (a, [Char])
a3 = head [(0 :: Integer, "doge"), (1, "kitteh")]
-- (0, "doge") :: (Integer, [Char])
a4 = if False then True else False
-- False :: Bool
a5 = length [1, 2, 3, 4, 5]
-- 5 :: Int
a6 = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- False :: Bool

-- 2. What is type of w?
x1 = 5
y1 = x1 + 5
w = y1 * 10
-- w :: Num a => a

-- 3. What is type of z2?
x2 = 5
y2 = x2 + 5
z2 y = y * 10
-- z2 :: Num a => a -> a

-- 4. What is type of f3?
x3 = 5
y3 = x3 + 5
f3 = 4 / y3
-- f3 :: Fractional a => a

-- 5. What is type of f4?
x4 = "Julie"
y4 = " <3 "
z4 = "Haskell"
f4 = x4 ++ y4 ++ z4
-- f4 :: [Char]

