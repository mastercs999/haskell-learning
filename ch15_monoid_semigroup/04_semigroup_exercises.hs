import Data.Semigroup
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary, CoArbitrary, frequency, oneof)

-- Implement Semigroup instance for new data types where needed.
-- Validate all instances with QuickCheck.

-- 1. 
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

associative :: (Eq m, Semigroup m) => m -> m -> m -> Bool
associative a b c = (a <> (b <> c)) == ((a <> b) <> c)

-- 2.
newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
    Identity x <> Identity y = Identity (x <> y)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary

-- 3.
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two x y <> Two x' y' = Two (x <> x') (y <> y')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Two x y

-- 4.
data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
    Three x y z <> Three x' y' z' = Three (x <> x') (y <> y') (z <> z')

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three x y z

-- 5.
data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where
    Four x y z d <> Four x' y' z' d' = Four (x <> x') (y <> y') (z <> z') (d <> d')

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        d <- arbitrary
        return $ Four x y z d

-- 6.
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj x <> BoolConj y = BoolConj (x && y)

instance Arbitrary BoolConj where
    arbitrary = do
        x <- arbitrary
        return $ BoolConj x

-- 7.
newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
    BoolDisj x <> BoolDisj y = BoolDisj (x || y)

instance Arbitrary BoolDisj where
    arbitrary = do
        x <- arbitrary
        return $ BoolDisj x

-- 8.
data Or a b = Fst a | Snd b deriving (Eq, Show)

instance Semigroup (Or a b) where
    Snd x <> _ = Snd x
    Fst x <> y = y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return $ Fst x, return $ Snd y]

-- 9.
newtype Combine a b = Combine {
    unCombine :: (a -> b)
}

instance Show (Combine a b) where
    show (Combine f) = "Hey"

instance (Semigroup a, Semigroup b) => Semigroup (Combine a b) where
    Combine f <> Combine g = Combine (f <> g)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
    arbitrary = do
        f <- arbitrary
        return $ Combine f

associativeCombine :: (Semigroup a, Eq b, Semigroup b) => a -> Combine a b -> Combine a b -> Combine a b -> Bool
associativeCombine v a b c = (unCombine (a <> (b <> c)) v) == (unCombine ((a <> b) <> c) v)

-- 10.
newtype Comp a = Comp { 
    unComp :: (a -> a)
}

instance Show (Comp a) where
    show (Comp f) = "Hey"

instance (Semigroup a) => Semigroup (Comp a) where
    Comp f <> Comp g = Comp (f <> g)

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
    arbitrary = do
        f <- arbitrary
        return $ Comp f

associativeComp :: (Semigroup a, Eq a) => a -> Comp a -> Comp a -> Comp a -> Bool
associativeComp v a b c = (unComp (a <> (b <> c)) v ) == (unComp ((a <> b) <> c) v)

-- 11.
data Validation a b = Failure a
                    | Success b
                    deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
    Failure x <> Failure y = Failure (x <> y)
    Failure x <> Success y = Failure x
    Success x <> Failure y = Failure y
    Success x <> Success y = Success x

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return $ Failure x, return $ Success y]

-- 12.
newtype AccumulateRight a b = AccumulateRight (Validation a b) deriving (Eq, Show)

instance Semigroup b => Semigroup (AccumulateRight a b) where
    AccumulateRight (Failure x) <> AccumulateRight (Failure y) = AccumulateRight (Failure x)
    AccumulateRight (Failure x) <> AccumulateRight (Success y) = AccumulateRight (Success y)
    AccumulateRight (Success x) <> AccumulateRight (Failure y) = AccumulateRight (Success x)
    AccumulateRight (Success x) <> AccumulateRight (Success y) = AccumulateRight (Success $ x <> y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateRight a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return $ AccumulateRight $ Failure x, return $ AccumulateRight $ Success y]

-- 13.
newtype AccumulateBoth a b = AccumulateBoth (Validation a b) deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (AccumulateBoth a b) where
    AccumulateBoth x <> AccumulateBoth y = AccumulateBoth $ x <> y

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateBoth a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return $ AccumulateBoth $ Failure x, return $ AccumulateBoth $ Success y]

main :: IO ()
main = do 
    quickCheck (associative :: Trivial -> Trivial -> Trivial -> Bool)
    quickCheck (associative :: (Identity (Sum Int)) -> (Identity (Sum Int)) -> (Identity (Sum Int)) -> Bool)
    quickCheck (associative :: (Two (Sum Int) String) -> (Two (Sum Int) String) -> (Two (Sum Int) String) -> Bool)
    quickCheck (associative :: (Three (Sum Int) String String) -> (Three (Sum Int) String String) -> (Three (Sum Int) String String) -> Bool)
    quickCheck (associative :: (Four (Sum Int) String String (Sum Integer)) -> (Four (Sum Int) String String (Sum Integer)) -> (Four (Sum Int) String String (Sum Integer)) -> Bool)
    quickCheck (associative :: (BoolConj -> BoolConj -> BoolConj -> Bool))
    quickCheck (associative :: (BoolDisj -> BoolDisj -> BoolDisj -> Bool))
    quickCheck (associative :: (Or Int String -> Or Int String -> Or Int String -> Bool))
    quickCheck (associativeCombine :: (String -> Combine String String -> Combine String String -> Combine String String -> Bool))
    quickCheck (associativeComp :: (String -> Comp String -> Comp String -> Comp String -> Bool))
    quickCheck (associative :: (Validation String String -> Validation String String -> Validation String String -> Bool))
    quickCheck (associative :: (AccumulateRight String String -> AccumulateRight String String -> AccumulateRight String String -> Bool))
    quickCheck (associative :: (AccumulateBoth String String -> AccumulateBoth String String -> AccumulateBoth String String -> Bool))