-- 1. Write a function to get all the multiplies of 3 from 1-30
mult3 :: Integral a => [a] -> [a]
mult3 = filter (\x -> x `mod` 3 == 0)

-- 2. Use compositions to get number of multiplies of 3 from 1-30
mult3Count :: Integral a => [a] -> Int
mult3Count = length . mult3

-- 3. Write a function which removes 'the', 'a', 'an' from a string.
--    It should return list of words without those word.
--    Use words function.
removeArticles :: [Char] -> [[Char]]
removeArticles = filter (\x -> (not . elem x) notAllowed) . words 
    where notAllowed = ["the", "a", "an"]