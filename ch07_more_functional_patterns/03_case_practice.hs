-- 1. Rewrite the function using case construction
--    functionC x y = if (x > y) then x else y
functionC x y = case x > y of
                    True  -> x
                    False -> y

-- 2. Rewrite the function using case construction
--    ifEvenAdd2 n = if even n then (n + 2) else n
ifEvenAdd2 n = case even n of
                   True  -> n + 2
                   False -> n

-- 3. Add handling of x == 0
--    nums x = case compare x 0 of
--                 LT -> -1
--                 GT -> -1
nums x = case compare x 0 of
             LT -> -1
             GT -> -1
             EQ -> 0