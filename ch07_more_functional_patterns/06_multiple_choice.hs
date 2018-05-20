-- 1. A polymorphic function:
--   a) changes things into sheep when invoked
--   b) has multiple arguments
--   c) has a concrete type
-- X d) may resolve to values of different types, depending on inputs

-- 2. We have two functions. f :: Char -> String and g :: String -> [String].
--    What is type of composed function g . f
--   a) Char -> String
-- X b) Char -> [String]
--   c) [[String]]
--   d) Char -> String -> [String]

-- 3. We have a function f :: Ord a => a -> a -> Bool. We apply it to one
--    numeric value. What is the type now?
--   a) Ord a => a -> Bool
--   b) Num -> Num -> Bool
--   c) Ord a => a -> a -> Integer
-- X d) (Ord a, Num a) => a -> Bool

-- 4. A function with type (a -> b) -> c
--   a) requires values of three different types
-- X b) is a higher-order function
--   c) must take a tuple as its first argument
--   d) has its parameters in alphabetical order

-- 5. We have a function f as defined below. What is the type of f True?
f :: a -> a
f x = x
-- X a) f True :: Bool
--   b) f True :: String
--   c) f True :: Bool -> Bool
--   d) f True :: a