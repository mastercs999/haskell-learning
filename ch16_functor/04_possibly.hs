-- Write a functor for this datatype.

data Possibly a = LolNope 
                | Yeppers a
                deriving (Eq, Show)

instance Functor Possibly where
    fmap f LolNope = LolNope
    fmap f (Yeppers x) = Yeppers $ f x