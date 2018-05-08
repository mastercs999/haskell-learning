-- Decide whether following expressions compile. If not, fix them.

-- 1. NO
-- not True && true
a1 = not True && True

-- 2. NO
-- not (x = 6)
x = 3
a2 = not (x == 6)

-- 3. YES
-- (1 * 2) > 5
a3 = (1 * 2) > 5

-- 4. NO
-- [Merry] > [Happy]
a4 = ["Merry"] > ["Happy"]

-- 5. No
-- [1, 2, 3] ++ "look at me!"
a5 = ['1', '2', '3'] ++ "look at me!"