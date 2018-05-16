-- What do you think the function quotRem and divMod do? Do some examples

-- quotRem and divMod are similar. Let's focus on divMod only.
-- divMod :: Integral a => a -> a -> (a, a)
-- It obviously returns quotient and remainder

x = 11 `divMod` 4
-- x == (2, 3)