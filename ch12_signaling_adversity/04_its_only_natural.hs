-- Represent natural numbers as new data type. Also provide means for converting
-- between naturals and Integers

data Nat = Zero
         | Succ Nat
         deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero     = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat x 
             | x < 0     = Nothing
             | x == 0    = Just Zero
             | otherwise = Just $ Succ precedor
             where Just precedor = integerToNat $ x - 1