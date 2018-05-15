-- 1. Given the type a -> a which is type of id function, try to create a function with different behavior.
--    It is impossible, because unknown type has no functions attached to it.

-- 2. Write both possible functions for function of type a -> a -> a
f x y = x
f x y = y

-- 3. Implement all possible functions of type a -> b -> b
g x y = y
-- Does the behavior change when types of a b change?
-- No, the function just returns second value.