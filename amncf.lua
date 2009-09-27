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
-- name - Name of the frame
-- width - The width of the frame
-- height - The height of the frame
-- r - Amount of red in the colour of the frame
-- g - Amount of green in the colour of the frame
-- b - Amount of blue in the colour of the frame
-- a - Alpha (transparency) of the frame
--]]
local MakeFrame = function(name, width, height, r, g, b, a) 
	local frame = CreateFrame("Frame", name, UIParent)


	frame:SetBackdrop({
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = true, tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
		insets = {left = 0, right = 0, top = 0, bottom = 0},
	})
	frame:SetHeight(height)
	frame:SetWidth(width)
	frame:SetBackdropColor(r, g, b, a)
	frame:SetBackdropBorderColor(0, 0, 0, 0)
	frame:SetFrameStrata"BACKGROUND"
	return frame
end


amncf:RegisterEvent("PLAYER_LOGIN")
amncf:SetScript("OnEvent", function(self) 
	--[[ The left end side of the screen, chat frames etc ]]

	-- ChatFrame
	local cf = MakeFrame("CF", 550, 216, 0, 0, 0, 0.7)
	cf:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 19, 25)
	FixChat() -- We don't like textures!

--[[	-- ChatFrameBorderLeft
	local cfbl = MakeFrame("CFBL", 1, cf:GetHeight()+2, 0, 0, 0, 1)
	cfbl:SetPoint("RIGHT", cf, "LEFT")

	-- ChatFrameBorderRight
	local cfbr = MakeFrame("CFBR", 1, cf:GetHeight()+2, 0, 0, 0, 1)
	cfbr:SetPoint("LEFT", cf, "RIGHT")

	-- ChatFrameBorderTop
	local cfbt = MakeFrame("CFBT", cf:GetWidth(), 1, 0, 0, 0, 1)
	cfbt:SetPoint("BOTTOM", cf, "TOP")

	-- ChatFrameBorderBottom
	local cfbb = MakeFrame("CFBB", cf:GetWidth(), 1, 0, 0, 0, 1)
	cfbb:SetPoint("TOP", cf, "BOTTOM") ]] 
	-- ChatFrameUpperLeft
	local cful = MakeFrame("CFUL", 2, cf:GetHeight(), 0.243, 0.298, 0.345, 0.7)
	cful:SetPoint("RIGHT", cf, "LEFT")

	-- ChatFrameUpperRight
	local cfur = MakeFrame("CFUR", 2, cf:GetHeight(), 0.243, 0.298, 0.345, 0.7)
	cfur:SetPoint("LEFT", cf, "RIGHT")

	-- ChatFrameUpperTop
	local cfut = MakeFrame("CFUT", cf:GetWidth()+4, 2, 0.243, 0.298, 0.345, 0.7)
	cfut:SetPoint("BOTTOM", cf, "TOP")

	-- ChatFrameUpperBottom
	local cfub = MakeFrame("CFUB", cf:GetWidth()+4, 2, 0.243, 0.298, 0.345, 0.7)
	cfub:SetPoint("TOP", cf, "BOTTOM")
	
--[[	-- ChatFrameUpperBorderLeft
	local cfubl = MakeFrame("CFUBL", 1, cful:GetHeight()+6, 0, 0, 0, 1)
	cfubl:SetPoint("RIGHT", cful, "LEFT")

	-- ChatFrameUpperBorderRight
	local cfubr = MakeFrame("CUFBR", 1, cfur:GetHeight()+6, 0, 0, 0, 1)
	cfubr:SetPoint("LEFT", cfur, "RIGHT")

	-- ChatFrameUpperBorderTop
	local cfubt = MakeFrame("CFUBT", cfut:GetWidth(), 1, 0, 0, 0, 1)
	cfubt:SetPoint("BOTTOM", cfut, "TOP")

	-- ChatFrameUpperBorderBottom
	local cfubb = MakeFrame("CFUBB", cfub:GetWidth(), 1, 0, 0, 0, 1)
	cfubb:SetPoint("TOP", cfub, "BOTTOM") ]]--

	-- Fixes and locks the chat frame into place.
	ChatFrame1:SetWidth(cf:GetWidth()-10)
	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOM", cf, 0, 2)
	ChatFrame1:SetPoint("TOP", cf, 0, 0)
	ChatFrame1:SetPoint("LEFT", cf, 2, 0)
	FCF_SetLocked(ChatFrame1, 1)
end)

