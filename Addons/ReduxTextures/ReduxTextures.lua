local addonName, ns = ...

local function FixWorldMapTextures()
    local layout = { "Top", "Middle", "Bottom" }
    local regions = { WorldMapFrame.BorderFrame:GetRegions() }
    local i, j = 1, 1
    for _, region in ipairs(regions) do
        if region.GetTexture then
            region:SetTexture("Interface\\Addons\\ReduxTextures\\Textures\\WorldMap\\" .. layout[j] .. i)
            region:SetTexCoord(0, 1, 0, 1)

            if i >= 4 then
                i = 1
                j = j + 1
            else
                i = i + 1
            end
        end
    end
end

local eventFrame = CreateFrame("Frame", addonName .. "EventFrame_LeatrixMaps")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.5, FixWorldMapTextures)
    end
end)