import qualified Control.Concurrent as CC
import qualified Control.Concurrent.MVar as MV
import qualified Data.ByteString.Char8 as B
import qualified Data.Locator as DL
import qualified Data.Time.Clock.POSIX as PSX
import qualified Filesystem as FS
import qualified Filesystem.Path.CurrentOS as FPC
import qualified Network.Info as NI
import qualified Safe 
import Control.Exception (mask, try)
import Control.Monad (forever, when)
import Data.Bits
import Data.Bits.Bitwise (fromListBE)
import Data.List.Split (chunksOf)
import Database.Blacktip.Types
import System.IO.Unsafe (unsafePerformIO)

writeTimestamp :: MV.MVar ServerState
               -> FPC.FilePath
               -> IO CC.ThreadId
writeTimestamp s path = do
    CC.forkIO go
    where go = forever $ do
        ss <- MV.readMVar s
        mask $ \_ -> do
            FS.writeFile path (B.pack (show (ssTime ss)))
            -- sleep for 1 second
            CC.threadDelay 1000000

-- 1. What functions are imported from Control.Monad?
--    forever and when

-- 2. Which imports are both unqualified and imported in their entirety
--    Data.Bits, Database.Blacktip.Types

-- 3. What do you suppose importing Blacktip's Types module brings in?
--    New types from Blacktip library

-- 4. Using the code above
-- a) Type signature refers to three aliased imports. What modules are named in those aliases?
--    Control.Concurrent.MVar
--    Filesystem.Path.CurrentOS
--    Control.Concurrent

-- b) Which import does FS.writeFile refer to?
--    Filesystem

-- c) Which import did forever come from?
--    Control.Monad