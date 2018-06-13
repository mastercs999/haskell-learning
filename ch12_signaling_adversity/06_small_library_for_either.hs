-- Write functions by their type

-- 1.
lefts' :: [Either a b] -> [a]
lefts' = foldr f []
            where f (Left a) xs = a : xs
                  f _        xs = xs

-- 2.
rights' :: [Either a b] -> [b]
rights' = foldr f []
            where f (Right b) xs = b : xs
                  f _         xs = xs

-- 3.
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

-- 4.
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just $ f b

-- 5.
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' fa _ (Left a)  = fa a
either' _ fb (Right b) = fb b

-- 6.
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just .f)