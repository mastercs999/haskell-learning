-- Write a function by its type.

-- 1.
i :: a -> a
i x = x

-- 2.
c :: a -> b -> a
c x y = x

-- 3.
c'' :: b -> a -> b
c'' x y = x

-- 4.
c' :: a -> b -> b
c' x y = y

-- 5.
r :: [a] -> [a]
r x = take 5 x

-- 6.
co :: (b -> c) -> (a -> b) -> a -> c
co f1 f2 x = f1 $ f2 x

-- 7.
a :: (a -> c) -> a -> a
a f x = x

-- 8.
a' :: (a -> b) -> a -> b
a' f x = f x