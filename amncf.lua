local _G = getfenv(0)

local amncf = CreateFrame("BUTTON", nil, UIParent)
--[[ Function FixChat ]]--
-- A function that removes the textures from the ChatFrames.
--]]
local FixChat = function()
	for i = 1,7 do
		for k,v in pairs(CHAT_FRAME_TEXTURES) do
			_G["ChatFrame"..i..v]:Hide()
		end
	end
	
	for k in pairs(CHAT_FRAME_TEXTURES) do
		CHAT_FRAME_TEXTURES[k] = nil
	end
end

--[[
 Function MakeFrame 
-- The function that makes a frame with the given options taken from the arguments
-- Parameters:
-- r - Amount of red in the colour of the frame
-- g - Amount of green in the colour of the frame
-- b - Amount of blue in the colour of the frame
-- a - Alpha (transparency) of the frame
--]]
local MakeFrame = function(r, g, b, a) 
	local frame = CreateFrame("Frame", nil, UIParent)


	frame:SetBackdrop({
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = true, tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
		insets = {left = 0, right = 0, top = 0, bottom = 0},
	})
	frame:SetBackdropColor(r, g, b, a)
	frame:SetBackdropBorderColor(0, 0, 0, 0)
	frame:SetFrameStrata"BACKGROUND"
	return frame
end


amncf:RegisterEvent("PLAYER_LOGIN")
amncf:SetScript("OnEvent", function(self) 
	--[[ The left end side of the screen, chat frames etc ]]

	FixChat() -- We don't like textures!
	
    -- ChatFrame
	local cf = MakeFrame(0, 0, 0, 0.7)

	-- ChatFrameLeft
	local cfl = MakeFrame(0.243, 0.298, 0.345, 0.7)
    cfl:SetWidth(2)
	cfl:SetPoint("RIGHT", cf, "LEFT")
    cfl:SetPoint("TOP", cf)
    cfl:SetPoint("BOTTOM", cf)
	-- ChatFrameRight
	local cfr = MakeFrame(0.243, 0.298, 0.345, 0.7)
    cfr:SetWidth(2)
	cfr:SetPoint("LEFT", cf, "RIGHT")
    cfr:SetPoint("TOP", cf)
    cfr:SetPoint("BOTTOM", cf)

    -- ChatFrameTop
	local cft = MakeFrame(0.243, 0.298, 0.345, 0.7)
    cft:SetHeight(2)
	cft:SetPoint("BOTTOM", cf, "TOP")
    cft:SetPoint("LEFT", cf, -2, 0)
    cft:SetPoint("RIGHT", cf, 2, 0)

	-- ChatFrameBottom
	local cfb = MakeFrame(0.243, 0.298, 0.345, 0.7)
    cfb:SetHeight(2)
	cfb:SetPoint("TOP", cf, "BOTTOM")
    cfb:SetPoint("LEFT", cf, -2, 0)
    cfb:SetPoint("RIGHT", cf, 2, 0)
	
	-- Fixes and locks the chat frame into place.
	cf:SetPoint("TOP", ChatFrame1, 0, 2)
    cf:SetPoint("BOTTOM", ChatFrame1, 0, -2)
    cf:SetPoint("LEFT", ChatFrame1, -2, 0)
    cf:SetPoint("RIGHT", ChatFrame1, 2, 0)
end)

