-- Write folder for tree. Any traversal is fine.

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left x right) = inorder left ++ [x] ++ inorder right

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ z Leaf                = z
foldTree f z (Node left x right) = foldTree f (f x (foldTree f z left)) right