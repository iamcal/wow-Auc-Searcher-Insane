-- Create a new instance of our lib with our parent
local lib, parent, private = AucSearchUI.NewSearcher("Insane")
if not lib then return end
local print,decode,_,_,replicate,empty,_,_,_,debugPrint,fill = AucAdvanced.GetModuleLocals()
local get,set,default,Const = AucSearchUI.GetSearchLocals()
lib.tabname = "Insane"

-- Set our defaults
default("insane.deckprice", 2500000)
default("insane.craft.rogue", 1)
default("insane.craft.sword", 1)
default("insane.craft.mage", 1)
default("insane.craft.demon", 1)
default("insane.craft.vanilla", 1)

function private.createMap(x)

	local out = {};

	for i,v in ipairs(x) do
		if (v) then
			out[v] = true;
		end
	end

	return out;
end

local epicCards = private.createMap({
	19227, 19230, 19231, 19232, 19233, 19234, 19235, 19236, -- beasts
	19276, 19278, 19279, 19280, 19281, 19282, 19283, 19284, -- portals
	19258, 19259, 19260, 19261, 19262, 19263, 19264, 19265, -- warlords
	19268, 19269, 19270, 19271, 19272, 19273, 19274, 19275, -- elementals

	31901, 31909, 31908, 31904, 31903, 31906, 31905, 31902, -- furies
	31892, 31900, 31899, 31895, 31894, 31898, 31896, 31893, -- storms
	31882, 31889, 31888, 31885, 31884, 31887, 31886, 31883, -- blessings
	31910, 31918, 31917, 31913, 31912, 31916, 31915, 31911, -- lunacy

	44277, 44278, 44279, 44280, 44281, 44282, 44284, 44285, -- chaos
	44268, 44269, 44270, 44271, 44272, 44273, 44274, 44275, -- nobles
	44260, 44261, 44262, 44263, 44264, 44265, 44266, 44267, -- prisms
	44286, 44287, 44288, 44289, 44290, 44291, 44292, 44293, -- undeath

0});

local epicDecks = private.createMap({
	19228, -- beasts
	19277, -- portals
	19257, -- warlords
	19267, -- elementals

	31907, -- furies
	31891, -- storms
	31890, -- blessings
	31914, -- lunacy

	44276, -- chaos
	44326, -- nobles
	44259, -- prisms
	44294, -- undeath

0});

local reg3Cards = private.createMap({
	37140, 37143, 37156, -- rogues
0});

local reg4Cards = private.createMap({
	37145, 37147, 37159, 37160, -- swords
0});

local reg5Cards = private.createMap({
	44165, 44144, 44145, 44146, 44147, -- mages
	44143, 44154, 44155, 44156, 44157, -- demons
0});

local regDecks = private.createMap({
	37163, 43039, -- rogues
	37164, 42922, -- swords
	44148, 44184, -- mages
	44158, 44185, -- demons
0});

-- **************************************************

local rogue50Herbs = private.createMap({
	3820, -- Stranglekelp
	2453, -- Bruiseweed
0});

local rogue25Herbs = private.createMap({
	2450, -- Briarthorn
	785,  -- Mageroyal
	2452, -- Swiftthistle
0});

local rogueInks = private.createMap({
	43103, -- Verdant Pigment
	43115, -- Hunter's Ink
0});

-- **************************************************

local sword50Herbs = private.createMap({
	3356, -- Kingsblood
	3357, -- Liferoot
0});

local sword25Herbs = private.createMap({
	3369, -- Grave Moss
	3355, -- Wild Steelbloom
0});

local swordInks = private.createMap({
	43104, -- Burnt Pigment
	43117, -- Dawnstar Ink
0});

-- **************************************************

local mage50Herbs = private.createMap({
	3358, -- Khadgar's Whisker
	3819, -- Wintersbite
0});

local mage25Herbs = private.createMap({
	3818, -- Fadeleaf
	3821, -- Goldthorn
0});

local mageInks = private.createMap({
	43105, -- Indigo Pigment
	43119, -- Royal Ink
0});

-- **************************************************

local demon50Herbs = private.createMap({
	8845, -- Ghost Mushroom
	8839, -- Blindweed
	8846, -- Gromsblood
0});

local demon25Herbs = private.createMap({
	8836, -- Arthas' Tears
	4625, -- Firebloom
	8831, -- Purple Lotus
	8838, -- Sungrass
0});

local demonInks = private.createMap({
	43106, -- Ruby Pigment
	43121, -- Fiery Ink
0});

-- **************************************************

local vanilla50Herbs = private.createMap({
	13465, -- Mountain Silversage
	13466, -- Plaguebloom
	13467, -- Icecap
0});

