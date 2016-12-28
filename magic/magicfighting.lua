--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

--[[
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2785;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2784;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2783;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 2782;
UPDATE weapon SET wp_attack = 44, wp_accuracy = 74, wp_range = 5 WHERE wp_itemid = 3608;
UPDATE weapon SET wp_attack = 29, wp_accuracy = 70, wp_range = 5 WHERE wp_itemid = 323;
]]

local M = {}
local MAGIC_LOAD_LIST = {}
local ELEMENTS = {["NONE"] = 0, ["AIR"] = 1, ["EARTH"] = 2, ["WATER"] = 3, ["SPIRIT"] = 4, ["FIRE"] = 5}
local STAFF_ELEMENTS = {[2785] = ELEMENTS.AIR, [2783] = ELEMENTS.FIRE,
                        [2784] = ELEMENTS.WATER, [3608] = ELEMENTS.SPIRIT,
                        [2782] = ELEMENTS.EARTH, [323] = ELEMENTS.NONE}

local common = require("base.common")
local character = require("base.character")
local fightingutil = require("base.fightingutil")

local function getNeededMana(castTime)
    return math.ceil(100 + (castTime-7)*25)
end

local function calculateCastTime(attackerStruct)
    local weaponPoints = attackerStruct.Weapon.ActionPoints
    local skill = attackerStruct.skill
    local globalSpeedMod = 100
    
    return math.ceil(math.max(7, weaponPoints * (100 - (attackerStruct.willpower-6)*2.5 - skill/5)/globalSpeedMod))   
end

local function checkCriticalAttack(attackerStruct)
    return common.Chance(0.5 + attackerStruct.willpower/20, 100)
end

local function checkBlockedAttack(attackerStruct, defenderStruct)
    local magicDisturbance = defenderStruct.Weapon.MagicDisturbance
    local attackerWillpower = attackerStruct.willpower
    local defenderWillpower = defenderStruct.willpower
    
    local magicBlockChance = 1.5
    local chance = magicDisturbance + magicBlockChance * (1 + (defenderWillpower - attackerWillpower)/40)
    return common.Chance(chance, 100)
end

local function checkMissedAttack(attackerStruct)
    local accuracy = common.Limit(attackerStruct.Weapon.Accuracy * 1.25, 5, 95)
    local healthInPercent = attackerStruct.Char:increaseAttrib("hitpoints", 0) / 10000 --10k is maxhealth

    -- Low willpower will lower the hitchance with staffs, while high willpower will enhance item
    -- Damage in health will lower the concentration and therefore the attack is likely to miss
    local chance = accuracy*healthInPercent + (attackerStruct.willpower-5)*2
    local chance = 100 - common.Limit(chance, 5, 95)
    
    return common.Chance(chance, 100)
end

local function isMagicAttackLoaded(attackerStruct, defender, neededCastTime)
    local attacker = attackerStruct["Char"]
    local mageLoad = MAGIC_LOAD_LIST[attacker.id]
    
    -- Check if the player has changed his target/weapon/position or if he attacks for the first time
    if mageLoad == nil or (
    attackerStruct.WeaponItem.id ~= mageLoad["weapon"] or defender.id ~= mageLoad["target"] or
    attacker.pos.x.." "..attacker.pos.y.." "..attacker.pos.z ~= mageLoad["position"]) then
        MAGIC_LOAD_LIST[attacker.id] = {}
        MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
        MAGIC_LOAD_LIST[attacker.id]["weapon"] = attackerStruct.WeaponItem.id
        MAGIC_LOAD_LIST[attacker.id]["target"] = defender.id
        MAGIC_LOAD_LIST[attacker.id]["position"] = attacker.pos.x.." "..attacker.pos.y.." "..attacker.pos.z
        return false
    end
    
    -- Same reasonsing as in aiming time applies:
    -- We cannot check for the end of a fight but need to stop the start aiming, stop aiming, wait, attack immediately mechanic
    if (world:getTime("unix") - mageLoad["started"])*10 > neededCastTime + 20 then
        MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
        return false
    end
    
    -- Check if we can shoot
    if (world:getTime("unix") - mageLoad["started"])*10 < neededCastTime then
        return false
    end
    
    -- Reset magicLoadTime if defender has run away or is blocked(!)
    if not fightingutil.checkRangeAndView(attackerStruct, defender) then
        MAGIC_LOAD_LIST[attacker.id]["started"] = world:getTime("unix")
        return false
    end
    
    return true
end

