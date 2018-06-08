{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

-- 1. Write instance of TooMany typeclass for (Int, String)
instance TooMany (Int, String) where
    tooMany (n, _) = tooMany n

-- 2. Make another TooMany instance for (Int, Int). You should sum them
instance TooMany (Int, Int) where
    tooMany (x, y) = tooMany $ x + y

-- 3. Make another TooMany instance for (Num a, TooMany a) => (a, a). Sum the numbers.
instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany (x, y) = tooMany $ x + y