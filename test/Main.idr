module Main

import Js.Console
import Js.Dom
import Js.Object
import React
import ReactDOM

view : ReactElement
view = el "div" []
  [ el
      "h1"
      ["style" =: ("color" =: "red")]
      [text "Kek"]
  , el
    "p"
    []
    [ fc $ do
        useEffect $ log "Hell, Yes!!!!"
        pure $ text "Kevin"
    ]
  ]

main : IO ()
main = render view !(getElementById "app-root")
