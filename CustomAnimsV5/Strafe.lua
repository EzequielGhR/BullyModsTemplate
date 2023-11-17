function main()
    Strafe = false
    if IsButtonPressed(10,0) and InMotion() and (not Strafe) and (not PedIsValid(PedGetGrappleTargetPed(gPlayer))) then
        --strafe
        PedSetActionNode(gPlayer,"/Global/G_Striker_A/Default_KEY/ExecuteNodes/LocomotionOverride/Combat/CombatBasic", "Act/anim/G_Striker_A.act")
        Strafe = true
    end

    while Strafe do
        if (not IsButtonPressed(10,0) or not InMotion()) and (not PedIsValid(PedGetGrappleTargetPed(gPlayer))) then
            PedSetActionNode("/Global/Player", "Act/anim/Player.act")
            Strafe = false
        else
            local x,y,z = PedGetPosXYZ(PedGetTargetPed())
            PedFaceXYZ(gPlayer,x,y,z)
        end
    Wait(0)
    end
    repeat
        Wait(0)
    until not Alive
end