-- Match function with its type

-- 1. show
-- a) show a => a -> String
-- b) Show a -> a -> String
-- c) Show a => a -> String    THIS

-- 2. (==)
-- a) a -> a -> Bool
-- b) Eq a => a -> a -> Bool    THIS
-- c) Eq a -> a -> a -> Bool

-- 3. fst
-- a) (a, b) -> a    THIS
-- b) b -> a
-- c) (a, b) -> b

-- 4. (+)
-- a) (+) :: Num a -> a -> a -> Bool
-- b) (+) :: Num a => a -> a -> Bool
-- c) (+) :: num a => a -> a -> a
-- d) (+) :: Num a => a -> a -> a    THIS
-- e) (+) :: a -> a -> a