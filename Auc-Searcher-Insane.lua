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
default("insane.craft.tbc", 1)
default("insane.craft.wotlk", 1)
default("insane.overhead.primal", 100000)
default("insane.overhead.eternal", 150000)
default("insane.mats.primal", 1)
default("insane.mats.eternal", 1)

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

local tbc50Herbs = private.createMap({
	22791, -- Netherbloom
	22792, -- Nightmare Vine
	22790, -- Ancient Lichen
	22793, -- Mana Thistle
0});

local tbc25Herbs = private.createMap({
	22786, -- Dreaming Glory
	22785, -- Felweed
	22789, -- Terocone
	22787, -- Ragveil
0});

local tbcInks = private.createMap({
	43108, -- Ebon Pigment
	43125, -- Darkflame Ink
0});

-- **************************************************

local wotlk50Herbs = private.createMap({
	36903, -- Adder's Tongue
	36906, -- Icethorn
	36905, -- Lichbloom
0});

local wotlk25Herbs = private.createMap({
	39969, -- Fire Seed
	37921, -- Deadnettle
	36901, -- Goldclover
	36907, -- Talandra's Rose
	36904, -- Tiger Lily
	39970, -- Fire Leaf
0});

local wotlkPigments = private.createMap({
	43109, -- Icy Pigment
0});

local wotlkInks = private.createMap({
	43127, -- Snowfall Ink
0});

-- **************************************************

function lib:MakeGuiConfig(gui)
	-- Get our tab and populate it with our controls
	local id = gui:AddTab(lib.tabname, "Searchers")

	-- Add the help
	gui:AddSearcher("Insane", "Search for items for the Insane achievement", 100)

	gui:AddControl(id, "Header", 0, "Insane search criteria")
	gui:GetLast(id).clearance = 10;

	local last = gui:GetLast(id)

	gui:AddControl(id, "MoneyFramePinned",  0, 0, "insane.deckprice", 1, 99999999, "Budget per Epic Deck / 350 rep");
	gui:GetLast(id).clearance = 20;
	gui:AddControl(id, "MoneyFramePinned",  0, 0, "insane.overhead.primal", 1, 99999999, "Budget per Primal Life");
	gui:AddControl(id, "MoneyFramePinned",  0, 0, "insane.overhead.eternal", 1, 99999999, "Budget per Eternal Life");

	gui:SetLast(id, last)

	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.rogue"  , "Craft Rogues cards (85 Inscription)"      ); -- lvl 10
	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.sword"  , "Craft Swords cards (125 Inscription)"     ); -- lvl 10
	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.mage"   , "Craft Mages cards (175 Inscription)"      ); -- lvl 20
	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.demon"  , "Craft Demons cards (225 Inscription)"     ); -- lvl 20
	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.vanilla", "Craft Vanilla WoW cards (275 Inscription)"); -- lvl 35

	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.tbc"    , "Craft TBC cards (325 Inscription)"        ); -- lvl 50
	gui:AddControl(id, "Checkbox",          0.4, 2, "insane.mats.primal" , "Include Primal Lifes");
	gui:GetLast(id).clearance = 5;

	gui:AddControl(id, "Checkbox",          0.4, 1, "insane.craft.wotlk"  , "Craft WotLK cards (400 Inscription)"      ); -- lvl 65
	gui:AddControl(id, "Checkbox",          0.4, 2, "insane.mats.eternal", "Include Eternal Lifes");
	gui:GetLast(id).clearance = 5;
end

