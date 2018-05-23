-- 1. What is the type of [[True, False], [True, True], [False, True]]?
--   a) Bool
--   b) mostly True
--   c) [a]
-- X d) [[Bool]]

-- 2. Which of the following has the same type as [[True, False], [True, True], [False, True]]?
--   a) [(True, False), (True, True), (False, True)]
-- X b) [[3 == 3], [6 > 5], [3 < 4]]
--   c) [3 == 3, 6 > 5, 3 < 4]
--   d) ["Bool", "more Bool", "Booly Bool!"]

-- 3. What can we say about this function?
func :: [a] -> [a] -> [a]
func x y = x ++ y
--   a) x and y must be of the same type
--   b) x and y must both be lists
--   c) if x is a String then y must be a String
-- X d) all of the above

-- 4. Which is valid application of func to both of its arguments?
--   a) func "Hello World"
-- X b) func "Hello" "World"
--   c) func [1, 2, 3] "a, b, c"
--   d) func ["Hello", "World"]