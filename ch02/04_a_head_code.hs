-- Determine what the expression returns and rewrite it using where keyword

-- 1. Returns 5
-- let x = 5 in x
y1 = x where x = 5

-- 2. Returns 25
-- let x = 5 in x * x
y2 = x * x where x = 5

-- 3. Returns 30
-- let x = 5; y = 6 in x * y
y3 = x * y where
    x = 5
    y = 6

-- 4. Returns 6
-- let x = 3; y = 1000 in x + 3
y4 = x + 3 where
    x = 3
    y = 1000