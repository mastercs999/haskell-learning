import Data.Monoid as Mon
import Data.Semigroup as Sem
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary, CoArbitrary, frequency, oneof)

-- Implement Monoid instance for new data types where needed.
-- Validate all instances with QuickCheck.

-- 1.
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Monoid Trivial where
    mempty = Trivial
    mappend = (Sem.<>)

instance Arbitrary Trivial where
    arbitrary = return Trivial

associative :: (Eq m, Semigroup m) => m -> m -> m -> Bool
associative a b c = (a Sem.<> (b Sem.<> c)) == ((a Sem.<> b) Sem.<> c)

leftIdentity :: (Eq m, Monoid m) => m -> Bool
leftIdentity x = mappend x mempty == x

rightIdentity :: (Eq m, Monoid m) => m -> Bool
rightIdentity x = mappend mempty x == x

-- 2.
newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
    Identity x <> Identity y = Identity (x Sem.<> y)

instance (Monoid a, Semigroup a) => Monoid (Identity a) where
    mempty = Identity mempty
    mappend = (Sem.<>)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary

-- 3.
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two x y <> Two x' y' = Two (x Sem.<> x') (y Sem.<> y')

instance (Semigroup a, Monoid a, Semigroup b, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty
    mappend = (Sem.<>)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Two x y

-- 4.
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj x <> BoolConj y = BoolConj (x && y)

instance Monoid BoolConj where
    mempty = BoolConj True
    mappend = (Sem.<>)

instance Arbitrary BoolConj where
    arbitrary = do
        x <- arbitrary
        return $ BoolConj x

-- 5.
newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
    BoolDisj x <> BoolDisj y = BoolDisj (x || y)

instance Monoid BoolDisj where
    mempty = BoolDisj False
    mappend = (Sem.<>)

instance Arbitrary BoolDisj where
    arbitrary = do
        x <- arbitrary
        return $ BoolDisj x

-- 6.
newtype Combine a b = Combine {
    unCombine :: (a -> b)
}

instance Show (Combine a b) where
    show (Combine f) = "Hey"

instance (Semigroup a, Semigroup b) => Semigroup (Combine a b) where
    Combine f <> Combine g = Combine (f Sem.<> g)

instance (Semigroup a, Monoid a, Semigroup b, Monoid b) => Monoid (Combine a b) where
    mempty = Combine mempty
    mappend = (Sem.<>)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
    arbitrary = do
        f <- arbitrary
        return $ Combine f

associativeCombine :: (Semigroup a, Eq b, Semigroup b) => a -> Combine a b -> Combine a b -> Combine a b -> Bool
associativeCombine v a b c = (unCombine (a Sem.<> (b Sem.<> c)) v) == (unCombine ((a Sem.<> b) Sem.<> c) v)

leftIdentityCombine :: (Eq b, Monoid a, Monoid b, Semigroup a, Semigroup b) => a -> Combine a b -> Bool
leftIdentityCombine v x = unCombine (mappend x mempty) v == unCombine x v

rightIdentityCombine :: (Eq b, Monoid a, Monoid b, Semigroup a, Semigroup b) => a -> Combine a b -> Bool
rightIdentityCombine v x = unCombine (mappend x mempty) v == unCombine x v

-- 7.
newtype Comp a = Comp { 
    unComp :: (a -> a)
}

instance Show (Comp a) where
    show (Comp f) = "Hey"

instance (Semigroup a) => Semigroup (Comp a) where
    Comp f <> Comp g = Comp (f Sem.<> g)

instance (Semigroup a, Monoid a) => Monoid (Comp a) where
    mempty = Comp mempty
    mappend = (Sem.<>)

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
    arbitrary = do
        f <- arbitrary
        return $ Comp f

associativeComp :: (Semigroup a, Eq a) => a -> Comp a -> Comp a -> Comp a -> Bool
associativeComp v a b c = (unComp (a Sem.<> (b Sem.<> c)) v) == (unComp ((a Sem.<> b) Sem.<> c) v)

leftIdentityComp :: (Eq a, Monoid a, Semigroup a) => a -> Comp a -> Bool
leftIdentityComp v x = unComp (mappend x mempty) v == unComp x v

rightIdentityComp :: (Eq a, Monoid a, Semigroup a) => a -> Comp a -> Bool
rightIdentityComp v x = unComp (mappend x mempty) v == unComp x v

-- 8.
newtype Mem s a = Mem {
    runMem :: s -> (a, s)
}

instance Show (Mem s a) where
    show _ = "Hey"

instance Monoid a => Monoid (Mem s a) where
    mempty = Mem (\x -> (mempty, x))
    mappend (Mem f) (Mem g) =  Mem (\x -> let (a, b) = f x
                                              (c, d) = g b
                                              in (a Mon.<> c, d))

instance (CoArbitrary s, Arbitrary a, Arbitrary s) => Arbitrary (Mem s a) where
    arbitrary = do
        f <- arbitrary
        return $ Mem f

associativeMem :: (Eq a, Eq s, Monoid a) => s -> Mem s a -> Mem s a -> Mem s a -> Bool
associativeMem v a b c = (runMem (a Mon.<> (b Mon.<> c)) v) == (runMem ((a Mon.<> b) Mon.<> c) v)

leftIdentityMem :: (Eq a, Eq s, Monoid a) => s -> Mem s a -> Bool
leftIdentityMem v x = runMem (mappend x mempty) v == runMem x v

rightIdentityMem :: (Eq a, Eq s, Monoid a) => s -> Mem s a -> Bool
rightIdentityMem v x = runMem (mappend x mempty) v == runMem x v
        

main :: IO ()
main = do
    quickCheck (associative :: Trivial -> Trivial -> Trivial -> Bool)
    quickCheck (leftIdentity :: Trivial -> Bool)
    quickCheck (rightIdentity :: Trivial -> Bool)
    quickCheck (associative :: Identity String -> Identity String -> Identity String -> Bool)
    quickCheck (leftIdentity :: Identity String -> Bool)
    quickCheck (rightIdentity :: Identity String -> Bool)
    quickCheck (associative :: Two String String -> Two String String -> Two String String -> Bool)
    quickCheck (leftIdentity :: Two String String -> Bool)
    quickCheck (rightIdentity :: Two String String -> Bool)
    quickCheck (associative :: BoolConj -> BoolConj -> BoolConj -> Bool)
    quickCheck (leftIdentity :: BoolConj -> Bool)
    quickCheck (rightIdentity :: BoolConj -> Bool)
    quickCheck (associative :: BoolDisj -> BoolDisj -> BoolDisj -> Bool)
    quickCheck (leftIdentity :: BoolDisj -> Bool)
    quickCheck (rightIdentity :: BoolDisj -> Bool)
    quickCheck (associativeCombine :: String -> Combine String String -> Combine String String -> Combine String String -> Bool)
    quickCheck (leftIdentityCombine :: String -> Combine String String -> Bool)
    quickCheck (rightIdentityCombine :: String -> Combine String String -> Bool)
    quickCheck (associativeComp :: String -> Comp String -> Comp String -> Comp String -> Bool)
    quickCheck (leftIdentityComp :: String -> Comp String -> Bool)
    quickCheck (rightIdentityComp :: String -> Comp String -> Bool)
    quickCheck (associativeMem :: String -> Mem String String -> Mem String String -> Mem String String -> Bool)
    quickCheck (leftIdentityMem :: String -> Mem String String -> Bool)
    quickCheck (rightIdentityMem :: String -> Mem String String -> Bool)