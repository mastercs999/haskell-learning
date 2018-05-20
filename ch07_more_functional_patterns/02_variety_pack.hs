-- 1. Anwser the questions for following snippet:
k (x, y) = x
k1 = k ((4 - 1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)
-- a) What is the type of k?
--    (a, b) -> a
-- b) What is the type of k2? Is it the same as k1 or k3?
--    k2 :: [Char],   it is not the same type as either k1 or k3.
-- c) Of k1, k2, k3, which will returns 3 as the result?
--    k1, k3

-- 2. Write definition of the function by its type.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c, f))