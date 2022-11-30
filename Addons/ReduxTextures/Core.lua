local addonName, ns = ...

local RT = _G.LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")
ns[1] = RT
_G[addonName] = RT

RT.name = RT.name or addonName
RT.title = "|cff00c3ffRedux|r |cffd78219Textures|r"
RT.shortcut = "rt"

RT.isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

RT.Libs = {}
function RT:AddLib(name, major, minor)
    if not name then
        return
    end

    RT.Libs[name] = _G.LibStub(major, minor)
end

RT:AddLib("AceConsole", "AceConsole-3.0")
RT:AddLib("AceDB", "AceDB-3.0")
RT:AddLib("AceDBOptions", "AceDBOptions-3.0")
RT:AddLib("AceConfig", "AceConfig-3.0")
RT:AddLib("AceConfigDialog", "AceConfigDialog-3.0")
RT:AddLib("AceConfigRegistry", "AceConfigRegistry-3.0")
RT:AddLib("CallbackHandler", "CallbackHandler-1.0")
RT:AddLib("SharedMedia", "LibSharedMedia-3.0")

function RT:OnInitialize()
    RT:SetupConfig()
    RT:SetupOptions()

    RT:RegisterEvent("ADDON_LOADED")
    RT:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function RT:Update()
    RT:RestoreClassTrainerFrameTextures()
    RT:RestoreTradeSkillFrameTextures()
    RT:FixWorldMapTextures()
    if _G.AuctionatorTabMixin then
        RT:FixAuctionatorFrameTextures()
    end
end

function RT:ADDON_LOADED(event, loadedAddonName)
    if loadedAddonName == "Blizzard_TradeSkillUI" then
        C_Timer.After(0.05, RT.RestoreTradeSkillFrameTextures)
    elseif loadedAddonName == "Blizzard_TrainerUI" then
        C_Timer.After(0.05, RT.RestoreClassTrainerFrameTextures)
    end
end

function RT:PLAYER_ENTERING_WORLD()
    C_Timer.After(0.5, RT.FixWorldMapTextures)

    if _G.AuctionatorTabMixin then
        if not RT:IsHooked(_G.AuctionatorTabMixin, "Selected") then
            RT:SecureHook(_G.AuctionatorTabMixin, "Selected", RT.FixAuctionatorFrameTextures)
        end
    end
end

function RT:FixWorldMapTextures()
    local layout = { "Top", "Middle", "Bottom" }
    local regions = { WorldMapFrame.BorderFrame:GetRegions() }
    local i, j = 1, 1
    for _, region in ipairs(regions) do
        if region.GetTexture then
            region:SetTexture("Interface\\Addons\\ReduxTextures\\Textures\\WorldMap\\" .. RT.config.db.profile.style .. "\\" .. layout[j] .. i)
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
