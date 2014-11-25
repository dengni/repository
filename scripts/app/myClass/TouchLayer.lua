local TouchLayer = class("TouchLayer", function()
	return display.newNode()
end)

function TouchLayer:ctor(params)
	self._func = params.func
	self:init()
end

function TouchLayer:init()
	local colorLayer = display.newColorLayer(ccc4(100, 100, 100, 0))
	self:addChild(colorLayer)

	colorLayer:setTouchSwallowEnabled(true)--设置是否吞噬触摸
	colorLayer:setTouchEnabled(true)
	colorLayer:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)--设置触摸类型
	colorLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		if event.name == "began" then
			print("TouchBegan")
			return true
		elseif event.name == "moved" then
			print("TouchMoved")
		elseif event.name == "ended" then
			print("TouchEnded")
			if self._func then
				(self._func)()
			end
			--return true
		end
		--return false
	end)
end

return TouchLayer