local vanilla25Herbs = private.createMap({
	13463, -- Dreamfoil
	13464, -- Golden Sansam
0});

local vanillaInks = private.createMap({
	43107, -- Sapphire Pigment
	43123, -- Ink of the Sky
0});

-- **************************************************




function lib:MakeGuiConfig(gui)
	-- Get our tab and populate it with our controls
	local id = gui:AddTab(lib.tabname, "Searchers")

	-- Add the help
	gui:AddSearcher("Insane", "Search for items for the Insane achievement", 100)

	gui:AddControl(id, "Header", 0, "Insane search criteria")

	local last = gui:GetLast(id)

	gui:AddControl(id, "MoneyFramePinned",  0, 0, "insane.deckprice", 1, 99999999, "Maximum Price for Epic Deck");

	gui:AddControl(id, "Checkbox",          0, 1, "insane.craft.rogue"  , "Craft Rogues cards (85 Inscription)"      ); -- lvl 10
	gui:AddControl(id, "Checkbox",          0, 1, "insane.craft.sword"  , "Craft Swords cards (125 Inscription)"     ); -- lvl 10
	gui:AddControl(id, "Checkbox",          0, 1, "insane.craft.mage"   , "Craft Mages cards (175 Inscription)"      ); -- lvl 20
	gui:AddControl(id, "Checkbox",          0, 1, "insane.craft.demon"  , "Craft Demons cards (225 Inscription)"     ); -- lvl 20
	gui:AddControl(id, "Checkbox",          0, 1, "insane.craft.vanilla", "Craft Vanilla WoW cards (275 Inscription)"); -- lvl 35
	-- BC: 325 (lvl 50)
	-- WotlK: 400 (lvl 65)
end

function lib.Search(item)

	-- get cost
	local buyprice = item[Const.BUYOUT];
	local stacksize = item[Const.COUNT];
	local priceper = buyprice / stacksize;

	local limit = get("insane.deckprice");

	if (buyprice == 0) then

		return false, "nope";
	end


	-- epic cards
	if (epicCards[item[Const.ITEMID]] and (priceper <= limit / 8)) then return "buy"; end

	-- epic decks
	if (epicDecks[item[Const.ITEMID]] and (priceper <= limit)) then return "buy"; end

	-- reg cards
	if (reg3Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 3))) then return "buy"; end
	if (reg4Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 4))) then return "buy"; end
	if (reg5Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 5))) then return "buy"; end

	-- reg decks
	if (regDecks[item[Const.ITEMID]] and (priceper <= limit / 14)) then return "buy"; end


	-- rogue crafted
	-- 14: minor decks to a full deck
	-- 3: cards in deck
	if (get("insane.craft.rogue")) then
		if (rogue50Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 3 * 10))) then return "buy"; end
		if (rogue25Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 3 * 20))) then return "buy"; end
		if (rogueInks[item[Const.ITEMID]] and (priceper <= limit / (14 * 3))) then return "buy"; end
	end

	-- sword crafted
	-- 14: minor decks to a full deck
	-- 4: cards in deck
	-- 2: inks per card
	if (get("insane.craft.sword")) then
		if (sword50Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 4 * 10 * 2))) then return "buy"; end
		if (sword25Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 4 * 20 * 2))) then return "buy"; end
		if (swordInks[item[Const.ITEMID]] and (priceper <= limit / (14 * 4 * 2))) then return "buy"; end
	end

	-- mage crafted
	-- 14: minor decks to a full deck
	-- 5: cards in deck
	-- 2: inks per card
	if (get("insane.craft.mage")) then
		if (mage50Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 10 * 2))) then return "buy"; end
		if (mage25Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 20 * 2))) then return "buy"; end
		if (mageInks[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 2))) then return "buy"; end
	end


	-- demone crafted
	-- 14: minor decks to a full deck
	-- 5: cards in deck
	-- 2: inks per card
	if (get("insane.craft.demon")) then
		if (demon50Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 10 * 2))) then return "buy"; end
		if (demon25Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 20 * 2))) then return "buy"; end
		if (demonInks[item[Const.ITEMID]] and (priceper <= limit / (14 * 5 * 2))) then return "buy"; end
	end

	-- vanilla crafted
	-- 8: cards in deck
	-- 5: inks per card
	if (get("insane.craft.vanilla")) then
		if (vanilla50Herbs[item[Const.ITEMID]] and (priceper <= limit / (8 * 10 * 5))) then return "buy"; end
		if (vanilla25Herbs[item[Const.ITEMID]] and (priceper <= limit / (8 * 20 * 5))) then return "buy"; end
		if (vanillaInks[item[Const.ITEMID]] and (priceper <= limit / (8 * 5))) then return "buy"; end
	end

	return false, "nope";
end

AucAdvanced.RegisterRevision("$URL$", "$Rev$");
