-- Will the code compile? If not, why? Also fix it!

-- 1. NO, person must implement Show instance
-- data Person = Person Bool
-- 
-- printPerson :: Person -> IO ()
-- printPerson person = putStrLn (show person)
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2. No, Eq instance is not implemented
-- data Mood = Blah | Woot deriving Show
-- 
-- settleDown x = if x == Woot
--                then Blah
--                else x
data Mood = Blah | Woot deriving (Show, Eq)

settleDown x = if x == Woot
               then Blah
               else x

-- 3. Look at settleDown function and answer following questions:
--   a) What values are acceptable inputs to that function?
--       - Blah, Woot
--   b) What will happen if you try to run settleDown 9? Why?
--       - Error - value of incorrect type passed as argument
--   c) What will happen if you try to run Blah > Woot? Why?
--       - Error, Ord instance is not implemented

-- 4. Yes
type Subject = String
type Verb = String
type Object = String

data Sentence = 
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"