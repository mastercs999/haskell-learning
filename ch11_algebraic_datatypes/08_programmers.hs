data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgrammingLanguage = Haskell
                         | Agda
                         | Irdis
                         | PureScript
                         deriving (Eq, Show)

data Programmer = Programmer {
    os :: OperatingSystem,
    lang :: ProgrammingLanguage
} deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems = 
    [
        GnuPlusLinux,
        OpenBSDPlusNevermindJustBSDStill,
        Mac,
        Windows
    ]

allLanguages :: [ProgrammingLanguage]
allLanguages = 
    [
        Haskell,
        Agda,
        Irdis,
        PureScript
    ]

-- Write a function generating all possible values of a programmer.
allProgrammers :: [Programmer]
allProgrammers = [Programmer { os = os, lang = lang } | os <- allOperatingSystems, lang <- allLanguages]