--[[
Script template for modding Bully
Author: RanggaBS
]]

-- Main function:
function main()
  -- Waiting for the game's appearing:
  while not SystemIsReady() or AreaIsLoading() do
    Wait(0)
  end
  LoadAnim()
  while true do
    Wait(0)
    Strafe = false
    if IsButtonPressed(10,0) and InMotion() and (not Strafe) and (not PedIsValid(PedGetGrappleTargetPed(gPlayer))) then
      --strafe
      PedSetActionNode(gPlayer,"/Global/G_Striker_A/Default_KEY/ExecuteNodes/LocomotionOverride/Combat/CombatBasic", "Act/anim/G_Striker_A.act")
      Strafe = true
      CustomStylePlayer()
    elseif (not IsButtonPressed(10,0) or not InMotion()) and Strafe and (not PedIsValid(PedGetGrappleTargetPed(gPlayer))) then
      PedSetActionTree(gPlayer,"/Global/Player", "Act/anim/Player.act")
      Strafe = false
      CustomStylePlayer()
    elseif Strafe then
      local X,Y,Z = PedGetPosXYZ(PedGetTargetPed(gPlayer))
      PedFaceXYZ(gPlayer,X,Y,Z)
      CustomStylePlayer()
    else
      CustomStylePlayer()
    end
  end
end

-- STimeCycle:
F_AttendedClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  SetSkippedClass(false)
  PlayerSetPunishmentPoints(0)
end
 
F_MissedClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  SetSkippedClass(true)
  StatAddToInt(166)
end
 
F_AttendedCurfew = function()
  if not PedInConversation(gPlayer) and not MissionActive() then
    TextPrintString("You got home in time for curfew", 4)
  end
end
 
F_MissedCurfew = function()
  if not PedInConversation(gPlayer) and not MissionActive() then
    TextPrint("TM_TIRED5", 4, 2)
  end
end
 
F_StartClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  F_RingSchoolBell()
  local l_6_0 = PlayerGetPunishmentPoints() + GetSkippingPunishment()
end
 
F_EndClass = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  F_RingSchoolBell()
end
 
F_StartMorning = function()
  F_UpdateTimeCycle()
end
 
F_EndMorning = function()
  F_UpdateTimeCycle()
end
 
F_StartLunch = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    F_UpdateTimeCycle()
    return 
  end
  F_UpdateTimeCycle()
end
 
F_EndLunch = function()
  F_UpdateTimeCycle()
end
 
F_StartAfternoon = function()
  F_UpdateTimeCycle()
end
 
F_EndAfternoon = function()
  F_UpdateTimeCycle()
end
 
F_StartEvening = function()
  F_UpdateTimeCycle()
end
 
F_EndEvening = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_SlightlyTired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_Tired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_MoreTired = function()
  F_UpdateTimeCycle()
end
 
F_StartCurfew_TooTired = function()
  F_UpdateTimeCycle()
end
 
F_EndCurfew_TooTired = function()
  F_UpdateTimeCycle()
end
 
F_EndTired = function()
  F_UpdateTimeCycle()
end
 
F_Nothing = function()
end
 
F_ClassWarning = function()
  if IsMissionCompleated("3_08") and not IsMissionCompleated("3_08_PostDummy") then
    return 
  end
  local l_23_0 = math.random(1, 2)
end
 
F_UpdateTimeCycle = function()
  if not IsMissionCompleated("1_B") then
    local l_24_0 = GetCurrentDay(false)
    if l_24_0 < 0 or l_24_0 > 2 then
      SetCurrentDay(0)
    end
  end
  F_UpdateCurfew()
end
 
F_UpdateCurfew = function()
  local l_25_0 = shared.gCurfewRules
  if not l_25_0 then
    l_25_0 = F_CurfewDefaultRules
  end
  l_25_0()
end
 
F_CurfewDefaultRules = function()
  local l_26_0 = ClockGet()
  if l_26_0 >= 23 or l_26_0 < 7 then
    shared.gCurfew = true
  else
    shared.gCurfew = false
  end
