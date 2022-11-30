local addonName, ns = ...
local RT = _G.ReduxTextures

local parts = { "TopLeft", "Top", "TopRight", "BotLeft", "Bot", "BotRight" }

function RT:FixAuctionatorFrameTextures()
    for _, part in ipairs(parts) do
        local texture = _G["AuctionFrame" .. part]
        if texture then
            _G["AuctionFrame" .. part]:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\" .. RT.config.db.profile.style .. "\\" .. part)
        end
    end
end
