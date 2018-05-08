-- 1. Read following commands and decide whether they compile. If no, fix them.

-- a) YES
-- concat [[1, 2, 3], [4, 5, 6]]
a1 = concat [[1, 2, 3], [4, 5, 6]]

-- b) NO
-- ++ [1, 2, 3] [4, 5, 6]
a2 = (++) [1, 2, 3] [4, 5, 6]

-- c) YES
-- (++) "hello" " world"
a3 = (++) "hello" " world"

-- d) NO
-- ["hello" ++ " world]
a4 = ["hello" ++ " world"]

-- e) NO
-- 4 !! "hello"
a5 = "hello" !! 4

-- f) YES
-- (!!) "hello" 4
a6 = (!!) "hello" 4

-- g) NO
-- take "4 lovely"
a7 = take 4 "lovely"

-- h) YES
-- take 3 "awesome"
a8 = take 3 "awesome"


-- 2. Connect expressions with their result

b1 = concat [[1 * 6], [2 * 6], [3 * 6]]
-- [6, 12, 18]

b2 = "rain" ++ drop 2 "elbow"
-- "rainbow"

b3 = 10 * head [1, 2, 3]
-- 10

b4 = (take 3 "Julie") ++ (tail "yes")
-- "Jules"

b5 = concat [tail [1, 2, 3],
             tail [4, 5, 6],
             tail [7, 8, 9]]
-- [2, 3, 5, 6, 8, 9]