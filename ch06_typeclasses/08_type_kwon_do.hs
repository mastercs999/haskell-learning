-- Write function definitions

-- 1.
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f x y = f x == y

-- 2.
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x y = (fromInteger x) * (f y)