-- Imeplement standard function by yourself

-- 1. or
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

-- 2. any
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

-- 3. elem, second version with any
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem x (y:ys) = x == y || myElem x ys

myElem' :: Eq a => a -> [a] -> Bool
myElem' _ [] = False
myElem' x ys = any (==x) ys

-- 4. reverse
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 5. squish - flattens a list of lists into list
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6. squishMap - maps a function over list and concatenates results
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7. squishAgain - flattens again, but using squishMap function
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8. myMaximumBy - take a function and lists. Returns greates element by the function
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []     = error "empty list"
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:xs)
            | f x restResult == GT = x
            | otherwise            = restResult
            where 
                restResult = myMaximumBy f xs

-- 9. myMinimumBy + write maximum and minimum using myMaximumBy and myMinimumBy
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f xs = myMaximumBy (flip f) xs

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare