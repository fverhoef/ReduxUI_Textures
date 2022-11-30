local addonName, ns = ...
local RT = _G.ReduxTextures

local L = RT.GetLocales("esES") or RT.GetLocales("esMX")
if not L then
    return
end

L["+"] = "+"
L["D"] = locale == "esMX" and "C" or "M"
L["R"] = "B"
L["Chained Spirit"] = "Espíritu encadenado"
