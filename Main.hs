{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


import qualified GHC.Generics                   as GG
import qualified System.Console.GetOpt.Generics as SG

import           Data.Char                      (isAlphaNum)
import           Text.Regex                     (Regex, matchRegex, mkRegex)


data Options = Options
    { regex :: String
    } deriving (Show, GG.Generic)
instance SG.Generic Options
instance SG.HasDatatypeInfo Options


writeLine :: Regex -> String -> IO ()
writeLine regex_ line =
    case matchRegex regex_ line of
        Just (match:_) ->
            appendFile ("_" ++ filter isAlphaNum match) $ line ++ "\n"
        _ -> return ()


otherMain :: String -> IO ()
otherMain regexString = do
    logString <- getContents
    mapM_ write $ lines logString
    where
        regex_ = mkRegex regexString
        write = writeLine regex_


main :: IO ()
main = do
    _o@Options{..} <- SG.getArguments
    otherMain regex
