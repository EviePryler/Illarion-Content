require("handler.sendmessagetoplayer")
require("questsystem.base")
require("base.lookat")
require("base.common")
module("questsystem.testquest.trigger4", package.seeall)

local QUEST_NUMBER = 11111
local PRECONDITION_QUESTSTATE = 3
local POSTCONDITION_QUESTSTATE = 3

local POSITION = position(879, 759, 0)
local RADIUS = 2
local LOOKAT_TEXT_DE = "du kannst was lesen"
local LOOKAT_TEXT_EN = "you can read something"

function LookAtItem(PLAYER, item)
  if PLAYER:isInRangeToPosition(POSITION,RADIUS)
      and ADDITIONALCONDITIONS(PLAYER)
      and questsystem.base.fulfilsPrecondition(PLAYER, QUEST_NUMBER, PRECONDITION_QUESTSTATE) then

    itemInformNLS(PLAYER, item, LOOKAT_TEXT_DE, LOOKAT_TEXT_EN)

    HANDLER(PLAYER)

    questsystem.base.setPostcondition(PLAYER, QUEST_NUMBER, POSTCONDITION_QUESTSTATE)
    return true
  end

  return false
end

function itemInformNLS(player, item, textDe, textEn)
  local lookAt = base.lookat.GenerateLookAt(player, item)
  lookAt.description = base.common.GetNLS(player, textDe, textEn)
  world:itemInform(player, item, lookAt)
end


function HANDLER(PLAYER)
    handler.sendmessagetoplayer.sendMessageToPlayer(PLAYER, "look at funktioniert", "look at  works"):execute()
end

function ADDITIONALCONDITIONS(PLAYER)
return true
end