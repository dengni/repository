module("LevelConfig", package.seeall)

function getItemData(config)--
	local itemData = ITEM[tonumber(config)]
	if not itemData then 
		itemData = ITEM[1]
	end
	return itemData
end

function getBG_ITEM(config)--
	local itemData = BG_ITEM[tonumber(config)]
	if not itemData then 
		itemData = BG_ITEM[1]
	end
	return itemData
end

function getLIMIT_ITEM(config)
	local itemData = LIMIT_ITEM[tonumber(config)]
	if not itemData then
		itemData = 10000000000
	end
	return itemData
end

--通关条件
LIMIT_ITEM = {500, 1000, 1500, 2000, 3000, 5000}

--关卡背景
BG_ITEM = {
	"gameBg/mineBG1.png",
	"gameBg/mineBG2.png",
	"gameBg/mineBG3.png",
	"gameBg/mineBG4.png",
	"gameBg/mineBG5.png",
	"gameBg/mineBG6.png"
}

--矿物图片
local pic_path_tab = {
	"goods/gold_small.png",
	"goods/gold_middle.png",
	"goods/gold_large.png",
	"goods/stone_small.png",
	"goods/stone_middle.png",
	"goods/stone_large.png",
	"goods/secret_small.png",
	"goods/secret_middle.png",
	"goods/secret_large.png",
}

--矿物分布及类型
ITEM = {}
ITEM[1]={} 
ITEM[1][1]={pic = pic_path_tab[1], pos = ccp(100, 200), weight = 10, price = 50}
ITEM[1][2]={pic = pic_path_tab[1], pos = ccp(200, 200), weight = 10, price = 50}
ITEM[1][3]={pic = pic_path_tab[1], pos = ccp(300, 200), weight = 10, price = 50}
ITEM[1][4]={pic = pic_path_tab[1], pos = ccp(400, 200), weight = 10, price = 50}
ITEM[1][5]={pic = pic_path_tab[1], pos = ccp(500, 200), weight = 10, price = 50}
ITEM[1][6]={pic = pic_path_tab[2], pos = ccp(100, 100), weight = 50, price = 200}
ITEM[1][7]={pic = pic_path_tab[2], pos = ccp(200, 100), weight = 50, price = 200}
ITEM[1][8]={pic = pic_path_tab[2], pos = ccp(300, 100), weight = 50, price = 200}
ITEM[1][9]={pic = pic_path_tab[2], pos = ccp(400, 100), weight = 50, price = 200}
ITEM[1][10]={pic = pic_path_tab[2], pos = ccp(500, 100), weight = 50, price = 200}


ITEM[2]={} 
ITEM[2][1]={pic = pic_path_tab[2], pos = ccp(100, 200), weight = 50, price = 200}
ITEM[2][2]={pic = pic_path_tab[2], pos = ccp(200, 200), weight = 50, price = 200}
ITEM[2][3]={pic = pic_path_tab[2], pos = ccp(300, 200), weight = 50, price = 200}
ITEM[2][4]={pic = pic_path_tab[2], pos = ccp(400, 200), weight = 50, price = 200}
ITEM[2][5]={pic = pic_path_tab[2], pos = ccp(500, 200), weight = 50, price = 200}
ITEM[2][6]={pic = pic_path_tab[3], pos = ccp(100, 100), weight = 100, price = 500}
ITEM[2][7]={pic = pic_path_tab[3], pos = ccp(200, 100), weight = 100, price = 500}
ITEM[2][8]={pic = pic_path_tab[3], pos = ccp(300, 100), weight = 100, price = 500}
ITEM[2][9]={pic = pic_path_tab[3], pos = ccp(400, 100), weight = 100, price = 500}
ITEM[2][10]={pic = pic_path_tab[3], pos = ccp(500, 100), weight = 100, price = 500}

ITEM[3]={} 
ITEM[3][1]={pic = pic_path_tab[1], pos = ccp(100, 200), weight = 10, price = 50}
ITEM[3][2]={pic = pic_path_tab[1], pos = ccp(200, 200), weight = 10, price = 50}
ITEM[3][3]={pic = pic_path_tab[1], pos = ccp(300, 200), weight = 10, price = 50}
ITEM[3][4]={pic = pic_path_tab[1], pos = ccp(400, 200), weight = 10, price = 50}
ITEM[3][5]={pic = pic_path_tab[1], pos = ccp(500, 200), weight = 10, price = 50}
ITEM[3][6]={pic = pic_path_tab[3], pos = ccp(100, 100), weight = 100, price = 500}
ITEM[3][7]={pic = pic_path_tab[3], pos = ccp(200, 100), weight = 100, price = 500}
ITEM[3][8]={pic = pic_path_tab[3], pos = ccp(300, 100), weight = 100, price = 500}
ITEM[3][9]={pic = pic_path_tab[3], pos = ccp(400, 100), weight = 100, price = 500}
ITEM[3][10]={pic = pic_path_tab[3], pos = ccp(500, 100), weight = 100, price = 500}


ITEM[4]={} 
ITEM[4][1]={pic = pic_path_tab[4], pos = ccp(100, 200), weight = 10, price = 10}
ITEM[4][2]={pic = pic_path_tab[4], pos = ccp(200, 200), weight = 10, price = 10}
ITEM[4][3]={pic = pic_path_tab[4], pos = ccp(300, 200), weight = 10, price = 10}
ITEM[4][4]={pic = pic_path_tab[4], pos = ccp(400, 200), weight = 10, price = 10}
ITEM[4][5]={pic = pic_path_tab[4], pos = ccp(500, 200), weight = 10, price = 10}
ITEM[4][6]={pic = pic_path_tab[3], pos = ccp(100, 100), weight = 100, price = 500}
ITEM[4][7]={pic = pic_path_tab[3], pos = ccp(200, 100), weight = 100, price = 500}
ITEM[4][8]={pic = pic_path_tab[3], pos = ccp(300, 100), weight = 100, price = 500}
ITEM[4][9]={pic = pic_path_tab[3], pos = ccp(400, 100), weight = 100, price = 500}
ITEM[4][10]={pic = pic_path_tab[3], pos = ccp(500, 100), weight = 100, price = 500}

