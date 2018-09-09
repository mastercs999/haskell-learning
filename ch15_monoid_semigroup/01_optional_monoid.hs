-- Write Monoid instance for Maybe type renamed to Optional

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
    mempty = Nada
    mappend Nada y = y
    mappend x Nada = x
    mappend (Only x) (Only y) = Only $ mappend x y 