-- Use Maybe to write a function that counts vowels and consonants in a string.
-- If vowels count is higher than consonants count, Nothing is returned.

isVowel :: Char -> Bool
isVowel c = elem c "aeiou"

isConsonant :: Char -> Bool
isConsonant c = not $ isVowel c

newtype Word' = Word' String deriving (Eq, Show)

mkWord :: String -> Maybe Word'
mkWord text 
       | vowelCount > consonantCount = Nothing
       | otherwise                   = Just $ Word' text
       where vowelCount     = length . filter isVowel $ text
             consonantCount = length . filter isConsonant $ text 