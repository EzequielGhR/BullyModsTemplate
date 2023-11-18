local node, act = "/Global/J_Melee_A/Default_KEY/ExecuteNodes/LocomotionOverride/Combat/CombatBasic", "Act/anim/J_Melee_A.act"

function main()
    while true do
        if IsButtonPressed(10, 0) and InMotion() and (not PedIsPlaying(gPlayer, node, true)) and (not PedIsValid(PedGetGrappleTargetPed())) then
            --strafe
            PedSetActionNode(gPlayer, node, act)
        elseif PedIsPlaying(gPlayer, node, true) and (not IsButtonPressed(10,0) or not InMotion()) and (not PedIsValid(PedGetGrappleTargetPed())) then
            PedSetActionTree(gPlayer, "/Global/Player", "Act/anim/Player.act")
        elseif PedIsPlaying(gPlayer, node, true) then
            local x, y, z = PedGetPosXYZ(PedGetTargetPed())
            PedFaceXYZ(gPlayer,x,y,z)
        end
    Wait(0)
    end
end

InMotion = function()
    local pos = 0.08
    return GetStickValue(16,0) > pos or GetStickValue(16,0) < -pos or GetStickValue(17,0) > pos or GetStickValue(17,0) < -pos
  end