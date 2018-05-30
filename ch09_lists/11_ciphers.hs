import Data.Char

-- Create a function for encryption and decryption caesar cipher.
-- Cipher is simple: shift every character by specified number of characters
-- Let's take 3 as a key: a -> d, b -> e, ..., z -> c
-- Implement just rightwards version. 

shift :: Int -> Char -> Char
shift n c = chr . (+start) . (flip mod range) . (+range) . (+n) . (subtract start) . ord $ c
    where range = ord 'z' - ord 'a' + 1
          start 
                | isUpper c = ord 'A'
                | otherwise = ord 'a'

caesar :: Int -> String -> String
caesar _ [] = []
caesar n (x:xs) = shift n x : caesar n xs

unCaesar :: Int -> String -> String
unCaesar _ [] = []
unCaesar n (x:xs) = shift (-n) x : unCaesar n xs
        