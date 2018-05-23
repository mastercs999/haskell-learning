-- Fix old implementation of dividedBy to handle negative numbers and zero correctly
-- Here is the old implementation:
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

-- New implementation:
data DividedResult = Result Integer | DividedByZero deriving Show

dividedByFixed :: Integral a => a -> a -> DividedResult
dividedByFixed num 0 = DividedByZero
dividedByFixed num denom = (Result . toInteger .  (*) (signum denom)) result
                           where result = fst $ dividedBy (abs num) (abs denom)