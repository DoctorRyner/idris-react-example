module ReactDOM

import Js.FFI
import Js.Dom
import React

%foreign (req "react-dom" "(el, root)" "render(el, root)")
prim__render : ReactElement -> HtmlElement -> PrimIO ()

export
render : ReactElement -> HtmlElement -> IO ()
render el = primIO . prim__render el
