module ListJoinConjunction (make) where

{-| Join a List with a conjunction.

# Usage
@docs make
-}

import Last
import String


{-| Join a List of Strings into a String with a conjunction.

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
      String.join " " [ ",", conjunction, (Maybe.withDefault "" (Last.fromList list)) ]
        |> String.append
            (List.take ((List.length list) - 1) list
              |> String.join ", "
            )
