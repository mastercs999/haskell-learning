import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [DbDate (UTCTime (fromGregorian 1911 5 1)(secondsToDiffTime 34123)),
               DbNumber 9001,
               DbString "Hello, world!",
               DbDate (UTCTime (fromGregorian 1921 5 1)(secondsToDiffTime 34123))
              ]

-- 1. Write a function that filters for DbDate and returns list of UTCTime iniside them
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate (DbDate time:xs) = time : filterDbDate xs
filterDbDate (_:xs) = filterDbDate xs

-- 2. Write a function that filters for DbNumber and returns list of their Integers
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber xs = [x | (DbNumber x) <- xs]

-- 3. Write a function that gets the most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4. Write a function that sums all of the DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = foldr (+) 0 . filterDbNumber

-- 5. Write a function which returns average of DbNumbers
avgDb :: [DatabaseItem] -> Double
avgDb xs = (fromInteger . sum) numbers / (fromIntegral . length) numbers
    where
        numbers = filterDbNumber xs