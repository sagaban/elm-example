module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

-- MODEL

type alias Tema = {
  titulo : String,
  duracion : Int,
  id : Int
  }

nuevoTema : String -> Int -> Int -> Tema
nuevoTema titulo duracion id =
  {
    titulo = titulo,
    duracion = duracion,
    id = id
  }
-- VIEW

pageHeader : Html node
pageHeader =
  h1 [class "test", id "miHeader"] [text "Temario"]
  --dos listas: atributos y valores

pageFooter : Html node
pageFooter =
  footer []
    [ a [href "#"]
        [text "Generador de temarios"]
    ]

--no hay diferencia entre parámetros de entrada y de salida
-- acá voy a recibir un string y un int, y devuelvo un html
capitulo : Tema -> Html node
capitulo cap =
  li []
    [span [class "titulo"] [text cap.titulo],
     span [class "duracion"] [text (toString cap.duracion)]
    ]

capitulos : Html node
capitulos =
  ul [] [ capitulo (nuevoTema "Introduccion" 5 1),
          capitulo (nuevoTema "testing model" 2 2)]

--Usamos Model, Update y view
view : Html node
view =
    div [id "container"] [pageHeader, capitulos, pageFooter]

main : Html node
main =
  view