function lib.Search(item)

	local itemid = item[Const.ITEMID];

	-- get cost
	local buyprice = item[Const.BUYOUT];
	local stacksize = item[Const.COUNT];
	local priceper = buyprice / stacksize;
	local limit = get("insane.deckprice");

	if (buyprice == 0) then	return false, "nope"; end

	local per_deck = 0; -- number of these items needed per deck
	local overhead = 0; -- overhead cost (per deck) when using this item

	-- epic cards
	if (epicCards[itemid]) then per_deck = 8; end

	-- epic decks
	if (epicDecks[itemid]) then per_deck = 1; end

	-- reg cards
	if (reg3Cards[itemid]) then per_deck = 14 * 3; end
	if (reg4Cards[itemid]) then per_deck = 14 * 4; end
	if (reg5Cards[itemid]) then per_deck = 14 * 5; end

	-- reg decks
	if (regDecks[itemid]) then per_deck = 14; end


	-- rogue crafted
	-- 14: minor decks to a full deck
	-- 3: cards in deck
	--
	-- light parchment: 0.0.15
	if (get("insane.craft.rogue")) then
		if (rogue50Herbs[itemid]) then per_deck = 14 * 3 * 10; overhead = 14 * 3 * 15; end
		if (rogue25Herbs[itemid]) then per_deck = 14 * 3 * 20; overhead = 14 * 3 * 15; end
		if (rogueInks[itemid]   ) then per_deck = 14 * 3;      overhead = 14 * 3 * 15; end
	end

	-- sword crafted
	-- 14: minor decks to a full deck
	-- 4: cards in deck
	-- 2: inks per card
	--
	-- common parchment: 0.1.25
	if (get("insane.craft.sword")) then
		if (sword50Herbs[itemid]) then per_deck = 14 * 4 * 10 * 2; overhead = 14 * 4 * 125; end
		if (sword25Herbs[itemid]) then per_deck = 14 * 4 * 20 * 2; overhead = 14 * 4 * 125; end
		if (swordInks[itemid]   ) then per_deck = 14 * 4 * 2;      overhead = 14 * 4 * 125; end
	end

	-- mage crafted
	-- 14: minor decks to a full deck
	-- 5: cards in deck
	-- 2: inks per card
	--
	-- common parchment: 0.1.25
	if (get("insane.craft.mage")) then
		if (mage50Herbs[itemid]) then per_deck = 14 * 5 * 10 * 2; overhead = 14 * 5 * 125; end
		if (mage25Herbs[itemid]) then per_deck = 14 * 5 * 20 * 2; overhead = 14 * 5 * 125; end
		if (mageInks[itemid]   ) then per_deck = 14 * 5 * 2;      overhead = 14 * 5 * 125; end
	end


	-- demon crafted
	-- 14: minor decks to a full deck
	-- 5: cards in deck
	-- 2: inks per card
	--
	-- heavy parchment: 0.12.50
	if (get("insane.craft.demon")) then
		if (demon50Herbs[itemid]) then per_deck = 14 * 5 * 10 * 2; overhead = 14 * 5 * 1250; end
		if (demon25Herbs[itemid]) then per_deck = 14 * 5 * 20 * 2; overhead = 14 * 5 * 1250; end
		if (demonInks[itemid]   ) then per_deck = 14 * 5 * 2;      overhead = 14 * 5 * 1250; end
	end

	-- vanilla crafted
	-- 8: cards in deck
	-- 5: inks per card
	--
	-- heavy parchment: 0.12.50
	if (get("insane.craft.vanilla")) then
		if (vanilla50Herbs[itemid]) then per_deck = 8 * 10 * 5; overhead = 8 * 1250; end
		if (vanilla25Herbs[itemid]) then per_deck = 8 * 20 * 5; overhead = 8 * 1250; end
		if (vanillaInks[itemid]   ) then per_deck = 8 * 5;      overhead = 8 * 1250; end
	end

	-- BC crafted
	-- 8: cards in deck
	-- 3: inks per card
	--
	-- resilient parchment: 0.50.00
	if (get("insane.craft.tbc")) then
		if (tbc50Herbs[itemid]) then per_deck = 8 * 10 * 3; overhead = 8 * (5000 + (3 * get("insane.overhead.primal"))); end
		if (tbc25Herbs[itemid]) then per_deck = 8 * 20 * 3; overhead = 8 * (5000 + (3 * get("insane.overhead.primal"))); end
		if (tbcInks[itemid]   ) then per_deck = 8 * 3;      overhead = 8 * (5000 + (3 * get("insane.overhead.primal"))); end
	end

	-- WotLK crafted
	-- 8: cards in deck
	-- 6: inks per card
	-- 2: pigment per ink
	--
	-- resilient parchment: 0.50.00
	if (get("insane.craft.wotlk")) then
		if (wotlk50Herbs[itemid] ) then per_deck = 8 * 10 * 6 * 2; overhead = 8 * (5000 + (3 * get("insane.overhead.eternal"))); end
		if (wotlk25Herbs[itemid] ) then per_deck = 8 * 20 * 6 * 2; overhead = 8 * (5000 + (3 * get("insane.overhead.eternal"))); end
		if (wotlkPigments[itemid]) then per_deck = 8 * 6 * 2;      overhead = 8 * (5000 + (3 * get("insane.overhead.eternal"))); end
		if (wotlkInks[itemid]    ) then per_deck = 8 * 6;          overhead = 8 * (5000 + (3 * get("insane.overhead.eternal"))); end
	end


	if (per_deck > 0) then
		if (priceper <= (limit - overhead) / per_deck) then
			local factor = priceper / ((limit - overhead) / per_deck);
			return string.format("%2d%%", 100 * factor);
		end
	end


	--
	-- Eternal & Primal Lifes
	--

	local life_percent = 0;
	if (get("insane.mats.primal")) then
		local p1 = get("insane.overhead.primal");
		if ((itemid == 21886) and (priceper <= p1)) then life_percent = priceper / p1; end
		if ((itemid == 22575) and (priceper*10 <= p1)) then life_percent = (priceper * 10) / p1; end
	end
	if (get("insane.mats.eternal")) then
		local p2 = get("insane.overhead.eternal");
		if ((itemid == 35625) and (priceper <= p2)) then life_percent = priceper / p2; end
		if ((itemid == 37704) and (priceper*10 <= p2)) then life_percent = (priceper * 10) / p2; end
	end
	if (life_percent > 0) then
		return string.format("%2d%%", 100 * life_percent);
	end


	--
	-- drop out
	--
	return false, "nope";
end

AucAdvanced.RegisterRevision("$URL$", "$Rev$");
