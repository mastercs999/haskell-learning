-- Write Monoid instance for First' a without having restriction for Monoid on a
-- Validate the instance using QuickCheck and monoid laws.

import Data.Monoid
import Test.QuickCheck

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
    mempty = Nada
    mappend Nada y = y
    mappend x Nada = x
    mappend (Only x) (Only y) = Only $ mappend x y 

newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

instance Monoid (First' a) where
    mempty = First' { getFirst' = Nada }
    mappend c@(First' (Only x)) _ = c
    mappend (First' Nada) y       = y

instance (Arbitrary a) => Arbitrary (First' a) where
    arbitrary = do
        x <- arbitrary
        frequency [(1, return First' { getFirst' = Nada }),
                   (1, return First' { getFirst' = Only x})]

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend = First' String -> First' String -> First' String -> Bool

type FstId = First' String -> Bool

monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

main :: IO ()
main = do
    quickCheck (monoidAssoc :: FirstMappend)
    quickCheck (monoidLeftIdentity :: FstId)
    quickCheck (monoidRightIdentity :: FstId)