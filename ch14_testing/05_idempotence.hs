-- Idempotence is property of function, when subsequent calls doesn't change the result.
-- Example is sort, once sorted, output of the function remains.
-- Check idempotence of following functions:
import Data.Char
import Data.List
import Test.QuickCheck

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

twice :: (a -> a) -> a -> a
twice f = f . f

fourTimes :: (a -> a) -> a -> a
fourTimes = twice . twice

-- 1.
f1 :: String -> Bool
f1 x = (capitalizeWord x == twice capitalizeWord x) &&
       (capitalizeWord x == fourTimes capitalizeWord x)

-- 2.
f2 :: String -> Bool
f2 x = (sort x == twice sort x) &&
       (sort x == fourTimes sort x)

test :: IO ()
test = do
    quickCheck f1
    quickCheck f2