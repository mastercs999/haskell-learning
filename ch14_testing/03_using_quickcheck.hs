-- Do some tests using QuickCheck

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Function
import Data.List (sort)

-- 1. half
half x = x / 2

testHalf :: IO ()
testHalf = hspec $ do 
    describe "half" $ do
        it "by multiplication we get back the original value" $ do
            property $ \x -> ((*2) . half) x == (x :: Rational)

-- 2. sort
listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs =
    snd $ foldr go (Nothing, True) xs
    where go _ status@(_, False) = status
          go y (Nothing, t) = (Just y, t)
          go y (Just x, t)  = (Just y, x >= y)

testSort :: IO ()
testSort = quickCheck (listOrdered . sort :: [Int] -> Bool)

-- 3. associative and commutative for addition
plusAssociative x y z = x + (y + z) == (x + y) + z
plusCommutative x y = x + y == y + x

testAsComAdd :: IO ()
testAsComAdd = do
    quickCheck (plusAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (plusCommutative :: Int -> Int -> Bool)

-- 4. associative and commutative for multiplication
mulAssociative x y z = x * (y * z) == (x * y) * z
mulCommutative x y = x * y == y * x

testAsComMul :: IO ()
testAsComMul = do
    quickCheck (mulAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (mulCommutative :: Int -> Int -> Bool)

-- 5. write tests to prove differences between quot and rem and div and mod
law1 x y = x /= 0 && y /= 0 -- (quot x y) * y + (rem x y) == x
law2 x y = (div x y) * y + (mod x y) == x

genNonZero :: Gen Int
genNonZero = suchThat (arbitrary :: Gen Int) (/= 0)

testQRDM :: IO ()
testQRDM = do
    quickCheck (forAll genNonZero $ \x ->
                    forAll genNonZero $ \y -> law1 x y)
    quickCheck (forAll genNonZero $ \x ->
                    forAll genNonZero $ \y -> law2 x y)

-- 6. Test associativy and commutavity for ^ operator
powAs x y z = x ^ (y ^ z) == (x ^ y) ^ z
powCom x y = x ^ y == y ^ x

testPow :: IO ()
testPow = do
    quickCheck (powAs :: Int -> Int -> Int -> Bool)
    quickCheck (powCom :: Int -> Int -> Bool)

-- 7. Test that double reverse is the same as identity
testRev :: IO ()
testRev = quickCheck (\x -> (reverse . reverse) x == id (x :: [Int]))

-- 8. Write property for definition of $ and .
prop_dollar :: String -> (Fun String Int) -> Bool
prop_dollar str (Fun _ f) = (f $ str) == f str

prop_dot :: String -> (Fun String String) -> (Fun String String) -> Bool
prop_dot str (Fun _ f) (Fun _ g) = (f . g) str == f (g str)

testFunOp :: IO ()
testFunOp = do
    quickCheck prop_dollar
    quickCheck prop_dot

-- 9. Check equality of:
--    foldr (:)     == (++)
--    foldr (++) [] == concat
prop_f1 :: [Int] -> [Int] -> Bool
prop_f1 x y = foldr (:) x y == (++) x y

prop_f2 :: [String] -> Bool
prop_f2 x = foldr (++) [] x == concat x

testFoldr :: IO ()
testFoldr = do
    quickCheck prop_f1
    quickCheck prop_f2

-- 10. Check following function f
f :: Int -> String -> Bool
f n xs = length (take n xs) == n

testF :: IO ()
testF = quickCheck f

-- 11. Check read and show
f2 :: Int -> Bool
f2 x = (read (show x)) == x

testF2 :: IO ()
testF2 = quickCheck f2