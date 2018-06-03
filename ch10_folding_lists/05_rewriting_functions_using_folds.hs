-- Write function definitions using folds

-- 1. or
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2. any
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

-- 3. Write two versions of elem - one with folding, second with any
myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr ((||) . (== e)) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' e = any (== e)

-- 4. reverse
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5. map using foldr
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6. filter using foldr
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr pass []
    where pass x y
               | f x = x : y
               | otherwise = y

-- 7. squish - flattens lists of lists into list
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8. squishMap - run a function over a list and concatenates results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

-- 9. squishAgain - same as squish, but use squishMap
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10. maximumBy
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f xs = foldr (\x y -> if f x y == GT then x else y) (last xs) xs

-- 11. minimumBy
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f = myMaximumBy (flip f)