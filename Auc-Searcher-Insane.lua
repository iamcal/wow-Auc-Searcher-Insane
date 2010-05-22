-- Create a new instance of our lib with our parent
local lib, parent, private = AucSearchUI.NewSearcher("Insane")
if not lib then return end
local print,decode,_,_,replicate,empty,_,_,_,debugPrint,fill = AucAdvanced.GetModuleLocals()
local get,set,default,Const = AucSearchUI.GetSearchLocals()
lib.tabname = "Insane"

-- Set our defaults
default("insane.deckprice", 2500000)

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
	31882, 31889, 31888, 31885, 31884, 31867, 31886, 31883, -- blessings
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


function lib:MakeGuiConfig(gui)
	-- Get our tab and populate it with our controls
	local id = gui:AddTab(lib.tabname, "Searchers")

	-- Add the help
	gui:AddSearcher("Insane", "Search for items for the Insane achievement", 100)

	gui:AddControl(id, "Header", 0, "Insane search criteria")

	local last = gui:GetLast(id)

	gui:AddControl(id, "MoneyFramePinned",  0, 0, "insane.deckprice", 1, 99999999, "Maximum Price for Epic Deck")
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
	if (epicCards[item[Const.ITEMID]] and (priceper <= limit / 8)) then
		return "buy";
	end

	-- epic decks
	if (epicDecks[item[Const.ITEMID]] and (priceper <= limit)) then
		return "buy";
	end

	-- reg cards
	if (reg3Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 3))) then return "buy"; end
	if (reg4Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 4))) then return "buy"; end
	if (reg5Cards[item[Const.ITEMID]] and (priceper <= limit / (14 * 5))) then return "buy"; end

	-- reg decks
	if (regDecks[item[Const.ITEMID]] and (priceper <= limit / 14)) then return "buy"; end

	-- herbs (10/20 herbs => 1 rogues card)
	if (rogue50Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 3 * 10))) then return "buy"; end
	if (rogue25Herbs[item[Const.ITEMID]] and (priceper <= limit / (14 * 3 * 20))) then return "buy"; end
	if (rogueInks[item[Const.ITEMID]] and (priceper <= limit / (14 * 3))) then return "buy"; end

	return false, "nope";
end

AucAdvanced.RegisterRevision("$URL$", "$Rev$");
