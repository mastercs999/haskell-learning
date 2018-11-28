-- Write functor and applicative for data Validation.
-- Test it with checkers library.

import Data.Monoid
import Test.QuickCheck (Arbitrary, arbitrary, elements)
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data Validation e a = Failure e
                    | Success a
                    deriving (Eq, Show)

instance Functor (Validation e) where
    fmap _ (Failure e) = Failure e
    fmap f (Success e) = Success $ f e

instance (Monoid e) => Applicative (Validation e) where
    pure x = Success x
    (<*>) (Failure x) (Failure y) = Failure $ x `mappend` y
    (<*>) (Failure x) _ = Failure x
    (<*>) _ (Failure y) = Failure y
    (<*>) (Success f) (Success y) = Success $ f y

instance (Arbitrary e, Arbitrary a) => Arbitrary (Validation e a) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        elements [Failure x, Success y]

instance (Eq e, Eq a) => EqProp (Validation e a) where
    (=-=) = eq

main :: IO ()
main = quickBatch $ applicative (undefined :: Validation String (Int, String, Char))