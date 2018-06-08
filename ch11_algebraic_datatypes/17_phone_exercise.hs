-- We're going to write a function, which translates string into sequence
-- of phone keys presses and vice versa. So:
-- 2     -> 'A'
-- 22    -> 'B'
-- 222   -> 'C'
-- 2222  -> '2'
-- 22222 -> 'A' 
-- * capitalizes next character
-- 0 is spacebar

-- 1. Define data
import Data.Char
import Data.List
import Data.Maybe

data DaPhone = DaPhone [Button] deriving (Eq, Show)
data Button = Button Digit String deriving (Eq, Show)
type Digit = Char
type Presses = Int

phone = DaPhone 
    [
        Button '2' "abc2",
        Button '3' "def3",
        Button '4' "ghi4",
        Button '5' "jkl5",
        Button '6' "mno6",
        Button '7' "pqrs7",
        Button '8' "tuv8",
        Button '9' "wxyz9",
        Button '0' " "
    ]

convo :: [String]
convo =
    ["Wanna play 20 questions",
     "Ya",
     "U 1st haha",
     "Lol ok. Have u ever tasted alcohol lol",
     "Lol ya",
     "Wow ur cool haha. Ur turn",
     "Ok. Do u think I am pretty Lol",
     "Lol ya",
     "Haha thanks just making sure rofl ur turn"]

-- 2. Convert text into presses
findButton :: [Button] -> Char -> Button
findButton (b@(Button d text):xs) c
            | elem c text = b
            | otherwise   = findButton xs c

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone@(DaPhone buttons) c 
            | isUpper c = ('*', 1) : (reverseTaps phone $ toLower c)
            | otherwise = [(digit, (+1) . fromJust . elemIndex c $ text)]
                where (Button digit text) = findButton buttons c 

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone = concat . map (reverseTaps phone)

-- 3. How many times we need to press something
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

-- 4. Most popular letter
occurrences ::Eq a => a -> [a] -> Int
occurrences c = foldr (\ch n -> if ch == c then n + 1 else n) 0

mostPopular :: (Eq a, Ord a) => [a] -> a
mostPopular xs = snd . head . reverse . sort . map (\x -> (occurrences x xs, x)) $ xs

mostPopularLetter :: String -> Char
mostPopularLetter text = mostPopular text

-- 5. Most popular letter and word
coolestLtr :: [String] -> Char
coolestLtr = mostPopular . concat

coolestWord :: [String] -> String
coolestWord = mostPopular . words . concat . map (++" ")