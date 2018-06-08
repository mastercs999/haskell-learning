import Data.Int

-- 1. What is the cardinality of this datatype?
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)
--    Cardinality is 4

-- 2. What is the cardinality of NumberOrBool? - 258
--    What happens if you try to pass number bigger than 128 to Numba? - Number will overflow with warning
data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)