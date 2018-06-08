-- Implement Vigenere cipher. The message is represeneted by sequence of a keyword.
-- Let's say message is: MEET AT DAWN and keyword is ALLY. Then
-- MEET AT DAWN
-- ALLY AL LYAL
-- Now the keyword character determines right shift. First is 'A', so M is
-- shifted by 0. Next L is 11, so E is shifted by 11.
-- Result in this case should be:
-- MPPR AE OYWY

import Data.Char

generateInfinite :: String -> String
generateInfinite = concat . repeat

shift :: (Int -> Int -> Int) -> String -> String -> String
shift _ [] _                    = []
shift f (' ':xs) keyword@(_:ys) = ' '       : shift f xs keyword
shift f (x:xs) (y:ys)           = codedChar : shift f xs ys
    where
        aord = ord 'A'
        span = ord 'Z' - aord + 1
        diff = ord y - aord
        codedChar = chr . (+ aord) . (flip mod span) . (+ span) . (flip f diff) . (subtract aord) . ord $ x

code :: String -> String -> String
code msg keyword = shift (+) msg (generateInfinite keyword)

decode :: String -> String -> String
decode msg keyword = shift (-) msg (generateInfinite keyword)
