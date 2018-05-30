-- Write your own implementations of enumFromTo for given types of functions.
-- Don't use ranges.

generate :: (Enum a, Ord a) => a -> a -> [a]
generate start end
        | start == end = [start]
        | start > end  = []
        | otherwise    = [start] ++ generate (succ start) end 

eftBool :: Bool -> Bool -> [Bool]
eftBool = generate

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = generate

eftInt :: Int -> Int -> [Int]
eftInt = generate

eftChar :: Char -> Char -> [Char]
eftChar = generate