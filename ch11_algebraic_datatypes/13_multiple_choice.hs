-- 1. What is true?
data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
-- a) X Weekday is a type with five data constructors
-- b)   Weekday is a tree with five branches
-- c)   Weekday is a product type
-- d)   Weekday takes five arguments

-- 2. What is the type of this function?
f Friday = "Miller Time"
-- a)   f :: [Char]
-- b)   f :: String -> String
-- c) X f :: Weekday -> String
-- d)   f :: Day -> Beer

-- 3. Types defined with data keyword:
-- a)   must have at least one argument
-- b) X must begin with a capital letter
-- c)   must be polymorphic
-- d)   cannot be imported from modules

-- 4. Functions g:
g xs = xs !! (length xs - 1)
-- a)   is a recursive and may not terminate
-- b)   delivery the head of xs
-- c) X delivers the final element of xs
-- d)   has the same type as xs