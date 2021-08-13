{.emit: """

typedef int ImGuiKeyModFlags;

enum ImGuiKeyModFlags_
{
  ImGuiKeyModFlags_None = 0,
  ImGuiKeyModFlags_Ctrl = 1 << 0,
  ImGuiKeyModFlags_Shift = 1 << 1,
  ImGuiKeyModFlags_Alt = 1 << 2,
  ImGuiKeyModFlags_Super = 1 << 3
};

typedef int ImGuiMouseCursor;

enum ImGuiMouseCursor_
{
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput,
    ImGuiMouseCursor_ResizeAll,
    ImGuiMouseCursor_ResizeNS,
    ImGuiMouseCursor_ResizeEW,
    ImGuiMouseCursor_ResizeNESW,
    ImGuiMouseCursor_ResizeNWSE,
    ImGuiMouseCursor_Hand,
    ImGuiMouseCursor_NotAllowed,
    ImGuiMouseCursor_COUNT
};

""".}



type
  ImGuiKeyModFlag* {.size: sizeof(cint).} = enum
    Ctrl,
    Shift,
    Alt,
    Super,

  ImGuiKeyModFlags* = set[ImGuiKeyModFlag]

proc toInt*(flags: ImGuiKeyModFlags): int = cast[cint](flags)
proc toFlags*(value: int): ImGuiKeyModFlags = cast[ImGuiKeyModFlags](value)

echo (1 shl 1) or (1 shl 2) or (1 shl 3)
echo {Shift, Alt, Super}.toInt



type
  ImGuiMouseCursor* = enum
    None = -1,
    Arrow = 0,
    TextInput,
    ResizeAll,
    ResizeNS,
    ResizeEW,
    ResizeNESW,
    ResizeNWSE,
    Hand,
    NotAllowed,