local TradeWoman = class("TradeWoman", function()
	return display.newNode()
end)

function TradeWoman:ctor()
	self:init()
end

function TradeWoman:init()
	local plist = "shop_npc.plist"
	--display.addSpriteFramesWithFile(plist)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(plist)
	self._sp = display.newSprite("#npc_1001.png")
	self:addChild(self._sp)
end

function TradeWoman:angry()
	local frames = display.newFrames("npc_%d.png", 1001, 10)
	local animation = display.newAnimation(frames, 0.1)
	self._sp:playAnimationForever(animation, 0.15)
end

function TradeWoman:welcome()
	local frames = display.newFrames("npc_%d.png", 2002, 8)
	local animation = display.newAnimation(frames, 0.1)
	self._sp:playAnimationForever(animation, 0.15)
end

function TradeWoman:happy()
	print("happy")
	local frames = display.newFrames("npc_%d.png", 3002, 8)
	local animation = display.newAnimation(frames, 0.1)
	self._sp:playAnimationForever(animation, 0.15)
end

return TradeWoman