local function sfxGfxOutput(attackerStruct, defenderStruct, element)
    common.CreateLine(attackerStruct.Char.pos, defenderStruct.Char.pos, function(currentPos)
        local gfxId = 0 
        if (currentPos == defenderStruct.Char.pos) then
            if (element == ELEMENTS.FIRE) then
                gfxId = 44
            elseif (element == ELEMENTS.AIR) then
                gfxId = 7
            elseif (element == ELEMENTS.WATER) then
                gfxId = 4
            elseif (element == ELEMENTS.EARTH) then
                gfxId = 5
            elseif (element == ELEMENTS.SPIRIT) then
                gfxId = 31
            end
        else
            gfxId = 1
        end
        world:gfx(gfxId, currentPos)
    end)
            
    world:makeSound(13, attackerStruct.Char.pos)
end    
    
local function applyCriticalEffect(attackerStruct, defenderStruct, element) 
    if (element == ELEMENTS.FIRE) then
        local burning = require("magic.lte.burning")
        burning.initEffect(defenderStruct.Char, 10, 10)
    elseif (element == ELEMENTS.AIR) then
        local windshield = require("magic.lte.windshield")
        windshield.initEffect(attackerStruct.Char, 10, 10)
    elseif (element == ELEMENTS.WATER) then
        local frozen = require("magic.lte.frozen")
        frozen.initEffect(defenderStruct.Char, 10, 10)
    elseif (element == ELEMENTS.EARTH) then
        local meteor = require("magic.instant.meteor")
        meteor.cast(attackerStruct.Char, defenderStruct.Char)
    elseif (element == ELEMENTS.SPIRIT) then
        -- Nothing yet
    else -- apprentice staffs
        -- Nothing yet
    end
end

