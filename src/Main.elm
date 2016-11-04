module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

pageHeader : Html a
pageHeader =
  h1 [class "test", id "miHeader"] [text "Temario"]
  --dos listas: atributos y valores

pageFooter : Html a
pageFooter =
  footer []
    [ a [href "#"]
        [text "Generador de temarios"]
    ]

main : Html a
main =
  div [id "container"] [pageHeader, pageFooter]
