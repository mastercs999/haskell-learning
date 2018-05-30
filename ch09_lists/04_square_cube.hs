-- Given mySqr and myCube lists:
mySqr  = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- 1. Write and expression which will make tuples of mySqr and myCube
tuples = [(x, y) | x <- mySqr, y <- myCube]

-- 2. Alter expression to only create tuples with items less than 50
tuples' = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- 3. Apply another functions to list above to determine how many tuples are in that list
cnt = length tuples'