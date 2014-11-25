local Hook = class("Hook", function()
	return display.newNode()
end)

function Hook:ctor(params)
	self.funcL = params.funcL--发射钩子的回调
	self.funcBB = params.funcBB--钩子回收时回调
	self.funcBE = params.funcBE--钩子回收结束时回调
	self:init()
end

function Hook:init()
	self._hook = display.newSprite("hook.png")
	self._hook:setAnchorPoint(ccp(0.5, 1))
	self:setRotation(-90)
	self:addChild(self._hook, 0)
end

--钩子旋转
function Hook:startRotation()
	self:setRotation(-90)
	self._launchFlag = false
	local seq = getSequence({CCRotateBy:create(3, 180), CCRotateBy:create(3, -180)})
	local rep = CCRepeatForever:create(seq)
	self:runAction(rep)
end

--钩子发射
function Hook:hookLanch()
	self:stopAllActions()
	self._launchFlag = true
	local angle = self:getRotation()
	local move = CCMoveBy:create(2, ccp(470*math.sin(math.rad(-angle)), -470*math.cos(math.rad(-angle))))
	self:runAction(move)
	ac_dly_fun(self,1,function()
		self:hookBack()
	end)

	if self.funcL then 
		(self.funcL)()
	end

	self._hook:setAnchorPoint(ccp(0.5,0))
end

--钩子返回
function Hook:hookBack()
	self:stopAllActions()
	
	local time = 1
	if self._goods then
		time = self._goods._weight/10
	end
	local move = CCMoveTo:create(time, ccp(display.cx, display.cy+90))
	local seq = getSequence({move, CCCallFunc:create(function()
		self._hook:setAnchorPoint(ccp(0.5, 1))
		self:startRotation()
		if self.funcBE then
			(self.funcBE)(self._goods)
		end
		self._goods = nil
	end)})

	self:runAction(seq)

	if self.funcBB then
		(self.funcBB)(self._goods)
	end

end

--设置当前捕获到的货物
function Hook:setGoods(goods)
	self._goods = goods
end

--动作队列
function getSequence(tb)
	local array = CCArray:create()
	for k,v in pairs(tb) do
		array:addObject(v)
	end
	local ac_seq = CCSequence:create(array)
	return ac_seq
end

--延时
function ac_dly_fun( ob, tk, fuc )
	if not ob then
	end
	local ac_dly = CCDelayTime:create(tk)
	local ac_fnc = CCCallFuncN:create(fuc)
	local ac_seq = CCSequence:createWithTwoActions(ac_dly, ac_fnc)

	ob:runAction(ac_seq)
end

return Hook