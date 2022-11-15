local addonName, ns = ...

local function FixAuctionatorFrameTextures()
    AuctionFrameTopLeft:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\TopLeft")
    AuctionFrameTop:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\Top")
    AuctionFrameTopRight:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\TopRight")
    AuctionFrameBotLeft:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\BottomLeft")
    AuctionFrameBot:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\Bottom")
    AuctionFrameBotRight:SetTexture("Interface\\AddOns\\ReduxTextures\\Textures\\Auctionator\\BottomRight")
end

local eventFrame = CreateFrame("Frame", addonName .. "EventFrame_Auctionator")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        if _G.AuctionatorTabMixin then
            hooksecurefunc(_G.AuctionatorTabMixin, "Selected", FixAuctionatorFrameTextures)
        end
    end
end)
