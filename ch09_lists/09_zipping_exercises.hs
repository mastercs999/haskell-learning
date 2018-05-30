-- 1. Write your own version of zip
myZip :: [a] -> [b] -> [(a, b)]
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

-- 2. Write your own version of zipWith
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

-- 3. Rewrite your zip using myZipWith
myZip' :: [a] -> [b] -> [(a, b)]
myZip' = myZipWith (,)