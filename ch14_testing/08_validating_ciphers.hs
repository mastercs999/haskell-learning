-- Test Casear and Vigenere ciphers

import Data.Char
import Test.Hspec

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





generateInfinite :: String -> String
generateInfinite = concat . repeat

shift' :: (Int -> Int -> Int) -> String -> String -> String
shift' _ [] _                    = []
shift' f (' ':xs) keyword@(_:ys) = ' '       : shift' f xs keyword
shift' f (x:xs) (y:ys)           = codedChar : shift' f xs ys
    where
        aord = ord 'A'
        span = ord 'Z' - aord + 1
        diff = ord y - aord
        codedChar = chr . (+ aord) . (flip mod span) . (+ span) . (flip f diff) . (subtract aord) . ord $ x

code :: String -> String -> String
code keyword msg = shift' (+) msg (generateInfinite keyword)

decode :: String -> String -> String
decode keyword msg = shift' (-) msg (generateInfinite keyword)



test :: IO ()
test = hspec $ do
    describe "caesar" $ do
        it "check hello" $ do
            (unCaesar 5 . caesar 5) "hello" `shouldBe` "hello"
        it "check parassaasd" $ do
            (unCaesar 520. caesar 520) "parassaasd" `shouldBe` "parassaasd"

    describe "vigenere" $ do
        it "check HELLO" $ do
            (decode "AGF" . code "AGF") "HELLO" `shouldBe` "HELLO"
        it "check POKOLO" $ do
            (decode "AGFAFEWWE" . code "AGFAFEWWE") "POKOLO" `shouldBe` "POKOLO"