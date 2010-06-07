require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.skill", package.seeall)

skill = class(npc.base.condition.condition.condition,
function(self, name, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = value + 1 - 1;
    self["skill"] = name;
    if (comp == "=") then
        self["check"] = _skill_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _skill_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _skill_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _skill_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _skill_helper_greater;
    elseif (comp == "<") then
        self["check"] = _skill_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _skill_helper_equal(self, player)
    return (self.value == player:getSkill(self.skill))
end;

function _skill_helper_notequal(self, player)
    return (self.value ~= player:getSkill(self.skill))
end;

function _skill_helper_lesserequal(self, player)
    return (self.value <= player:getSkill(self.skill))
end;

function _skill_helper_greaterequal(self, player)
    return (self.value >= player:getSkill(self.skill))
end;

function _skill_helper_lesser(self, player)
    return (self.value < player:getSkill(self.skill))
end;

function _skill_helper_greater(self, player)
    return (self.value > player:getSkill(self.skill))
end;