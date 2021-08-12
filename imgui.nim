import
  imgui/[build, flags, types,
         functions, methods,
         constructors, destructors]

# Render()

{.emit: """
#include "imgui.h"
#include "imgui_internal.h"
""".}


proc main =
  var vec = constructImVec2(5, 1)
  echo vec.x

main()


# import std/macros

# macro withNamespace(namespace: static[string], n: untyped): untyped =
#   for procedure in n:
#     procedure.addPragma(
#       nnkExprColonExpr.newTree(
#         ident "importcpp",
#         newStrLitNode(namespace & "::" & procedure.name.strVal),
#       ),
#     )
#   n

# expandMacros:
#   withNamespace("ImGui"):
#     proc CreateContext*(value: float): int