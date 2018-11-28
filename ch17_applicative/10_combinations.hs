-- Write function to generate all possible combinations of three input lists
-- using liftA3

import Control.Applicative (liftA3)

stops = "pbtdkg"
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)