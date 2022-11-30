local addonName, ns = ...
local RT = _G.ReduxTextures
local L = RT.L

RT.Styles = { Vanilla = "Vanilla", Modern = "Modern" }

RT.config = {}
RT.config.defaults = { profile = { style = RT.Styles.Modern } }

RT.config.options = {
    type = "group",
    name = RT.title,
    args = {
        general = {
            type = "group",
            name = L["General"],
            order = 1,
            args = {
                style = {
                    type = "select",
                    name = L["Style"],
                    desc = L["The texture style to use. Vanilla uses old fashioned textures, whereas Modern uses modern textures."],
                    order = 1,
                    hidden = false,
                    disabled = false,
                    values = RT.Styles,
                    get = function()
                        for key, value in pairs(RT.Styles) do
                            if value == RT.config.db.profile.style then
                                return key
                            end
                        end
                    end,
                    set = function(_, key)
                        RT.config.db.profile.style = RT.Styles[key]
                        RT:Update()
                    end
                }
            }
        }
    }
}

function RT:SetupConfig()
    RT.config.db = RT.Libs.AceDB:New(addonName .. "_DB", RT.config.defaults)
end

function RT:SetupOptions()
    RT.config.options.args.profiles = RT.Libs.AceDBOptions:GetOptionsTable(RT.config.db)
    RT.config.options.args.profiles.order = 99

    RT.Libs.AceConfigRegistry:RegisterOptionsTable(RT.name, RT.config.options)
    RT.config.dialog = RT.Libs.AceConfigDialog:AddToBlizOptions(RT.name, RT.title)

    RT.Libs.AceConfigDialog:SetDefaultSize(RT.name, 900, 700)
end
