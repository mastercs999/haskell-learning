-- How many unique inhabitants each type has?
data Quad = One
          | Two
          | Three
          | Four
          deriving (Eq, Show)
    
-- 1. 8 = 4 + 4
eQuad :: Either Quad Quad
eQuad = undefined         

-- 2. 16 = 4 * 4
prodQuad :: (Quad, Quad)
prodQuad = undefined

-- 3. 256 = 4^4
funcQuad :: Quad -> Quad
funcQuad = undefined

-- 4. 8 = 2 * 2 * 2
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined

-- 5. 16 = 2^2^2
gTwo :: Bool -> Bool -> Bool
gTwo = undefined

-- 6. 65 536 = (4^4)^2
fTwo :: Bool -> Quad -> Quad
fTwo = undefined

