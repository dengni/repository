local StartNode = class("StartNode", function()
	return display.newNode()
end)

function StartNode:ctor()
	print("StartNode")
	--背景
	local bg = display.newSprite("MainMenu.png")
	bg:setPosition(ccp(display.cx, display.cy))
	self:addChild(bg)

	--开始按钮
	local startbtn = cc.ui.UIPushButton.new({normal = "button/PlayMenu.png"}, {scale9 = true})
	startbtn:setScale(1.3)
	startbtn:setPosition(ccp(display.cx-125, display.cy+80))
	self:addChild(startbtn)

	startbtn:onButtonClicked(function(event)
		print("start")
		local gameScene = ShopScene.new()
		CCDirector:sharedDirector():replaceScene(gameScene)
		end)

	--默认播放背景音乐
	--audio.playMusic("backMusic.mp3", true)

	--音乐按钮
	local musicbtn = cc.ui.UICheckBoxButton.new({on = "button/soundController.png", off = "button/soundController2.png"})
	musicbtn:setPosition(ccp(50, 50))
	musicbtn:onButtonStateChanged(function(event)
		if event.state == "on" then
			print("on")
			audio.playMusic("backMusic.mp3", true)
		elseif event.state == "off" then
			print("off")
			audio.pauseMusic()
		end
	end)

	--musicbtn:setButtonSelected(true)--on
	self:addChild(musicbtn)

end

return StartNode