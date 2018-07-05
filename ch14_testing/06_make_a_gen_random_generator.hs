-- Write Gen generator for Fool data type
import Test.QuickCheck

data Fool = Fulse
          | Frue
          deriving (Eq, Show)

-- 1. Equal probability
foolGen :: Gen Fool
foolGen = oneof [return Fulse, return Frue]

-- 2. 2/3 chance for Fulse, 1/3 chance for Frue
foolGen' :: Gen Fool
foolGen' = frequency [(2, return Fulse), (1, return Frue)]