module ListJoinConjunction (make) where

{-| Join a List with a conjunction.

# Usage
@docs make
-}

import List.Extra
import String


{-| Join a List of Strings into a String with a conjunction.

    ListJoinConjunction.make "and" [ "red", "blue" ] -- "red and blue"
    ListJoinConjunction.make "or" [ "red", "blue" ] -- "red or blue"
    ListJoinConjunction.make "and" [ "red", "blue", "white" ] -- "red, blue, and white"
-}
make : String -> List String -> String
make conjunction list =
  case (List.length list) > 2 of
    False ->
      String.join (" " ++ conjunction ++ " ") list

    True ->
      Maybe.withDefault [] (List.Extra.init list)
        |> String.join ", "
        |> (flip String.append) (String.join " " [ ",", conjunction, (Maybe.withDefault "" (List.Extra.last list)) ])
