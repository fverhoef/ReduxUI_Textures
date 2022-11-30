local addonName, ns = ...
local RT = _G.ReduxTextures

local L = RT.GetLocales("deDE")
if not L then
    return
end

L["+"] = "+"
L["D"] = "D"
L["R"] = "S"
L["Chained Spirit"] = "Angeketteter Geist"
