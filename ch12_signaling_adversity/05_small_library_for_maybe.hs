-- 1. Write a function which checks for Maybe values
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _       = True

isNothing :: Maybe a -> Bool
isNothing = not . isJust

-- 2. This function should take a maybe and a value.
--    If maybe is nothing, the value is returned.
--    Otherwise result of function and maybe is returned
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x _ Nothing  = x
mayybee _ f (Just y) = f y

-- 3. This function should extract value from just, otherwise a default given value.
fromMaybe :: a -> Maybe a -> a
fromMaybe x y = mayybee x id y

-- 4. Functions for converting between List and Maybe.
listToMaybe :: [a] -> Maybe a
listToMaybe []    = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just x) = [x]

-- 5. Removes Nothing from a list
catMaybes :: [Maybe a] -> [a]
catMaybes []     = []
catMaybes (x:xs) = maybeToList x ++ catMaybes xs 

-- 6. Move maybe to a whole list
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe []           = Just []
flipMaybe (Nothing:xs) = Nothing
flipMaybe (Just x:xs)  = case flipMaybe xs of
                              Nothing   -> Nothing
                              (Just ys) -> Just $ x:ys