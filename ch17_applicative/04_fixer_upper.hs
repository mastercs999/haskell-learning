-- Use <$>, <*> and pure to make the code work

-- 1. const <$> Just "Hello" <*> "world"
x = const <$> Just "Hello" <*> pure "world"

-- 2. (,,,) Just 90 <*> Just 10 Just "Tierness" [1, 2, 3]
y = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]