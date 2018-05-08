-- Does parentheses matter?

-- 1. YES
x  = 8 + 7 * 9
x' = (8 + 7) * 9

-- 2. NO
perimeter  x y = (x * 2) + (y * 2)
perimeter2 x y = x * 2 + y * 2

-- 3. YES
f  x = x / 2 + 9
f2 x = x / (2 + 9)