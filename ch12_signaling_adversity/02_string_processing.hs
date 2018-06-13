-- 1. Write a recursive function replaceThe which takes a string,
--    breaks it into words and replace 'the' word with 'a'. notThe is
--    just a helper function.
notThe :: String -> Maybe String
notThe "the" = Nothing
notThe x     = Just x

replaceThe :: String -> String
replaceThe = unwords . replace . words
    where replace []       = []
          replace (x:xs)   = case notThe x of
                                Nothing -> "a" : replace xs
                                Just w  -> w : replace xs

-- 2. Write a recursive that takes a text, breaks it into words and counts
--    number of instances of "the" followed by vowel-initial word
isVowel :: Char -> Bool
isVowel c = elem c "aeiou"

isThe :: String -> Bool
isThe x
      | notThe x == Nothing = True
      | otherwise           = False

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = count . words
    where count []     = 0
          count (x:[]) = 0
          count (x:x':xs) = case isThe x && isVowel (head x') of
                                True  -> 1 + count (x':xs)
                                False -> 0 + count (x':xs)

-- 3. Return number of vowels in a word.
countVowels :: String -> Integer
countVowels = fromIntegral . length . filter isVowel