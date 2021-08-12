import
  imgui/[build, flags, types,
         functions, methods,
         constructors, destructors]

{.emit: """/*INCLUDESECTION*/
#include "imgui.h"
#include "imgui_internal.h"
""".}

proc main =
  let test = constructImGuiIO()

main()



# import std/[macros, strutils]

# macro makeConstructors(n: untyped): untyped =
#   for procedure in n:
#     var nameStr = procedure.name.strVal
#     nameStr.removePrefix("construct")

#     procedure.addPragma(ident "constructor")

#     procedure.addPragma(
#       nnkExprColonExpr.newTree(
#         ident "importcpp",
#         newStrLitNode(nameStr & "(@)"),
#       ),
#     )
#   n

# type
#   ImVec2 = object
#   ImVec4 = object
#   ImVector[T] = object
#   ImGuiStyle = object
#   ImGuiIO = object

# expandMacros:
#   makeConstructors:
#     proc constructImVec2*(): ImVec2
#     proc constructImVec2*(x: cfloat; y: cfloat): ImVec2

#     proc constructImVec4*(): ImVec4
#     proc constructImVec4*(x: cfloat; y: cfloat; z: cfloat; w: cfloat): ImVec4

#     proc constructImVector*[T](): ImVector[T]
#     proc constructImVector*[T](src: ImVector[T]): ImVector[T]

#     proc constructImGuiStyle*(): ImGuiStyle

#     proc constructImGuiIO*(): ImGuiIO