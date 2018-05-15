{-# LANGUAGE NoMonomorphismRestriction #-}

-- Find out type of the result of function application.

-- 1) 
f :: a -> a -> a -> a; f = undefined
x :: Char; x = undefined
a1 = f x
-- X a) Char -> Char -> Char
--   b) x -> x -> x -> x
--   c) a -> a -> a
--   d) a -> a -> a -> Char

-- 2)
g :: a -> b -> c -> b; g = undefined
a2 = g 0 'c' "woot"
--   a) String
--   b) Char -> String
--   c) Int
-- X d) Char

-- 3)
h :: (Num a, Num b) => a -> b -> b; h = undefined
a3 = h 1.0 2
--   a) Double
--   b) Integer
--   c) Integral b => b
-- X d) Num b => b

-- 4)
a4 = h 1 (5.5 :: Double)
--   a) Integer
--   b) Fractional b => b
-- X c) Double
--   d) Num b => b

-- 5)
jackal :: (Ord a, Eq b) => a -> b -> a; jackal = undefined
a5 = jackal "keyboard" "has the word jackal in it"
-- X a) [Char]
--   b) Eq b => b
--   c) b -> [Char]
--   d) b
--   e) Eq b => b -> [Char]

-- 6)
-- a6 = jackal "keyboard"
--   a) b
--   b) Eq b => b
--   c) [Char]
--   d) b -> [Char]
-- X e) Eq b => b -> [Char]

-- 7)
kessel :: (Ord a, Num b) => a -> b -> a; kessel = undefined
a7 = kessel 1 2
--   a) Integer
--   b) Int
--   c) a
-- X d) (Num a, Ord a) => a
--   e) Ord a => a
--   f) Num a => a

-- 8)
a8 = kessel 1 (2 :: Integer)
-- X a) (Num a, Ord a) => a
--   b) Int
--   c) a
--   d) Num a => a
--   e) Ord a => a
--   f) Integer

-- 9)
a9 = kessel (1 :: Integer) 2 :: Integer
--   a) Num a => a
--   b) Ord a => a
-- X c) Integer
--   d) (Num a, Ord a) => a
--   e) a