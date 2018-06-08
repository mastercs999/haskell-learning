import Data.Char

-- 1. Write function capitalizing a word
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

-- 1. Write a function capitalizing sentences in paragraph. Reuse capitalizeWord function.
sentences :: String -> [String]
sentences [] = []
sentences para = before para : (sentences $ after para)
    where before = (++['.']) . takeWhile (/='.')
          after  = dropWhile (==' ') . drop 1 . dropWhile (/='.')

capitalizeParagraph :: String -> String 
capitalizeParagraph [] = []
capitalizeParagraph para = unwords . map capitalizeWord . sentences $ para