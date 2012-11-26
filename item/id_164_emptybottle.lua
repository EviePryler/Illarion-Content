-- Schaf melken
-- Nop
-- Merung 2011: fill stock or potion into bottle
-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- alchemy
	-- infront of a cauldron?
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
   if cauldron then
   
        if ( ltstate == Action.abort ) then
	        base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
			
		if (cauldron:getData("filledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
	        base.common.InformNLS( User,
					"Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen w�rde. Ein Eimer w�re hilfreicher.",
					"There is too much water in the cauldron to bottle it. Better use a bucket.")
			return;
	    
		-- no stock, no potion, not essence brew -> nothing we could fil into the bottle
	    elseif cauldron:getData("filledWith") == "" then
	        base.common.InformNLS( User,
					"Es befindet sich nichts zum Abf�llen im Kessel.",
					"There is nothing to be bottled in the cauldron.")
			return;
	    end
		
		if (ltstate == Action.none) then
		   User:startAction(20,21,5,15,25);
		   return
		end
		
		-- stock, essence brew or potion; fill it up
	   if (cauldron:getData("filledWith") == "stock") or (cauldron:getData("filledWith") == "essenceBrew") or (cauldron:getData("filledWith") == "potion") then  
	        local reGemdust, reCauldron, reBottle = alchemy.base.alchemy.GemDustBottleCauldron(nil, cauldron, nil, User)
			User:inform("reBottle "..reBottle)
			SourceItem.id = reBottle
			alchemy.base.alchemy.CopyAllDatas(cauldron,SourceItem)
		    alchemy.base.alchemy.RemoveAll(cauldron)
		    
	   end
	    world:changeItem(cauldron)
		world:changeItem(SourceItem)
		world:makeSound(10,cauldron.pos)
	end
    
end