end

-- Custom functions:
LoadAnim = function()
    LoadAnimationGroup("Authority")
    LoadAnimationGroup("Boxing")
    LoadAnimationGroup("B_Striker")
    LoadAnimationGroup("CV_Female")
    LoadAnimationGroup("CV_Male")
    LoadAnimationGroup("DO_Edgar")
    LoadAnimationGroup("DO_Grap")
    LoadAnimationGroup("DO_StrikeCombo")
    LoadAnimationGroup("DO_Striker")
    LoadAnimationGroup("F_Adult")
    LoadAnimationGroup("F_BULLY")
    LoadAnimationGroup("F_Crazy")
    LoadAnimationGroup("F_Douts")
    LoadAnimationGroup("F_Girls")
    LoadAnimationGroup("F_Greas")
    LoadAnimationGroup("F_Jocks")
    LoadAnimationGroup("F_Nerds")
    LoadAnimationGroup("F_OldPeds")
    LoadAnimationGroup("F_Pref")
    LoadAnimationGroup("F_Preps")
    LoadAnimationGroup("G_Grappler")
    LoadAnimationGroup("G_Johnny")
    LoadAnimationGroup("G_Striker")
    LoadAnimationGroup("Grap")
    LoadAnimationGroup("J_Damon")
    LoadAnimationGroup("J_Grappler")
    LoadAnimationGroup("J_Melee")
    LoadAnimationGroup("J_Ranged")
    LoadAnimationGroup("J_Striker")
    LoadAnimationGroup("LE_Orderly")
    LoadAnimationGroup("Nemesis")
    LoadAnimationGroup("NPC_Mascot")
    LoadAnimationGroup("N_Ranged")
    LoadAnimationGroup("N_Striker")
    LoadAnimationGroup("N_Striker_A")
    LoadAnimationGroup("N_Striker_B")
    LoadAnimationGroup("P_Grappler")
    LoadAnimationGroup("P_Striker")
    LoadAnimationGroup("PunchBag")
    LoadAnimationGroup("Qped")
    LoadAnimationGroup("Rat_Ped")
    LoadAnimationGroup("Russell")
    LoadAnimationGroup("Russell_Pbomb")
    LoadAnimationGroup("Straf_Dout")
    LoadAnimationGroup("Straf_Fat")
    LoadAnimationGroup("Straf_Female")
    LoadAnimationGroup("Straf_Male")
    LoadAnimationGroup("Straf_Nerd")
    LoadAnimationGroup("Straf_Prep")
    LoadAnimationGroup("Straf_Savage")
    LoadAnimationGroup("Straf_Wrest")
    LoadAnimationGroup("TE_Female")
end

InMotion = function()
  local pos = 0.08
  return GetStickValue(16,0) > pos or GetStickValue(16,0) < -pos or GetStickValue(17,0) > pos or GetStickValue(17,0) < -pos
end

CustomStylePlayer = function()
  --function body
  --Hold Left Arrow
  if IsButtonPressed(0,0) then
    PedSetActionNode(gPlayer, "/Global/BOSS_Russell/Offense/Short/Strikes/LightAttacks", "act/anim/BOSS_Russell.act")
