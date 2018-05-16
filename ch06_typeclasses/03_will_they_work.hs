-- Decide whether following snippets compile. Why? If yes, what do they return? And why?

-- 1. YES
x1 = max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
-- x1 == 5, because result of lengths is 3 and 5

-- 2. YES
x2 = compare (3 * 4) (3 * 5)
-- x2 == LT, because 12 < 15

-- 3. NO
-- compare "Julie" True
-- Cannot compare value of two different types

-- 4. YES
x4 = (5 + 3) > (3 + 6)
-- x4 == False, because this isn't true: 8 > 9