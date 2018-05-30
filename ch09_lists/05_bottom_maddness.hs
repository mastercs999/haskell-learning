-- Will the expressions return a value or be bottom (fails)

-- 1. Bottom
a1 = [x^y | x <- [1..5], y <- [2, undefined]]

-- 2. Works
a2 = take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]

-- 3. Bottom
a3 = sum [1, undefined, 3]

-- 4. Works
a4 = length [1, 2, undefined]

-- 5. Bottom
a5 = length $ [1, 2, 3] ++ undefined

-- 6. Works
a6 = take 1 $ filter even [1, 2, 3, undefined]

-- 7. Bottom
a7 = take 1 $ filter even [1, 3, undefined]

-- 8. Works
a8 = take 1 $ filter odd [1, 2, undefined]

-- 9. Works
a9 = take 2 $ filter odd [1, 3, undefined]

-- 10. Bottom
a10 = take 3 $ filter odd [1, 3, undefined]