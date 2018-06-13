data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

-- 1. Write unfold for binary tree
unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f start = case f start of
                    Nothing               -> Leaf
                    Just (left, n, right) -> Node (unfold f left) n (unfold f right)

-- 2. Make a tree builder using unfold.
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold f 0
                where f x
                        | x >= n     = Nothing
                        | otherwise = Just (x + 1, x, x + 1)