--Hold Down arrow
  elseif IsButtonPressed(3,0) then
    PedSetActionNode(gPlayer, "/Global/P_Striker_A/Offense/Short/Strikes/LightAttacks", "Act/Anim/P_Striker_A.act")
  --Right Arrow
  elseif IsButtonBeingPressed(1,0) then
    --While mounting (GIVE)
    if PedIsPlaying(gPlayer, "/Global/Actions/Grapples/Mount/MountIdle/GIVE", true) then
      PedSetActionNode(gPlayer, "/Global/Actions/Grapples/Mount/GrappleMount/Headbutt", "Globals/DO_Grappler_A.act")
    --while grabbing
    elseif PedIsPlaying(gPlayer, "/Global/Actions/Grapples/Front/Grapples/Hold_Idle", "Act/Globals.act", true) then
      local a, b = {
        {"/Global/Actions/Grapples/Front/Grapples/GrappleMoves/BodySlam/Give", "Act/Globals.act"},
        {"/Global/Actions/Grapples/Front/Grapples/GrappleMoves/BackBreaker/Give", "Act/Globals.act"}
      }, math.random(1,2)
      PedSetActionNode(gPlayer, a[b][1], a[b][2])
    else
      local c, d = {
        {"/Global/P_Striker_A/Offense/Short/Strikes/HeavyAttacks/Uppercut", "act/anim/P_Striker_A.act"},
        {"/Global/B_Striker_A/Offense/Short/Strikes/HeavyAttacks/SwingPunch/SwingPunch_R", "Act/Anim/B_Striker_A.act"}
      }, math.random(1,2)
      PedSetActionNode(gPlayer, c[d][1], c[d][2])
    end
  --LS
  elseif IsButtonBeingPressed(14,0) then
    local e, f = {
      {"/Global/G_Striker_A/Offense/Medium/Strikes/HeavyAttack/KickThrust", "act/anim/G_Striker_A.act"},
      {"/Global/Nemesis/Offense/Medium/Strikes/HeavyAttacks/JackieKick", "act/anim/Nemesis.act"},
      {"/Global/G_Striker_A/Offense/Short/Strikes/HeavyAttacks/HeavyKnee","act/anim/G_Striker_A.act"}
    }, math.random(1,3)
    PedSetActionNode(gPlayer, e[f][1], e[f][2])
  --Hold R2
  elseif IsButtonPressed(12,0) then
    PedSetActionNode(gPlayer, "/Global/J_Melee_A/Offense/Short/Strikes/LightAttacks", "act/anim/J_Melee_A.act")
  --X+Square
  elseif IsButtonBeingPressed(6,0) and IsButtonBeingPressed(7,0) then
    --While Grabbing
    if PedIsPlaying(gPlayer, "/Global/Actions/Grapples/Front/Grapples/Hold_Idle", "Act/Globals.act", true) then
      --PedSetActionNode(gPlayer, "/Global/Actions/Grapples/Front/Grapples/GrappleMoves/BackBreaker/Give", "Act/Globals.act")
      PedSetActionNode(gPlayer, "/Global/Actions/Grapples/GrappleReversals/StandingReversals/Sprawl/GIVE", "Act/Globals.act")
      --while mounted (RCV)
    elseif PedIsPlaying(gPlayer, "/Global/Actions/Grapples/Mount/MountIdle/RCV", true) then
      PedSetActionNode(gPlayer, "/Global/Actions/Grapples/GrappleReversals/MountReversals/MountReversalToPunch/GIVE", "Act/Globals.act")
    --While mounting (GIVE)
    elseif PedIsPlaying(gPlayer, "/Global/Actions/Grapples/Mount/MountIdle/GIVE", true) then
      PedSetActionNode(gPlayer, "/Global/Actions/Grapples/GrappleReversals/MountReversals/MountReversalPunches", "Act/Globals.act")
    else
      PedSetActionNode(gPlayer, "/Global/BOSS_Darby/Offense/Short/Grapples/HeavyAttacks/Catch_Throw", "Act/Anim/BOSS_Darby.act")
    end
  --Triangle+Circle
  elseif IsButtonBeingPressed(8,0) and IsButtonBeingPressed(9,0) then
    PedSetActionNode(gPlayer, "/Global/G_Johnny/Offense", "Act/Anim/G_Johnny.act")
  --X+Circle
  elseif IsButtonBeingPressed(7,0) and IsButtonBeingPressed(8,0) then
    PedSetActionNode(gPlayer, "/Global/Nemesis/Offense/Short/Strikes/HeavyAttacks/HeavyPunch1","Act/Anim/Nemesis.act")
  end
end

