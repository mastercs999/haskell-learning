-- Rewrite the expressions with where keyword

-- 1.
-- let x = 3; y = 1000 in x * 3 + y
y1 = x * 3 + y where
    x = 3
    y = 1000

-- 2.
-- let y = 10; x = 10 * 5 + y in x * 5
y2 = x * 5 where
    x = 10 * 5 + y
    y = 10

-- 3.
-- let x = 7; y = negate x; z = y * 10 in z / x + y
y3 = z / x + y where
    x = 7
    y = negate x
    z = y * 10