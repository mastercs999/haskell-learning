data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- Which expression will typecheck? If they don't, why?

-- 1. No, bad  data constructor used for Rocks and Yeah
-- phew = Papu "chases" True

-- 2. Yes
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- 3. Yes
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4. No, Papu doesn't implement Ord instance
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'

