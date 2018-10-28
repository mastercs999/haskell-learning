-- 1. Write a functor instance for this datatype.

data Sum a b = First a
             | Second b
             deriving (Eq, Show)

instance Functor (Sum a) where
    fmap _ (First x) = First x
    fmap f (Second x) = Second (f x)

-- 2. Why the functor instance which would modify First is impossible?
--    Because we can write the instance only for type of kind * -> *