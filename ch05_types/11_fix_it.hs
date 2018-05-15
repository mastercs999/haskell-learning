-- 1. Fix the code
-- module sing where
-- 
-- fstString :: [Char] ++ [Char]
-- fstString x = x ++ " in the rain"
-- 
-- sndString :: [Char] -> [Char]
-- sndString x = x ++ " over the rainbow"
-- 
-- sing = if (x > y) then fstString x or sndString y
-- where x = "Signin"
--       y = "Somewhere"
module Sing where

    fstString :: [Char] -> [Char]
    fstString x = x ++ " in the rain"

    sndString :: [Char] -> [Char]
    sndString x = x ++ " over the rainbow"

    sing = if (x > y) then fstString x else sndString y
        where x = "Signin"
              y = "Somewhere"

-- 2. Now just do the minor change to sing other song
-- We can just replace (x > y) with (x < y)
    sing2 = if (x < y) then fstString x else sndString y
        where x = "Signin"
              y = "Somewhere"

-- 3. Fix the code
-- module Arith3Broken where
-- main :: IO ()
-- Main = do
--   print 1 + 2
--   putStrLn 10
--   print (negate - 1)
--   print ((+) 0 blah)
--   where blah = negate 1
-- module Arith3Broken where
    main :: IO ()
    main = do
        print $ 1 + 2
        putStrLn "10"
        print (negate (-1))
        print ((+) 0 blah)
            where blah = negate 1    

