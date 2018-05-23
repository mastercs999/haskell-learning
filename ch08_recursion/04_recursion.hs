-- 1. Write down steps of dividedBy 15 2
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)
-- dividedBy 15 2
--   go 15 2 0
--     go 13 2 1
--       go 11 2 2
--         go 9 2 3
--           go 7 2 4
--             go 5 2 5
--               go 3 2 6
--                 go 1 2 7
--                 (7, 1)
--               (7, 1)
--             (7, 1)
--           (7, 1)
--         (7, 1)
--       (7, 1)
--     (7, 1)
--   (7, 1)
-- (7, 1)

-- 2. Write resursive functions which sums numbers from 1 to n.
sumN :: (Eq a, Num a) => a -> a
sumN 0 = 0
sumN n = n + (sumN $ n - 1)

-- 3. Write a function that multiples two numbers using recursive addition.
myMul :: (Integral a) => a -> a -> a
myMul x y
      | y == 1 = x
      | y > 1 = x + (myMul x $ y - 1)
      | otherwise = 0