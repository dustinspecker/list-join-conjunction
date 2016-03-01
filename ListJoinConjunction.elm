module ListJoinConjunction (make) where

{-| Join a List with a conjunction.

# Usage
@docs make
-}

import List
import Maybe
import String


last : List String -> List String
last list =
  case List.length list of
    0 ->
      []

    1 ->
      list

    _ ->
      last (Maybe.withDefault [] (List.tail list))


{-| Join a List of Strings into a String.

    ListJoinConjunction.make "and" [ "red", "blue" ] -- "red and blue"
    ListJoinConjunction.make "or" [ "red", "blue" ] -- "red or blue"
    ListJoinConjunction.make "and" [ "red", "blue", "white" ] -- "red, blue, and white"
-}
make : String -> List String -> String
make conjunction list =
  case List.length list of
    0 ->
      ""

    1 ->
      String.join "" list

    2 ->
      String.join (" " ++ conjunction ++ " ") list

    _ ->
      let
        joinedList : List String
        joinedList =
          List.take ((List.length list) - 1) list

        appendAnd : String
        appendAnd =
          (", " ++ conjunction ++ " ")
            |> String.append (String.join ", " joinedList)
      in
        appendAnd ++ (String.join "" (last list))
