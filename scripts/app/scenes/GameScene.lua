local GameScene = class("GameScene", function()
	return display.newScene()
end)

require("app.LevelConfig")
require("app.MyData")

function GameScene:ctor()
	print("GameScene")

	--关卡Lab
	local levelData = LevelConfig.getItemData(MyData.getLevel())
	print("level="..MyData.getLevel())
	self._guanLab = ui.newTTFLabel({text = "第"..MyData.getLevel() .."关", size = 20, color = ccc3(200, 0, 200)})
	self._guanLab:setPosition(ccp(display.cx, display.height-20))
	self:addChild(self._guanLab,1)

	--背景
	local bg = display.newSprite(LevelConfig.getBG_ITEM(MyData.getLevel()))
	bg:setPosition(ccp(display.cx, display.height-50))
	self:addChild(bg)

	self._times = 60

	--时间lab
	self._timeLab = ui.newTTFLabel({text = ""..self._times, size = 30, color = ccc3(200, 0, 200)})
	self._timeLab:setPosition(ccp(display.width-20, display.height-20))
	self:addChild(self._timeLab)

	--金钱lab
	self._goldenLab = ui.newTTFLabel({text = ""..MyData.getGolden(), size = 30, color = ccc3(200, 0, 200)})
	self._goldenLab:setPosition(ccp(40, display.height-20))
	self:addChild(self._goldenLab)

	--创建矿石
	self.goods_tab = {}
	for k,v in pairs(levelData) do
		local goods = Goods.new({path = v.pic, weight = v.weight, price = v.price})
		goods:setPosition(v.pos)
		self:addChild(goods,1)
		table.insert(self.goods_tab, goods)
	end

	--创建矿工
	local hero = Hero.new()
	hero:setPosition(ccp(display.cx, display.cy+100))
	self:addChild(hero)

	--创建钩子
	self._hook = Hook.new({
		funcL = function ()--设置发射钩子的回调
			self:startTimerTask()
			hero:startAction()
		end,

		funcBE = function ( goods )--设置钩子回收完成的回调
			self:stopTimerTask()
			hero:endAction()
			if goods then 
				MyData.setGolden(MyData.getGolden()+goods._price)
				self._goldenLab:setString(MyData.getGolden())
			end
		end,

		funcBB = function ( goods )--设置钩子刚开始回收的回调
			--self:stopTimerTask()
			local index = 0 
			for k,v in pairs(self.goods_tab) do
				if v == goods then 
					index = k 
					break
				end
			end
			if index ~= 0 then 
				local time = 1
				if goods then 
					time = goods._weight/10
				end
				goods:runAction(getSequence({CCMoveTo:create(time, ccp(display.cx, display.cy+90)), CCCallFuncN:create(function(...) 
					goods:removeFromParentAndCleanup(true)
				end)}))

				table.remove(self.goods_tab, index)
			end
		end,})

	self._hook:setPosition(ccp(display.cx, display.cy+90))
	self:addChild(self._hook)

	self._hook:startRotation()

	--创建用于接收事件的层
	local touchLayer = TouchLayer.new({func = function(...)
		if not self._hook._launchFlag then
			self._hook:hookLanch()
		end
	end})
	self:addChild(touchLayer)

	--开始计时器，倒计时
	local sharedSchedule = CCDirector:sharedDirector():getScheduler()
	self._schedule1 = sharedSchedule:scheduleScriptFunc(function ( ... )
			self:timeDeal1()
		end, 1, false)
end

--开始碰撞检测
function GameScene:startTimerTask( ... )
	print("startTimerTask")
	local sharedSchedule = CCDirector:sharedDirector():getScheduler()
	self._schedule = sharedSchedule:scheduleScriptFunc(function ( ... )
		self:timeDeal()
	end, 0.01, false)
end

--停止碰撞检测
function GameScene:stopTimerTask()
	print("stopTimerTask")
	self:removeChild(self._shengzi,true)
	local sharedSchedule = CCDirector:sharedDirector():getScheduler()
	if self._schedule then
		sharedSchedule:unscheduleScriptEntry(self._schedule)
		schedule = nil
	end
end

--碰撞检测
function GameScene:timeDeal()
	--print("timeDeal")
	local hposx = self._hook:getPositionX()
	local hposy = self._hook:getPositionY()
	--print(hposx,hposy)
	
	if self._shengzi then 
		self:removeChild(self._shengzi, true)
	end

	local texture = CCTextureCache:sharedTextureCache():addImage("shengzi.jpg")
	local distance = math.sqrt((hposx-display.cx)^2+(hposy-display.cy-90)^2)
	self._shengzi = CCSprite:createWithTexture(texture, cc.RectMake(0,0,2,distance-20))
	self._shengzi:setAnchorPoint(ccp(0.5, 1))
	self._shengzi:setPosition(ccp(display.cx, display.cy+90))
	self._shengzi:setRotation(self._hook:getRotation())
	self:addChild(self._shengzi)

	for k,v in pairs(self.goods_tab) do
		local posx = v:getPositionX()
		local posy = v:getPositionY()

		if math.abs(hposx - posx) < v:getContentSize().width*0.3 and math.abs(hposy - posy) < v:getContentSize().height*0.3 then
			--self:stopTimerTask()
			self._hook:setGoods(v)
			self._hook:hookBack()
		end
	end
end

--时间调度
function  GameScene:timeDeal1( ... )
	self._times = self._times -1
	self._timeLab:setString(self._times.."")

	if self._times <= 0 then 
		self._times = 0
		local sharedSchedule = CCDirector:sharedDirector():getScheduler()
		if self._schedule1 then 
			sharedSchedule:unscheduleScriptEntry(self._schedule1)
			self._schedule1 = nil
		end
		self:stopTimerTask()
		local scene = nil
		if MyData.getGolden() >= LevelConfig.getLIMIT_ITEM(MyData.getLevel()) then 
			scene = ShopScene.new()
		else 
			MyData.setGolden(0)
			MyData.setLevel(1)
			scene = MainScene.new()
		end
		CCDirector:sharedDirector():replaceScene(scene)
	end
end

function GameScene:onEnter()
end

function GameScene:onExit()
end

return GameScene