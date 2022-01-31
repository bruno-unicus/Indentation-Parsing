import System.IO
import Data.Char
import Data.List
import Data.String                   
import Data.String.Utils                   

test :: Int -> String
test x
  | x > 100 = "Big"
  | otherwise = "small"

printToScreen :: [[String]] -> IO ()
printToScreen = putStrLn . show

printToScreen' :: [[[String]]] -> IO ()
printToScreen' = mapM_ printToScreen 

groupByIndent :: [String] -> [[String]]
groupByIndent = groupBy sameIndent

sameIndent :: String -> String -> Bool
sameIndent (' ':a) (' ':b) = True && sameIndent a b
sameIndent (_:a) (' ':b) = False 
sameIndent (' ':a) (_:b) = False
sameIndent _ _ = True

groupByBlocks :: [String] -> [[String]]
groupByBlocks = groupBy (const (not . null)) 

main = do
  contents <- readFile "Main.hs"
  printToScreen' $ map groupByIndent $ groupByBlocks $ map rstrip $ lines contents
  putStrLn $ test 10 