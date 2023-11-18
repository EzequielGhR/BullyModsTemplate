local node, act = "/Global/G_Striker_A/Default_KEY/ExecuteNodes/LocomotionOverride/Combat/CombatBasic", "Act/anim/G_Striker_A.act"

function main()
    while true do
        strafe()
    Wait(0)
    end
end

inMotion = function()
    local pos = 0.08
    return GetStickValue(16,0) > pos or GetStickValue(16,0) < -pos or GetStickValue(17,0) > pos or GetStickValue(17,0) < -pos
  end

strafe = function()
    local lockOn, stance = IsButtonPressed(10,0), PedIsPlaying(gPlayer,node,true)
    local validPed, unarmed = PedIsValid(PedGetGrappleTargetPed()), PedHasWeapon(gPlayer,-1)

    if lockOn and inMotion() and unarmed and (not stance) and (not validPed) then
        --strafe
        PedSetActionNode(gPlayer, node, act)
    elseif stance and (not lockOn or not inMotion() or not unarmed) and (not validPed) then
        PedSetActionTree(gPlayer, "/Global/Player", "Act/anim/Player.act")
    elseif stance then
        local x, y, z = PedGetPosXYZ(PedGetTargetPed())
        PedFaceXYZ(gPlayer,x,y,z)
    end
    if lockOn and unarmed and IsButtonBeingPressed(15,0) then
        PedSetActionNode(gPlayer, "/Global/BoxingPlayer/EvadeBank/Evades/EvadeAttacks/RightCharge", "act/anim/BoxingPlayer.act")

end