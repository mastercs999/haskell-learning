-- Determine kind of the types variables:

-- 1. a -> a
-- :k a == *

-- 2. a -> b a -> T (b, a)
-- :k b == *
-- :k T == * -> *

-- 3. c a b -> c b a
-- :k c == * -> * -> *