import Test.QuickCheck
import Test.QuickCheck.Function

-- Implement instances of Func. Test them with QuickCheck.

testId :: (Functor f, Eq (f a)) => f a -> Bool
testId f = fmap id f == f

testCompose :: (Functor f, Eq (f c)) => f a -> Fun a b -> Fun b c -> Bool
testCompose x (Fun _ f) (Fun _ g) = (fmap g (fmap f x)) == fmap (g . f) x

-- 1.
newtype Identity a = Identity a deriving (Eq, Show)

instance Functor Identity where
    fmap f (Identity x) = Identity $ f x

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary

-- 2.
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

instance Arbitrary a => Arbitrary (Pair a) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Pair x y

-- 3.
data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two x y) = Two x (f y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Two x y

-- 4.
data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
    fmap f (Three x y z) = Three x y (f z)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three x y z

-- 5.
data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' x y z) = Three' x (f y) (f z)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three' x y z

-- 6.
data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four a b c d

-- 7.
data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four' a b c d

-- 8.
data Trivial = Trivial

-- instance Functor cannot be made. Kind of Trivial is *

main :: IO ()
main = do
    quickCheck (\x -> testId (x :: Identity Int))
    quickCheck (testCompose :: (Identity Int -> Fun Int Int -> Fun Int Int -> Bool))
    quickCheck (\x -> testId (x :: Pair Int))
    quickCheck (testCompose :: (Pair Int -> Fun Int Int -> Fun Int Int -> Bool))
    quickCheck (\x -> testId (x :: Two Int String))
    quickCheck (testCompose :: (Two Int String -> Fun String String -> Fun String String -> Bool))
    quickCheck (\x -> testId (x :: Three Int String Char))
    quickCheck (testCompose :: (Three Int String Char -> Fun Char Char -> Fun Char Char -> Bool))
    quickCheck (\x -> testId (x :: Three' Int Char))
    quickCheck (testCompose :: (Three' Int Char -> Fun Char Char -> Fun Char Char -> Bool))
    quickCheck (\x -> testId (x :: Four Int Int String Char))
    quickCheck (testCompose :: (Four Int Int String Char -> Fun Char Char -> Fun Char Char -> Bool))
    quickCheck (\x -> testId (x :: Four' Int Char))
    quickCheck (testCompose :: (Four' Int Char -> Fun Char Char -> Fun Char Char -> Bool))

