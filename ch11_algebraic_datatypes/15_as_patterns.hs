-- Use as-pattern for implementation
import Data.Char

-- 1. Should return true if all values in the first list are also in the second list
isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf (x:xs) ya@(y:ys) = (x == y || isSubsequenceOf [x] ys) && isSubsequenceOf xs ya

-- 2. Split a sentence into words and then tuple each word with its capitalized form
capitalizeWords :: String -> [(String, String)]
capitalizeWords [] = []
capitalizeWords sentence = map (\xs@(x:xss) -> (xs, toUpper x : xss)) . words $ sentence 