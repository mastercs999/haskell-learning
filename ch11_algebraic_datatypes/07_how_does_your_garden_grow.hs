-- 1. What is normal form of Garden?
-- data FlowerType = Gardenia
--                 | Daisy
--                 | Rose
--                 | Lilac
--                 deriving Show

type Gardener = String

-- data Garden = Garden Gardener FlowerType deriving Show

-- Normal type:
data Garden' = Gardenia Gardener
             | Daisy Gardener
             | Rose Gardener
             | Lilac Gardener
             deriving Show
