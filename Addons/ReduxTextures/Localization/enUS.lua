local addonName, ns = ...
local RT = _G.ReduxTextures

local L = RT.GetLocales("enUS") or RT.GetLocales("enGB")
if not L then
    return
end

L["+"] = "+"
L["D"] = "D"
L["R"] = "R"
L["Chained Spirit"] = "Chained Spirit"
