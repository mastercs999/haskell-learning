-- Given datatype is defined
data Mood = Blah | Woot deriving Show

-- 1. What is the type constructor, or name of this type?
-- Mood

-- 2. If the function requires a Mood value, what values could you possibly use?
-- Blah and Woot

-- 3. There should be function flipping mood. 
--    What's wrong with its type signature changeMood :: Mood -> Woot?
-- It must be changeMood :: Mood -> Mood

-- 4. Write the function for changing mood. Start with code below and fix it.
--    changeMood Mood = Woot
--    changeMood _ = Blah
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

-- 5. Just write whole code into source code. We just did it.