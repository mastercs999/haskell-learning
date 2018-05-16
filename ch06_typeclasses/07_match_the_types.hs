import Data.List (sort)

-- Decide, whether we can use second type instead of the first one.

-- 1. No, it must be restricted to Num a
-- i :: Num a => a
-- i = 1
-- i :: a

-- 2. No, Num is too general. It also contains Int (for example).
-- f :: Float
-- f = 1.0
-- f :: Num a => a

-- 3. Yes
-- f :: Float
-- f = 1.0
-- f :: Fractional a => a
f :: Fractional a => a
f = 1.0

-- 4. Yes
-- f' :: Float
-- f' = 1.0
-- f' :: RealFrac a => a
f' :: RealFrac a => a
f' = 1.0

-- 5. Yes
-- freud :: a -> a
-- freud x = x
-- freud :: Ord a => a -> a
freud :: Ord a => a -> a
freud x = x

-- 6. Yes
-- freud' :: a -> a
-- freud' x = x
-- freud' :: Int -> Int
freud' :: Int -> Int
freud' x = x

-- 7. No, sigmund cannot returns String for example
-- myX = 1 :: Int
-- sigmund :: Int -> Int
-- sigmund x = myX
-- sigmund :: a -> a

-- 8. No, sigmund cannot returns 3.5 for example
-- myX = 1 :: Int
-- sigmund' :: Int -> Int
-- sigmund' x = myX
-- sigmund' :: Num a => a -> a

-- 9. Yes
-- jung :: Ord a => [a] -> a
-- jung xs = head (sort xs)
-- jung :: [Int] -> Int
jung :: [Int] -> Int
jung xs = head (sort xs)

-- 10. Yes
-- young :: [Char] -> Char
-- young xs = head (sort xs)
-- young :: Ord a => [a] -> a
young :: Ord a => [a] -> a
young xs = head (sort xs)

-- 11. No, mySort works for Char lists only
-- mySort :: [Char] -> [Char]
-- mySort = sort
--
-- signifier :: [Char] -> Char
-- signifier xs = head (mySort xs)
-- signifier :: Ord a => [a] -> a



