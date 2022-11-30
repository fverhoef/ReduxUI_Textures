local addonName, ns = ...
local RT = _G.ReduxTextures
RT.L = {}

local localeSave = {}

function RT.GetLocales(locale)
    return GetLocale() == locale and RT.L or nil
end

setmetatable(RT.L, {
    __index = function(self, key)
        return localeSave[key] or key
    end,
    __newindex = function(self, key, value)
        rawset(localeSave, key, value == true and key or value)
    end
})
