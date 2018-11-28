-- Implement applicative instance for ZipList'.
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
    xs =-= ys = xs' `eq` ys'
        where xs' = let l = xs
                    in take' 3000 l
              ys' = let l = ys
                    in take' 3000 l

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

take' :: Int -> List a -> List a
take' _ Nil = Nil
take' n (Cons x xs)
      | n <= 0 = Nil
      | otherwise = Cons x (take' (n - 1) xs)


newtype ZipList' a = ZipList' (List a) deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
    xs =-= ys = xs' `eq` ys'
        where xs' = let (ZipList' l) = xs
                    in take' 3000 l
              ys' = let (ZipList' l) = ys
                    in take' 3000 l

instance Functor ZipList' where
    fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
    pure x = ZipList' (pure x)
    (<*>) (ZipList' fs) (ZipList' xs) = ZipList' $ zipListWith fs xs

zipListWith :: List (a -> b) -> List a -> List b
zipListWith _ Nil = Nil
zipListWith Nil _ = Nil
zipListWith (Cons f Nil) (Cons x xs) = Cons (f x) (pure f <*> xs)
zipListWith (Cons f fs) (Cons x Nil) = Cons (f x) (fs <*> pure x)
zipListWith (Cons f fs) (Cons x xs)  = Cons (f x) (zipListWith fs xs)

instance Arbitrary a => Arbitrary (ZipList' a) where
    arbitrary = do
        xs <- arbitrary
        return $ ZipList' xs

main :: IO ()
main = quickBatch $ applicative (ZipList' $ Cons ("asas", 1 :: Int, "asas") Nil)