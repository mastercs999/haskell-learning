-- You are given two function.
-- Second one is the first one, but partially or fully applied. Find
-- out, how the type of first one differs from type of second one.

-- 1.
-- (++) :: [a] -> [a] -> [a]
myConcat x = x ++ " yo"
-- The type of myConcat is [Char] -> [Char]

-- 2.
-- (*) :: Num => a -> a -> a
myMult x = (x / 3) * 5
-- The type of myMult is Fractional => a -> a

-- 3.
-- take :: Int -> [a] -> [a]
myTake x = take x "hey you"
-- The type of myTake is Int -> [Char]

-- 4.
-- (>) :: Ord => a -> a -> Bool
myCom x = x > (length [1..10])
-- The type of myCom is Int -> Bool

-- 5.
-- (<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'
-- The type of myAlph is Char -> Bool