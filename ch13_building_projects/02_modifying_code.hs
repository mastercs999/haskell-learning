import Data.Char
import Text.Read (readMaybe)
import Control.Monad (forever)
import System.Exit (exitSuccess)

-- 1. Modify Caesar and Vigener ciphers to work with user input:
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

textInput :: String -> IO String
textInput name = do
    putStr $ "Write " ++ name ++ ": "
    msg <- getLine
    return msg

offset :: IO Int
offset = do
    putStr "Write shift number: "
    n <- getLine
    case readMaybe n :: Maybe Int of
        (Just num) -> return num
        _          -> do
            putStrLn "Not a number, try again."
            offset

caesar' :: IO String
caesar' = do
    msg <- textInput "message"
    n   <- offset
    return $ caesar n msg

unCaesar' :: IO String
unCaesar' = do
    hash <- textInput "coded word"
    n    <- offset
    return $ unCaesar n hash



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
code msg keyword = shift' (+) msg (generateInfinite keyword)

decode :: String -> String -> String
decode msg keyword = shift' (-) msg (generateInfinite keyword)

vigener :: IO String
vigener = do
    msg     <- textInput "message"
    keyword <- textInput "keyword"
    return $ code msg keyword

unVigener :: IO String
unVigener = do
    hash    <- textInput "coded word"
    keyword <- textInput "keyword"
    return $ decode hash keyword


-- 2. Adjust following code which runs forever to exit after False result
palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    case (line1 == reverse line1) of
        True  -> putStrLn "It's a palindrome!"
        False -> putStrLn "Nope!"

palindrome' :: IO ()
palindrome' = forever $ do
    line1 <- getLine
    case (line1 == reverse line1) of
        True  -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess

-- 3. Make palindrome function work on sentences like Madam I'm Adam.
normalize :: String -> String
normalize = (filter isLetter . map toLower . concat . words)

palindrome'' :: IO ()
palindrome'' = forever $ do
    line1 <- getLine
    case (normalize line1 == (reverse . normalize) line1) of
        True  -> putStrLn "It's a palindrome!"
        False -> putStrLn "Nope!"

-- 4. Write function gimmePerson using this code. It should print and error
--    in case of invalid person. If valid person, it prints the person.
type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
         | name /= "" && age > 0 = Right $ Person name age
         | name == ""            = Left NameEmpty
         | not (age > 0)         = Left AgeTooLow
         | otherwise             = Left $ PersonInvalidUnknown $
                                          "Name was: " ++ show name ++
                                          " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
    putStr "Write name: "
    name <- getLine
    putStr "Write age: "
    age <- getLine
    case mkPerson name (read age :: Integer) of
        Left invalidPerson -> putStrLn $ "Error: " ++ show invalidPerson
        Right person       -> putStrLn $ "We've got it: " ++ show person
