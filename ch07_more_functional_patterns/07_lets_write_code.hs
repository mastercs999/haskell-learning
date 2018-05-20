-- 1. We have a function which returns tens digit of an integral argument:
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d     = xLast `mod` 10
--   a) Rewrite it using divMod
tensDigit' :: Integral a => a -> a
tensDigit' x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10

--   b) Does the divMod version has the same type ar original version?
--      Yes

--   c) Change it to get hundreds digit.
hunsD x = d2
    where d = x `div` 100
          d2 = d `mod` 10

-- 2. Implement function of type a -> a -> Bool -> a once with case
--    and once with a guard.
foldBool :: a -> a -> Bool -> a
foldBool x y b = case b of
    True -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b
    | b = x
    | otherwise = y

-- 3. Fill the definition by given type.
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)

-- 4. just write the code
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
    print (roundTrip 4)
    print (id 4)

-- 5. Now write roundTrip using pointfree definition
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show

-- 6. Change the type of roundTrip to (Show a, Read b) => a -> b
--    And make print (roundTrip 4) work
roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' = read . show