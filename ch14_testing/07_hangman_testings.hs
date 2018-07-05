-- Write tests for fillInCharacter and handleGuess functions from hangman game.

import Data.List (intersperse)
import Test.Hspec

data Puzzle = Puzzle String [Maybe Char] [Char]

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing  = '_'
renderPuzzleChar (Just c) = c

instance Show Puzzle where
    show (Puzzle w discovered guessed) = (intersperse ' ' $ fmap renderPuzzleChar discovered)
                                         ++ " Guessed so far: " ++ guessed ++ " word: " ++ w


charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle w _ _) c = elem c w

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) c = elem c guessed

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar s) c = 
      Puzzle word newFilledInSoFar (c : s)
      where zipper guessed wordChar guessChar = 
               if wordChar == guessed
               then Just wordChar
               else guessChar
            newFilledInSoFar = zipWith (zipper c) word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guessed that character, pick something else!"
      return puzzle
    (True, _) -> do
      putStrLn "This character was in the word, filling in the word accordingly"
      return (fillInCharacter puzzle guess)
    (_False, _) -> do
      putStrLn "This character wasn't in the word, try again."
      return (fillInCharacter puzzle guess)

test :: IO ()
test = hspec $ do
    describe "hangman testing" $ do
        it "fill l" $ do
            getFilled (fillInCharacter testPuzzle 'l') `shouldBe` [Just 'h', Nothing, Just 'l', Just 'l', Just 'o'] 
        it "fill m" $ do
            getFilled (fillInCharacter testPuzzle 'm') `shouldBe` [Just 'h', Nothing, Nothing, Nothing, Just 'o'] 
        
        it "handle k" $ do
            result <- handleGuess testPuzzle 'k'
            getGuessed result `shouldBe` "kp"
        it "handle e" $ do
            result <- handleGuess testPuzzle 'e'
            getFilled result `shouldBe` [Just 'h', Just 'e', Nothing, Nothing, Just 'o'] 
        it "handle q" $ do
            result <- handleGuess testPuzzle 'q'
            getFilled result `shouldBe` getFilled testPuzzle
    where 
        testPuzzle = Puzzle "hello" [Just 'h', Nothing, Nothing, Nothing, Just 'o'] "kp"
        getFilled (Puzzle _ filled _) = filled
        getGuessed (Puzzle _ _ guessed) = guessed
