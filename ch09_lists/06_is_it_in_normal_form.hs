-- Determine whether expressions are
-- a) normal form (implies weak head normal form)
-- b) weak head normal form only
-- c) neither

-- 1. a 
-- [1, 2, 3, 4, 5]

-- 2. b
-- 1 : 2 : 3 : 4 : _

-- 3. c
-- enumFromTo 1 10

-- 4. c
-- length [1, 2, 3, 4, 5]

-- 5. c
-- sum (enumFromTo 1 10)

-- 6. c
-- ['a'..'m'] ++ ['n'..'z']

-- 7. b
-- (_, 'b')