-- Define McCarthy 91 function. It returns x - 10 when x > 100 and 91 otherwise
-- The otherwise is recurive: MC(MC(x + 11))

mc91 :: Integral a => a -> a
mc91 n
     | n > 100 = n - 10
     | otherwise = mc91 . mc91 $ n + 11