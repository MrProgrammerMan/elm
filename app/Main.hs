module Main (main) where

import Network.Wai.Handler.Warp (run)
import Servant

-- For now the whole "API" is just: serve ./static as-is.
-- Later: type API = "api" :> ... :<|> Raw
type API = Raw

server :: Server API
server = serveDirectoryFileServer "dist"

main :: IO ()
main = do
  putStrLn "Serving ./static on http://localhost:8080"
  run 8080 (serve (Proxy :: Proxy API) server)
