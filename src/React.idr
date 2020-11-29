module React

import Js.Array
import Js.Object
import Js.FFI

public export
data ReactElement : Type

public export
data ReactClass : Type

export
text : String -> ReactElement
text = unsafeCoerce

%foreign (req "react" "(x, props, children)" "createElement(x, props, children)")
js_createElement : ReactClass -> Object -> Array ReactElement -> ReactElement

export
createElement : ReactClass -> List Object -> List ReactElement -> ReactElement
createElement x props = js_createElement x (fromList props) . fromList

export
%foreign (js "x => x")
classFromTag : String -> ReactClass

export
el : String -> List Object -> List ReactElement -> ReactElement
el tag = createElement (classFromTag tag)

export
%foreign (req "react" "f" "createElement(f, {}, [])")
fc : IO ReactElement -> ReactElement

%foreign (req "react" "f" "useEffect(f)")
prim__useEffect : IO () -> PrimIO ()

export
useEffect : IO () -> IO ()
useEffect = primIO . prim__useEffect
