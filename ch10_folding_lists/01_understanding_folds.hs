-- 1. What expression will return the same value as this:
result = foldr (*) 1 [1..5]

-- a)   flip (*) 1 [1..5]
-- b) X foldl (flip (*)) 1 [1..5] 
-- c) X foldl (*) 1 [1..5]

-- 2. Write out evaluation steps for this expression:
-- foldl (flip (*)) 1 [1..3]
-- foldl (flip (*)) (flip (*) 1 1) [2, 3] 
-- foldl (flip (*)) (flip (*) (flip (*) 1 1) 2) [3]
-- foldl (flip (*)) ((flip (*)) (flip (*) (flip (*) 1 1) 2) 3) []
-- (flip (*)) (flip (*) (flip (*) 1 1) 2) 3
-- (*) 3 (flip (*) (flip (*) 1 1) 2)
-- (*) 3 ((*) 2 (flip (*) 1 1))
-- (*) 3 ((*) 2 ((*) 1 1))
-- (*) 3 ((*) 2 1)
-- (*) 3 2
-- 6

-- 3. One difference between foldr and foldl is
-- a)   foldr, but not foldl, travereses the spine of a list from right to left
-- b)   foldr, but not foldl, always forces the rest of the fold
-- c) X foldr, but not foldl, associates to the right
-- d)   foldr, but not foldl, is recursive  

-- 4. Folds are catamorphisms, which mean they are generally used to
-- a) X reduce structure
-- b)   expand structure
-- c)   render you catatonic
-- d)   generate infinite data structures

-- 5. Fix following folds

-- a) foldr (++) ["woot", "WOOT", "woot"]
a1 = foldr (++) "" ["woot", "WOOT", "woot"]

-- b) foldr max [] "fear is the little death"
a2 = foldr max 'a' "fear is the little death"

-- c) foldr and True [False, True]
a3 = foldr (&&) True [False, True]

-- d) Can this ever return a different answer?
a4 = foldr (||) True [False, True] -- No, content of the list doesn't matter

-- e) foldl ((++) . show) "" [1..5]
a5 = foldl (\a b -> a ++ show b) "" [1..5]

-- f) foldr const 'a' [1..5]
a6 = foldr const 0 [1..5]

-- g) foldr const 0 "tacos"
a7 = foldr const 'X' "tacos"  

-- h) foldl (flip const) 0 "burritos"
a8 = foldl (flip const) 'X' "burritos"

-- i) foldl (flip const) 'z' [1..5]
a9 = foldl (flip const) 0 [1..5]