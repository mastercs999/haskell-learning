-- Fix incorrect code.

-- 1. Functions should add 1 to length of a string
-- x = (+)
-- F xs = w 'x' 1
--        where w = length xs
x = (+)
f xs = w `x` 1
       where w = length xs

-- 2. This should be identity function id
-- \ X = x
myId = \x -> x

-- 3. This should return 1 from [1, 2, 3]
-- \ x : xs -> x
myHead = \(x : xs) -> x

-- 4. This should return 1 from (1, 2)
-- f (a b) = A
myFst (a, b) = a