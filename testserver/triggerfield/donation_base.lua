require("base.common")
require("base.money")

module("triggerfield.donation_base", package.seeall)

function donate(Item,User,FactionName,LeaderName,Treasury)

    -- This function donates 10% of the worth of an item to the faction
    
	ItemStats=world:getItemStats(Item); -- get the item stats
	
	if ItemStats.Worth == 0 then -- worthless item -> inform
	
        base.common.InformNLS(User,"[Spende] Dieser Gegenstand ist wertlos.","[Donation] This item is worthless."); -- Feedback!
		donated=false; -- no donation
		
	else -- item with worth
	
		if Item.id == 61 or Item.id == 3076 or Item.id == 3077 then -- coins
		
		    payToFaction = Item.number*ItemStats.Worth; -- 100% of the worth are added for coins
			
		else
		
		    payToFaction = Item.number*ItemStats.Worth*0.1; -- 10% of the worth are added for items
		
		end
		
		foundTreasure, oldTreasure = ScriptVars:find(Treasury); -- Reading the old treasure amount
				
	    if not foundTreasure then -- security check
		    oldTreasure = "0";
		end
		
		oldTreasure=tonumber(oldTreasure); --Converting the string to a number
		newTreasure=tostring(oldTreasure+payToFaction); --scriptVars are strings :-(
		ScriptVars:set(Treasury, newTreasure); -- add acquired coins to the treasure	
        ScriptVars:save(); --Saving the scriptVars
		
		gstring,estring=base.money.MoneyToString(payToFaction); --converting money to a string
			
        base.common.InformNLS(User,"[Spende] Du spendest Gegenstšnde im Gegenwert von"..gstring.." in die Schatzkammer von "..FactionName..". "..LeaderName.." wird zufrieden sein.","[Donation] You donate items valued at"..estring.." to the treasury of "..FactionName..". "..LeaderName.." will be pleased."); -- Feedback!		
		world:gfx(46,Item.pos); -- nice GFX
		world:erase(Item,Item.number); -- delete the item
	    donated=true; -- donation worked
	
	end    
	
	return donated; -- returning whether the donation worked or not
	
end