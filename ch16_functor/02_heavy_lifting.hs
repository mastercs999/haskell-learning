-- Add fmap, parentheses and function composition to get correct result

-- 1. Should be [2]
-- a = (+1) $ read "[1]" :: [Int]
a = fmap (+1) $ read "[1]" :: [Int]

-- 2. Should be Just ["Hi,lol", "Hellolol"]
-- b = (++ "lol") (Just ["Hi,", "Hello"])
b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])

-- 3. Should be -2
-- c = (*2) (\x -> x - 2)
c = fmap (*2) (\x -> x - 2)

-- 4. Should be "1[0,1,2,3]"
-- d = ((return '1' ++) . show) (\x -> [x, 1..3])
d = fmap ((return '1' ++) . show) (\x -> [x, 1..3])

-- 5. Should be 3693
-- e :: IO Integer
-- e = let ioi = readIO "1" :: IO Integer
--         changed = read ("123" ++) show ioi
--     in (*3) changed
e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap read $ fmap ("123" ++) (fmap show ioi)
    in fmap (*3) changed