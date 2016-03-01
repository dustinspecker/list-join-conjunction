module Tests (..) where

import ElmTest exposing (..)
import String
import ListJoinConjunction


all : Test
all =
  suite
    "ListJoinConjunction"
    [ defaultTest
        (assertEqual
          ""
          (ListJoinConjunction.make "and" [])
        )
    , defaultTest
        (assertEqual
          "red"
          (ListJoinConjunction.make "and" [ "red" ])
        )
    , defaultTest
        (assertEqual
          "red and blue"
          (ListJoinConjunction.make "and" [ "red", "blue" ])
        )
    , defaultTest
        (assertEqual
          "red, blue, and white"
          (ListJoinConjunction.make "and" [ "red", "blue", "white" ])
        )
    , defaultTest
        (assertEqual
          "red, blue, and white"
          (ListJoinConjunction.make "and" [ "red", "blue", "white" ])
        )
    , defaultTest
        (assertEqual
          "red or blue"
          (ListJoinConjunction.make "or" [ "red", "blue" ])
        )
    , defaultTest
        (assertEqual
          "red, blue, or white"
          (ListJoinConjunction.make "or" [ "red", "blue", "white" ])
        )
    ]