local function applyDamage(attackerStruct, defenderStruct)
    local itemLevel = world:getItemStatsFromId(attackerStruct.WeaponItem.id).Level 
 
    -- damage boni
    local intBonus = 3.5 * (attackerStruct.intelligence - 6)
    local essenceBonus = 1.1 * (attackerStruct.essence - 6) 
    local skillBonus = 1.5 * (attackerStruct.skill - 20)
    local qualityBonus = 0.91 + 0.02 * math.floor(attackerStruct.WeaponItem.quality/100) --ranges: 0.93 - 1.09
    local globalDamageFactor = 1/180 -- mirrored from standardfighting
    
    -- base damage
    local damage = attackerStruct.Weapon.Attack * 20
    
    -- inflict malus for too high weapon
    local noobMalus = 5
    if attackerStruct.skill < itemLevel then
        damage = damage / noobMalus
    end

    -- raw damage without defence
    damage = damage * globalDamageFactor * qualityBonus * (100 + intBonus + essenceBonus + skillBonus)
    
    local fighting = require("content.fighting")
    local hitArea = fighting.GetHitArea(defenderStruct.Race)
    local hitItem = defenderStruct.Char:getItemAt(hitArea)
    local armorValue = world:getItemStatsFromId(hitItem.id).Level
    local armorDefenseScalingFactor = 4/3
    local generalScalingFactor = 2.8
    local armorSkill = 0
    local armorValue = 1
    
    local armorFound, armor = world:getArmorStruct(hitItem.id)
    if (armorFound) then
        local armorSkill = nil
        local armourType = armor.Type
        if armorType == 4 then
            armorSkill = Character.heavyArmor
        elseif armorType == 3 then
            armorSkill = Character.mediumArmor
        elseif armorType == 2 then
            armorSkill = Character.lightArmor
        end
    end
    
    -- defence boni
    local defQualityBonus = 0.82 + 0.02 + math.floor(hitItem.quality/100)
    local defSkillBonus = 1 - armorSkill/400
    
    local defGemBonus = gems.getGemBonus(hitItem)
    armorValue = armorValue + armorValue * defGemBonus / 100
    
    local armorScalingFactor = 5
    local noobMalus = 5
    if character.IsPlayer(defenderStruct.Char) and defItemLevel > armorSkill then
        armorValue = armorValue / noobMalus
    end
    armorValue = armorValue*(1 - 1/armorScalingFactor) + (100/armorScalingFactor)
    
    damage = defSkillBonus * (damage - (damage * armorValue * defQualityBonus/140))
    
    local resistance = math.max(1, math.floor(
        2*(defenderStruct.willpower - 6)
        + 0.5*(defenderStruct.intelligence - 6)
        + 0.5*(defenderStruct.essence - 6)))
    local resistance = common.Limit(Random.uniform(resistance, resistance*2) / 80.0, 0, 1)
    damage = damage * (1 - resistance)
    
    -- take consitution of enemy in account
    damage  = (1 + damage * 14) / (defenderStruct.Char:increaseAttrib("constitution", 0) / 2)
    
    -- limits for damage
    damage = math.max(0, damage)
    damage = damage * (math.random(9,10)/10)
    damage = math.min(damage, 4999)
    damage = math.floor(damage)

    -- inflict damage and check if character would die
    if character.IsPlayer(defenderStruct.Char) and character.WouldDie(defenderStruct.Char, damage + 1) then
        if character.AtBrinkOfDeath(defenderStruct.Char) then
            if defenderStruct.Char:isAdmin() then
                chr_reg.stallRegeneration(defenderStruct.Char, 0)
            end
            character.Kill(defenderStruct.Char)
        else
            -- Character would die.
            character.ToBrinkOfDeath(defenderStruct.Char)
            common.TalkNLS(defenderStruct.Char, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

            if not defenderStruct.Char:isAdmin() then --Admins don't want to get paralysed!
                common.ParalyseCharacter(defenderStruct.Char, 2, false, true)
            end
            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(defenderStruct.Char, 60 / timeFactor)
        end
    else
        attackerStruct.Char:inform("DD: "..damage) -- DEBUG
        character.ChangeHP(defenderStruct.Char, -damage)
    end
end

function M.onMagicAttack(attackerStruct, defenderStruct)
    
    common.TurnTo(attackerStruct.Char,defenderStruct.Char.pos)
    attackerStruct.skill = attackerStruct.char:getSkill(Character.wandMagic)
    
    attackerStruct["willpower"] = attackerStruct.Char:increaseAttrib("willpower", 0)
    local neededCastTime = calculateCastTime(attackerStruct)
    
    -- Any attack must preload a given time before he can be executed
    if not isMagicAttackLoaded(attackerStruct, defenderStruct.Char, neededCastTime) then
        return
    end
    
    -- An attack is executed, reset the waittime till the next attack
    if character.IsPlayer(attackerStruct.Char) then
        MAGIC_LOAD_LIST[attackerStruct.Char.id]["started"] = world:getTime("unix")
    end
    
    -- Handle mana usage
    attackerStruct["mana"] = attackerStruct.Char:increaseAttrib("mana", 0)
    local neededMana = getNeededMana(neededCastTime)
    if (attackerStruct.mana < neededMana) then
        attackerStruct.Char:inform("Dein Mana reicht nicht aus", "Your mana is depleted")
        return
    end
    attackerStruct.Char:increaseAttrib("mana", -neededMana)
    
    attackerStruct["intelligence"] = attackerStruct.Char:increaseAttrib("intelligence", 0)
    attackerStruct["essence"] = attackerStruct.Char:increaseAttrib("essence", 0)
    
    attackerStruct.Char:performAnimation(6)
    
    local hisher =  common.GetGenderText(attackerStruct.Char,"his","her")
    local seinihr = common.GetGenderText(attackerStruct.Char,"sein","ihr")
    
    if checkMissedAttack(attackerStruct) then
        attackerStruct.Char:inform("Der Angriff gelingt nicht. Du hast kurz die Konzentration verloren.", "The attack fails. You briefly lost your concentration.", Player.lowPriority)
        return
    end
    
    common.CreateLine(attackerStruct.Char.pos, defenderStruct.Char.pos, 
        function(currentPos)
            world:gfx(1, currentPost)
        end
    )
    
    defenderStruct = fightingutil.loadWeapons(defenderStruct)
    defenderStruct["intelligence"] = defenderStruct.Char:increaseAttrib("intelligence", 0)
    defenderStruct["willpower"] = defenderStruct.Char:increaseAttrib("willpower", 0)
    defenderStruct["essence"] = defenderStruct.Char:increaseAttrib("essence", 0)
    
    if checkBlockedAttack(attackerStruct, defenderStruct) then
        attackerStruct.Char:inform("Deiner Willenskraft gelingt es, die magische Attacke abzublocken.", "Your willpower was able to block this magic attack.", Player.lowPriority)
        attackerStruct.Char:inform("Dein Gegner blockt mit seinem Willen den Angriff ab.", "Your enemy is able to block your attack with his willpower.", Player.lowPriority)
        return
    end
    
    local element = STAFF_ELEMENTS[attackerStruct.WeaponItem.id]
    --[[
    -- Will be added once we have citical attacks for all elements.
    if checkCriticalAttack(attackerStruct) then
        applyCriticalEffect(attackerStruct, defenderStruct, element)
    end
    --]]
    sfxGfxOutput(attackerStruct, defenderStruct, element)
    
    applyDamage(attackerStruct, defenderStruct)
    
    attackerStruct.Char:learn(skill, neededCastTime/3, 100)
    
    return true
end

return M