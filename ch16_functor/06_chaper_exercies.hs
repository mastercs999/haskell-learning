import GHC.Arr

-- Determine whether valid functor instance can be written for given datatypes.

-- 1. No
data Bool = False | True

-- 2. Yes
data BoolAndSomethingElse a = False' a | True' a

-- 3. Yes
data BoolAndMaybeSomethingElse a = Falsish | Truish a

-- 4. Yes
newtype Mu f = InF { outF :: f (Mu f) }

-- 5. No
data D = D (Array Word Word) Int Int