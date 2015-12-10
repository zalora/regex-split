{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


import           Data.Char          (isAlphaNum)
import           System.Environment (getEnv)
import           Text.Regex         (Regex, matchRegex, mkRegex)


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
    regex <- getEnv "REGEX"
    otherMain regex
