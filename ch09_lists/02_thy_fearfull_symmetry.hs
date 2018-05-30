-- 1) Using takeWhile and dropWhile, write a function which takes a string nad returns
--    list of string. It splits the input string into multiple string by space character.

myWords :: String -> [String]
myWords [] = []
myWords x = before : myWords after
    where before = takeWhile (/= ' ') x
          after  = (drop 1 . dropWhile (/= ' ')) x

-- 2) Now write a function which splits the string on new line instead of space

myLines :: String -> [String]
myLines [] = []
myLines x = before : myLines after
    where before = takeWhile (/= '\n') x
          after  = (drop 1 . dropWhile (/= '\n')) x

-- 3) Now join the two functions and parametrize the split character
mySplit :: Char -> String -> [String]
mySplit _ [] = []
mySplit c x  = before : (mySplit c after)
    where before = takeWhile (/= c) x
          after  = (drop 1 . dropWhile (/= c)) x

myWords' :: String -> [String]
myWords' = mySplit ' '

myLines' :: String -> [String]
myLines' = mySplit '\n'