{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Web.Scotty
import Control.Monad.Trans
import System.Random (randomRIO)
import System.Directory (listDirectory)

import Prelude ()
import Prelude.Compat

main :: IO ()
main = scotty 3000 $ do
    get "/" $ do
        images <- liftIO $ listDirectory "assets"
        random <- (images !!) <$> randomRIO (0, length images - 1)
        file $ "assets/" ++ tail (take (length (show random) - 1) (show random))

