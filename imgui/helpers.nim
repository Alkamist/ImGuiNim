import types

when defined(IMGUI_USE_BGRA_PACKED_COLOR):
  const
    IM_COL32_R_SHIFT* = 16
    IM_COL32_G_SHIFT* = 8
    IM_COL32_B_SHIFT* = 0
    IM_COL32_A_SHIFT* = 24
    IM_COL32_A_MASK* = 0xFF000000
else:
  const
    IM_COL32_R_SHIFT* = 0
    IM_COL32_G_SHIFT* = 8
    IM_COL32_B_SHIFT* = 16
    IM_COL32_A_SHIFT* = 24
    IM_COL32_A_MASK* = 0xFF000000

template IM_COL32*(R, G, B, A): untyped =
  (((ImU32)(A) shl IM_COL32_A_SHIFT) or
   ((ImU32)(B) shl IM_COL32_B_SHIFT) or
   ((ImU32)(G) shl IM_COL32_G_SHIFT) or
   ((ImU32)(R) shl IM_COL32_R_SHIFT))

const
  IM_COL32_WHITE* = IM_COL32(255, 255, 255, 255)
  IM_COL32_BLACK* = IM_COL32(0, 0, 0, 255)
  IM_COL32_BLACK_TRANS* = IM_COL32(0, 0, 0, 0)