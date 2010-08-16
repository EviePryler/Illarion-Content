require("base.class")


module("quest.leverquest", package.seeall)

-- This should be the base class for the leverquest; it should hopefully serve as an example how to do quests.
LeverQuest = base.class.class(function(lvQst)   -- this is the constructor
    lvQst.theString="";                         -- this initializes the string that is produced by the levers and the sequence they were pulled.
    lvQst.levPos1=position(220,735,0);
    lvQst.levTyp1=434;                          -- Item-ID of the reset lever.
    lvQst.levPos2=position(220,737,0);
    lvQst.levTyp2=434;
    lvQst.levPos3=position(220,739,0);
    lvQst.levTyp3=434;
    lvQst.levPos4=position(220,741,0);
    lvQst.levTyp4=434;
    lvQst.levPos5=position(220,743,0);
    lvQst.levTyp5=434;
end);

function LeverQuest:addToString(char)                   -- This is called by the execute-command of the lever handler.
    if (string.find(self.theString,char)==nil) then
        self.theString=self.theString..char;
    end
    
    if (string.len(self.theString)==5)then
        self:checkSuccess();
    end
    
    plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
    for i, player in pairs(plyList) do
        player:inform("theString now is:"..self.theString);
    end
end

function LeverQuest:checkSuccess()
    if (self.theString=="12345") then       -- replace this by the true condition
        plyList=world:getPlayersInRangeOf(position(221,739,0), 20);
        for i, player in pairs(plyList) do
            player:inform("GEWONNEN");      -- replace this with the true consequence
        end
    end
    self.theString="";                      -- add the reset of levers here.
    self:resetLevers();
end

function LeverQuest:resetLevers()
    local LeverList={self.levPos1,self.levPos2,self.levPos3,self.levPos4,self.levPos5};
    local LeverType={self.levTyp1,self.levTyp2,self.levTyp3,self.levTyp4,self.levTyp5};
    for i, lvPo in pairs(LeverList) do
        if (world:isItemOnField(lvPo)==true) then
        leverItem=world:getItemOnField(lvPo);
        leverItem.id=LeverType[i];
            leverItem.data=0;
            world:changeItem(leverItem);
        end
    end
end