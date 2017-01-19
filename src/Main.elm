module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

-- MODEL

type alias Tema = {
  titulo : String,
  duracion : Int,
  id : Int
  }

type alias Model = List Tema

modeloInicial : Model
modeloInicial =
  [
    nuevoTema "01. Introduccion" 5 1,
    nuevoTema "99. Cierre" 4 2,
    nuevoTema "02. Apertura" 2 3
  ]

nuevoTema : String -> Int -> Int -> Tema
nuevoTema titulo duracion id =
  {
    titulo = titulo,
    duracion = duracion,
    id = id
  }

-- UPDATE

type Action = NoOp | SortByTitulo | SortByDuracion

update : Action -> Model -> Model
update action modelo =
  case action of
    NoOp ->
      modelo
    SortByTitulo ->
      List.sortBy .titulo modelo
    SortByDuracion ->
      List.sortBy .duracion modelo


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

{- Ya no lo uso

capitulos : Html node
capitulos =
  ul [] [ capitulo (nuevoTema "Introduccion" 5 1),
          capitulo (nuevoTema "testing model" 2 2)]
-}


--Usamos Model, Update y view
view : Model -> Html node
view modelo =
    div [id "container"] [
      pageHeader,
      ul [] (List.map capitulo modelo),
      pageFooter
    ]

main : Html node
main =
  modeloInicial
    |> update SortByTitulo
    |> view
