-- Will following pairs of expressions return the same result?

-- 1. YES
a1 = 1 + 1
a2 = 2

-- 2. YES
b1 = 10 ^ 2
b2 = 10 + 9 * 10

-- 3. NO
c1 = 400 - 37
c2 = (-) 37 400

-- 5. NO
d1 = 100 `div` 3
d2 = 100 / 3

-- 6. NO
e1 = 2 * 5 + 18
e2 = 2 * (5 + 18)
