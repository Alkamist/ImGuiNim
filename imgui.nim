import
  imgui/[build, flags, types,
         functions, methods,
         constructors, destructors]

# Render()

{.emit: """
#include "imgui.h"
#include "imgui_internal.h"
""".}


let vec = constructImVec2()


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