local ShopScene = class("ShopScene", function()
	return display.newScene("ShopScene")
	end)
function ShopScene:ctor()

	self._tradewoman = TradeWoman.new()
	self._tradewoman:setPosition(ccp(70, 220))
	self:addChild(self._tradewoman,3)
	self._tradewoman:happy()

	--背景
	local bg = display.newSprite("shop/shopBack.png")
	bg:setPosition(ccp(display.cx, display.cy))
	self:addChild(bg)

	self._index = 1
	self._goods_tab = {
	{types = 1, texture = CCTextureCache:sharedTextureCache():addImage("qianglishui.png")},
	{types = 2, texture = CCTextureCache:sharedTextureCache():addImage("article_2001.png")},
	}

	local goods = display.newSprite(self._goods_tab[self._index].texture)
	goods:setPosition(ccp(120, 100))
	self:addChild(goods)

	--下一关按钮
	local nextbtn = cc.ui.UIPushButton.new({normal = "button/shopArrow.png"}, {scale9 = true})
	nextbtn:setPosition(ccp(display.width-50, 50))
	self:addChild(nextbtn)
	nextbtn:onButtonClicked(function (event)
		MyData.setLevel(MyData.getLevel()+1)
		local gameScene = GameScene:new()
		CCDirector:sharedDirector():replaceScene(gameScene)
	end)

	--左按钮
	local leftbtn = cc.ui.UIPushButton.new({normal = "button/buyleftbtn.png"}, {scale9 = true})
	leftbtn:setPosition(ccp(70, 40))
	self:addChild(leftbtn)
	leftbtn:onButtonClicked(function (event)
		self._index = self._index+1
		if self._index > #self._goods_tab then
			self._index = 1
		end
		goods:setTexture(self._goods_tab[self._index].texture)
	end)

	--购买按钮
	local buybtn = cc.ui.UIPushButton.new({normal = "button/buypowerbtn.png"}, {scale9 = true})
    buybtn:setPosition(ccp(120, 40))
    self:addChild(buybtn)
    buybtn:onButtonClicked(function(event)
    	
    end)

	--右按钮
	local rightbtn = cc.ui.UIPushButton.new({normal = "button/buyrightbtn.png"}, {scale9 = true})
	rightbtn:setPosition(ccp(170, 40))
	self:addChild(rightbtn)
	rightbtn:onButtonClicked(function (event)
		self._index = self._index-1
		if self._index < 1 then 
			self._index = #self._goods_tab
		end
		goods:setTexture(self._goods_tab[self._index].texture)
	end)


end

return ShopScene