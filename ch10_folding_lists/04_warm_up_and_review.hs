-- 1. Lets define some variables
stops = "pbtdkg"
vowels = "aeiou"

-- a) Write a function accepting characters from stops an vowels.
--    It should return all possible 3-tuples of format stop-vowel-stop
combine = [(x, y, z) | x <- stops, y <- vowels, z <- stops]

-- b) Modify the function to return only triples beginning with 'p'
combineP = [(x, y, z) | x <- stops, y <- vowels, z <- stops, x == 'p']

-- c) Create lists of nouns and verbs and create all combinations of noun-verb-noun
nouns = ["building", "boat", "thinkpad", "leaf"]
verbs = ["is", "are", "loves", "makes"]

sentences = [(x, y, z) | x <- nouns, y <- verbs, z <- nouns]

-- 2. What does this function do? What is its type?
seekritFunc :: String -> Int
seekritFunc x = div (sum (map length (words x))) (length (words x))
-- It takes sentence as argument and returns average character count per word (rounded)

-- 3. Rewrite the function using fractional division
seekritFunc' :: Fractional a => String -> a
seekritFunc' x = (fromIntegral $ sum (map length (words x))) / (fromIntegral $ length (words x))