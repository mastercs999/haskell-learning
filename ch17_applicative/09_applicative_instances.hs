-- Write applicative instances and check them via checkers

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

-- 1.
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
    pure x = Pair x x
    (<*>) (Pair f g) (Pair x y) = Pair (f x) (g y)

instance (Arbitrary a) => Arbitrary (Pair a) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Pair x y

instance (Eq a) => EqProp (Pair a) where
    (=-=) = eq


-- 2.
data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two x y) = Two x (f y)

instance (Monoid a) => Applicative (Two a) where
    pure x = Two mempty x
    (<*>) (Two x f) (Two x' y') = Two (x <> x') (f y')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Two x y

instance (Eq a, Eq b) => EqProp (Two a b) where
    (=-=) = eq

    
-- 3.
data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
    fmap f (Three x y z) = Three x y (f z)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure x = Three mempty mempty x
    (<*>) (Three x y f) (Three x' y' z) = Three (x <> x') (y <> y') (f z)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three x y z

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
    (=-=) = eq


-- 4.
data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' x y z) = Three' x (f y) (f z)

instance (Monoid a) => Applicative (Three' a) where
    pure x = Three' mempty x x
    (<*>) (Three' x f g) (Three' x' y' z') = Three' (x <> x') (f y') (g z')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three' x y z

instance (Eq a, Eq b) => EqProp (Three' a b) where
    (=-=) = eq


-- 4.
data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure x = Four mempty mempty mempty x
    (<*>) (Four a b c f) (Four a' b' c' d') = Four (a <> a') (b <> b') (c <> c') (f d')

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four a b c d

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where
    (=-=) = eq


-- 6.
data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)

instance (Monoid a) => Applicative (Four' a) where
    pure x = Four' mempty mempty mempty x
    (<*>) (Four' a b c f) (Four' a' b' c' d') = Four' (a <> a') (b <> b') (c <> c') (f d')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four' a b c d

instance (Eq a, Eq b) => EqProp (Four' a b) where
    (=-=) = eq


main :: IO ()
main = do
    quickBatch $ functor (undefined :: Pair (Int, String, Char))
    quickBatch $ applicative (undefined :: Pair (Int, String, Char))
    quickBatch $ functor (undefined :: Two String (Int, String, Char))
    quickBatch $ applicative (undefined :: Two String (Int, String, Char))
    quickBatch $ functor (undefined :: Three String String (Int, String, Char))
    quickBatch $ applicative (undefined :: Three String String (Int, String, Char))
    quickBatch $ functor (undefined :: Three' String (Int, String, Char))
    quickBatch $ applicative (undefined :: Three' String (Int, String, Char))
    quickBatch $ functor (undefined :: Four String String String (Int, String, Char))
    quickBatch $ applicative (undefined :: Four String String String (Int, String, Char))
    quickBatch $ functor (undefined :: Four' String (Int, String, Char))
    quickBatch $ applicative (undefined :: Four' String (Int, String, Char))