-- Determine, whether type variables in given function type are:
--  - fully polymorphic type variable
--  - constrained polymorphic type variable
--  - concrete type constructor

-- 1.
-- f :: Num a => a -> b -> Int -> Int
--               Constrained -> Fully polymorphic -> Concrete -> Concrete

-- 2.
-- f :: zed -> Zed -> Blah
--      Fully polymorphic -> Concrete -> Concrete

-- 3.
-- f :: Enum b => a -> b -> C
--                Fully polymorphic -> Constrained -> Concrete

-- 4.
-- f :: f -> g -> C
--      Fully polymorphic -> Fully polymorphic -> Concrete