local addonName, ns = ...

local function RestoreQuestLogFrameTextures()
    if _G.LeaPlusDB and _G.LeaPlusDB["EnhanceQuestLog"] == "On" and _G.LeaPlusDB["EnhanceQuestTaller"] == "On" then
        local regions = { _G["QuestLogFrame"]:GetRegions() }

        regions[2]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Left")
        regions[2]:SetTexCoord(0, 1, 0, 1)
        regions[2].SetTexture = nil
        regions[2].SetTexCoord = nil

        regions[3]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Right")
        regions[3]:SetTexCoord(0, 1, 0, 1)
        regions[3].SetTexture = nil
        regions[3].SetTexCoord = nil
    end
end

local function RestoreTradeSkillFrameTextures()
    if _G.LeaPlusDB and _G.LeaPlusDB["EnhanceProfessions"] == "On" then
        local regions = { _G["TradeSkillFrame"]:GetRegions() }

        regions[3]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Left")
        regions[3]:SetTexCoord(0, 1, 0, 1)
        regions[3].SetTexture = nil
        regions[3].SetTexCoord = nil

        regions[4]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Right")
        regions[4]:SetTexCoord(0, 1, 0, 1)
        regions[4].SetTexture = nil
        regions[4].SetTexCoord = nil
    end
end

local function RestoreClassTrainerFrameTextures()
    if _G.LeaPlusDB and _G.LeaPlusDB["EnhanceTrainers"] == "On" then
        local regions = { _G["ClassTrainerFrame"]:GetRegions() }

        regions[2]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Left")
        regions[2]:SetTexCoord(0, 1, 0, 1)
        regions[2].SetTexture = nil
        regions[2].SetTexCoord = nil

        regions[3]:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Tall-Right")
        regions[3]:SetTexCoord(0, 1, 0, 1)
        regions[3].SetTexture = nil
        regions[3].SetTexCoord = nil
    end
end

local eventFrame = Frame("Frame", addonName .. "EventFrame_LeatrixPlus")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.5, RestoreQuestLogFrameTextures)
    elseif event == "ADDON_LOADED" then
        local loadedAddonName = ...
        if loadedAddonName == "Blizzard_TradeSkillUI" then
            C_Timer.After(0.1, RestoreTradeSkillFrameTextures)
        elseif loadedAddonName == "Blizzard_TrainerUI" then
            C_Timer.After(0.1, RestoreClassTrainerFrameTextures)
        end
    end
end)