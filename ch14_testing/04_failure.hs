-- Find out why squareIdentity function fails in test

import Test.QuickCheck

square :: Num a => a -> a
square x = x * x

squareIdentity :: Floating a => a -> a
squareIdentity = square . sqrt

test :: IO ()
test = quickCheck (\x -> squareIdentity x == (x :: Double))

-- It fails because of lost precision when working with floating data types