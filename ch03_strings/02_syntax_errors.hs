-- Decide whether following expression will compile. If not, fix them.

-- 1. NO
-- ++ [1, 2, 3] [4, 5, 6]
a1 = (++) [1, 2, 3] [4, 5, 6]

-- 2. NO
-- '<3' ++ ' Haskell'
a2 = "<3" ++ " Haskell"

-- 3. YES
-- concat ["<3", " Haskell"]
a3 = concat ["<3", " Haskell"]