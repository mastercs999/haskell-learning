fibs :: Integral a => [a]
fibs = 1 : scanl (+) 1 fibs

fibsN :: Integral a => Int -> a
fibsN x = fibs !! x

-- 1. Modify fibs function to return only 20 fibonacci numbers
fibs' :: Integral a => [a]
fibs' = (take 20 . (1:) . (scanl (+) 1)) fibs'

-- 2. Modify fibs to return only fibonacci numbers less than 100
fibs'' :: Integral a => [a]
fibs'' = (takeWhile (<100) . (1:) . (scanl (+) 1)) fibs''

-- 3. Write factorial function using scanl.
fact :: Integral a => [a]
fact = (take 20 . scanl (*) 1) [2..]