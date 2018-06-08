data Example = MakeExample deriving Show

-- 1. What is type of data constructor MakeExample? What happen when
--    you request the type of Example?
--    MakeExample :: Example
--    Only MakeExample value can be passed as Example

-- 2. What if you try :i Example? Can you determine typeclass instances defined for Example?
--    It shows typeclass instances of Example and Example declaration
--    It is instance of Show typeclass only

-- 3. Define similar datatype with one data constructor accepting one Int argument.
--    What has changed on :t MakeExample'?
data Example' = MakeExample' Int deriving Show
--    MakeExample' :: Int -> Example