-- Mad libs is a game, where players put words to blank spaces in a story.
-- Resulting story is often comical.
-- Rewrite given function using mconcat

import Data.Monoid

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' e adv noun adj =
    e <> "! he said " <>
    adv <> " as he jumped into his convertible " <>
    noun <> " and drove off with his " <>
    adj <> " wife."

madlibbinBetter' :: Exclamation
                 -> Adverb
                 -> Noun
                 -> Adjective
                 -> String
madlibbinBetter' e adv noun adj = mconcat
    [e, "! he said ", 
     adv, " as he jumped into his convertible ", 
     noun, " and drove off with his ", 
     adj, " wife."]