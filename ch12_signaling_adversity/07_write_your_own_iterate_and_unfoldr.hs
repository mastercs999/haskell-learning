-- 1. Write myIterate function using direct recursion. It should behave the same
--    as iterate
myIterate :: (a -> a) -> a -> [a]
myIterate f acc = acc : myIterate f (f acc)

-- 2. Write myUnfoldr function using direct recursion. It should behave the same
--    as unfoldr
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f start = case f start of
                        Nothing     -> []
                        Just (a, b) -> a : myUnfoldr f b

-- 3. Write myIterate into betterIterate using myUnfoldr.
betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\x -> Just (x, f x))