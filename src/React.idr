module React

import Js.Array
import Js.Object
import Js.FFI

export
data ReactElement : Type

export
data ReactClass : Type

export
text : String -> ReactElement
text = unsafeCoerce

%foreign (req "react" "(x, props, children)" "createElement(x, props, children)")
js_createElement : String -> Object -> Array ReactElement -> ReactElement

export
createElement : String -> List Object -> List ReactElement -> ReactElement
createElement x props = js_createElement x (fromList props) . fromList

export
el : String -> List Object -> List ReactElement -> ReactElement
el = createElement

export
%foreign (req "react" "f" "createElement(f, {}, [])")
fc : IO ReactElement -> ReactElement

%foreign (req "react" "f" "useEffect(f)")
prim__useEffect : IO () -> PrimIO ()

export
useEffect : IO () -> IO ()
useEffect = primIO . prim__useEffect
