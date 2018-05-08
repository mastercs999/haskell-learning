-- 1. Is y in scope for z in those lines from REPL?
-- let x = 5
-- let y = 7
-- let z = x * y
-- YES, y is defined and THEN used

-- 2. Is h in scope for g in those lines from REPL?
-- let f = 3
-- let g = 6 * f + h
-- NO, h is not defined

-- 3. Is everything we need to execute area in scope?
-- area d = pi * (r * r)
-- r = d /2
-- NO, d is undefined (not in scope of area)

-- 4. Is r and d in scope for area?
area d = pi * (r * r)
  where r = d / 2
-- YES