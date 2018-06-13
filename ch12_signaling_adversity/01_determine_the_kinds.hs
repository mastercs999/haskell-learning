-- Determine kinds.

-- 1. Kind of a?
-- id :: a -> a
-- Kind of a is *

-- 2. Kinf of a and f?
r :: a -> f a
r = undefined
-- Kind of a is *
-- Kinf of f is * -> *