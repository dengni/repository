--矿工类
local Hero = class("Hero", function()
	return  display.newNode()
end)

function Hero:ctor()
	self:init()
end

function Hero:init()
	local png = "hero/minerAction.png"
	local plist = "hero/minerAction.plist"

	display.addSpriteFramesWithFile(plist, png)--将指定的Sprite Sheets材质文件及其数据文件载入图像帧缓存
	self._sp = display.newSprite("#miner_0701.png")
	self:addChild(self._sp)
	--self:setContentSize(self._sp:getContentSize())
end

--开始动画
function Hero:startAction()
	local frames = display.newFrames("miner_0%d.png", 701, 10)--以特定模式创建一个包含多个图像帧对象的数组。
	local animate = display.newAnimation(frames, 0.08)
	self._sp:playAnimationForever(animate, 0.15)
end

--结束动画
function Hero:endAction()
	self._sp:stopAllActions()
end

return Hero
