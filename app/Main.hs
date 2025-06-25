module Main (main) where

import Lib
import System.Environment (getArgs)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
  args <- getArgs
  print args
  case args of
    [] -> runPrompt
    [x] -> runFile x
    _ -> putStrLn "Usage: jlox [script]"

runFile :: String -> IO ()
runFile = undefined

runPrompt :: IO ()
runPrompt = do
  putStr "> "
  hFlush stdout
  line <- getLine
  case line of
    "" -> return ()
    l -> do
      run l
      runPrompt

run :: String -> IO ()
run = putStrLn
