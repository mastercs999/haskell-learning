-- Write definition of digitToWord, digits and wordNumber functions.
-- digitToWord should return word representation of a digit (1 == "one")
-- digits should extract digits from a number (234 == [2, 3, 4])
-- wordNumber should return string represenation of a number (234 == "two-three-four")

module WordNumber where

    import Data.List (intersperse)

    digitToWord :: Int -> String
    digitToWord 0 = "zero"
    digitToWord 1 = "one"
    digitToWord 2 = "two"
    digitToWord 3 = "three"
    digitToWord 4 = "four"
    digitToWord 5 = "five"
    digitToWord 6 = "six"
    digitToWord 7 = "seven"
    digitToWord 8 = "eight"
    digitToWord 9 = "nine"
    digitToWord _ = error "Function can be called with single digit only"

    digits :: Int -> [Int]
    digits n
           | n < 10 = [n]
           | otherwise = (digits $ div n 10) ++ [mod n 10] 

    wordNumber :: Int -> String
    wordNumber = concat . intersperse "-" . map digitToWord . digits