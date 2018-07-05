import Test.Hspec

myMul :: (Integral a) => a -> a -> a
myMul x y
      | y == 1 = x
      | y > 1 = x + (myMul x $ y - 1)
      | otherwise = 0

main :: IO ()
main = hspec $ do
    describe "Multiplication" $ do
        it "0 * 2 is 0" $ do
            myMul 0 2 `shouldBe` 0
        it "5 * 3 is 15" $ do
            myMul 5 3 `shouldBe` 15