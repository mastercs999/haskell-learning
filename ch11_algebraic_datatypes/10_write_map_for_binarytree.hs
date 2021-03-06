-- Write map function mapTree. It should work the same way as map works for lists

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf                = Leaf
mapTree f (Node left x right) = Node (mapTree f left) (f x) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: BinaryTree Integer
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- Test whether it works
mapOkay = if mapTree (+1) testTree' == mapExpected
          then print "yup okay!"
          else error "test failed!"