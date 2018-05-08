-- 1. Write function for given expected results. Use take and drop functions.

-- Given "Curry is awesome" returns "Curry is awesome!"
a1 = "Curry is awesome" ++ "!"

-- Given "Curry is awesome!" returns "y"
a2 = "Curry is awesome!" !! 4

-- Given "Curry is awesome!" returns "awesome!"
a3 = drop 9 "Curry is awesome!"


-- 2. Rewrite expression above to work as a function with string as an argument
f1 x = x ++ "!"
f2 x = x !! 4
f3 x = drop 9 x


-- 3. Write a function of type String -> Char returning the third character of a string.
thirdLetter :: String -> Char
thirdLetter x = x !! 2

-- 4. Now modify the function so the string is always "Curry is awesome!" and character number is the argument
letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! (x + 1)

-- 5. Using take and drop functions write a function called rvrs (reverse). It takes the
--    string "Curry is awesome" and returns "awesome is Curry". It's OK it will be ugly code.
rvrs :: String -> String
rvrs x = third ++ " " ++ second ++ " " ++ first where
    first = take 5 x
    second = take 2 $ drop 6 x 
    third = drop 9 x

-- 6. Define the rvrs function in a module and use it in main
-- module Reverse where
-- rvrs ::
-- rvrs x = 
-- 
-- main :: IO ()
-- main = print $ rvrs "Curry is awesome"

