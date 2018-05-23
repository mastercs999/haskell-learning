-- Given definition applyTimes, write down evaluation of applyTimes 5 (+1) 5
applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n - 1) f $ b

x = applyTimes 5 (+1) 5
-- (+1) . applyTimes (5 - 1) (+1) $ 5
--        (+1) . applyTimes (4 - 1) (+1) $ 5
--               (+1) . applyTimes (3 - 1) (+1) $ 5
--                      (+1) . applyTimes (2 - 1) (+1) $ 5
--                             (+1) . applyTimes (1 - 1) (+1) $ 5
--                                    5
--                              6
--                      7
--               8
--         9
-- 10