import Data.Char

-- 1. Query types of isUpper and toUpper
--    isUpper :: Char -> Bool
--    toUpper :: Char -> Char

-- 2. Write function which removes all lower character from strimg
removeLower :: String -> String
removeLower = filter isUpper

-- 3. Write a function for capitalization a string
capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x : xs

-- 4. Create function for converting string to uppercase
toUpperString :: String -> String
toUpperString [] = []
toUpperString (x:xs) = toUpper x : toUpperString xs

-- 5. Using head function create function which will capitalize first letter and returns that letter
getCapital :: String -> Maybe Char
getCapital [] = Nothing
getCapital xs = Just $ toUpper $ head xs

-- 6. Rewrite previous function using composing and then pointfree notation.
getCapital' :: String -> Maybe Char
getCapital' [] = Nothing
getCapital' xs = (Just . toUpper . head) xs

getCapital'' :: String -> Char
getCapital'' = toUpper . head