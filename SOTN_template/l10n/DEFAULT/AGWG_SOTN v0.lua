-- AGWG_SOTN v0.1

local allBlueGroups = SET_GROUP:New():FilterCoalitions("blue"):FilterOnce()
local allRedGroups = SET_GROUP:New():FilterCoalitions("red"):FilterOnce()

local gameZone = ZONE:New("Game Zone")

allBlueGroups:ForEachGroupNotInZone(gameZone, function(group)
    group:Destroy()
    end
)
allRedGroups:ForEachGroupNotInZone(gameZone, function(group)
    group:Destroy()
    end
)