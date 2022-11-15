local addonName, ns = ...

local function RestoreWorldMapTextures()
    if _G.LeaMapsDB then
        local layout = { "Top", "Middle", "Bottom" }
        local regions = { WorldMapFrame.BorderFrame:GetRegions() }
        local i, j = 1, 1
        for _, region in ipairs(regions) do
            if region.GetTexture and region:GetTexture() == "Interface\\AddOns\\Leatrix_Maps\\Leatrix_Maps_Frame.blp" then
                region:SetTexture("Interface\\WorldMap\\UI-WorldMap-" .. layout[j] .. i)
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
end

local eventFrame = Frame("Frame", addonName .. "EventFrame_LeatrixMaps")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.5, RestoreWorldMapTextures)
    end
end)
