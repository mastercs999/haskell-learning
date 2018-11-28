-- Implement functor and applicative instance for List.
-- Use checkers library to verify

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil 
    fmap f (Cons x xs) = Cons (f x) (f <$> xs)

instance Applicative List where
    pure x = Cons x Nil
    (<*>) _ Nil = Nil
    (<*>) Nil _ = Nil
    (<*>) (Cons f fs) xs = (f <$> xs) `append` (fs <*> xs)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        frequency [(1, return Nil), (5, return $ Cons x y)]

instance Eq a => EqProp (List a) where
    (=-=) = eq

main :: IO ()
main = quickBatch $ applicative (Cons ("asas", 1 :: Int, "asas") Nil)

-- Implement function flatMap using concat' and fmap
append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f xs = concat' $ fmap f xs