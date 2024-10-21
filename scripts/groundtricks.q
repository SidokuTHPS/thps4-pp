
TRICK_PRELOAD_TIME = 160
Jumptricks0 =
[ { Trigger = { TapOnceRelease , Up , x , 300 } Scr = NoComply params = { name = 'No Comply' Score = 100 } } ]
Jumptricks =
[ { Trigger = { TapTwiceRelease , Up , x , 500 } TrickSlot = JumpSlot } ]
Trick_Boneless = { Scr = Boneless params = { name = 'Boneless' Anim = Boneless Score = 250 } }
Trick_Fastplant = { Scr = Boneless params = { name = 'Fastplant' Anim = Fastplant Score = 250 } }
Trick_Beanplant = { Scr = Boneless params = { name = 'Beanplant' Anim = Beanplant Score = 250 } }
GroundTricks =
[
  { Trigger = { Press , R2 , 20 } Scr = ToggleSwitchRegular }
  { Trigger = { Press , L2 , 20 } Scr = ToggleNollieRegular }
  { Trigger = { HoldThree , R1 , L1 , Down } Scr = ToggleSwitchRegular params = { PowerSlide } }
  { Trigger = { TapOnceRelease , Up , x , 300 } Scr = NoComply params = { name = 'No Comply' Score = 100 } }
  { Trigger = { HoldTwoAndPress , R1 , L1 , Triangle , 500 } Scr = Props params = { string_id = props_string } }
  { Trigger = { HoldTwoAndPress , R1 , L1 , Square , 500 } Scr = Taunt params = { Anim = Taunt1 string_id = your_daddy_string } }
  { Trigger = { HoldTwoAndPress , R1 , L1 , Circle , 500 } Scr = Taunt params = { Anim = Taunt2 string_id = no_way_string } }
  { Trigger = { HoldTwoAndPress , R1 , L1 , x , 500 } Scr = Taunt params = { Anim = Taunt3 string_id = get_some_string } }
]
NoTricks =
[
]
Reverts =
[
  { Trigger = { Press , R2 , 200 } TrickSlot = ExtraSlot1 }
  { Trigger = { Press , L2 , 200 } TrickSlot = ExtraSlot2 }
]
script Revert FSName = 'FS Revert' BSName = 'BS Revert' FSAnim = RevertFS BSAnim = RevertBS
  ClearLipCombos
  KillExtraTricks
  SetTrickScore 100
  OnGroundExceptions_NoEndRun
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    Obj_SpawnScript CessTrail params = { repeat_times = 10 }
    PlayCessSound
    Vibrate Actuator = 0 percent = 80 duration = 0.5
    Vibrate Actuator = 1 percent = 80 duration = 0.1
  endif
  ClearException Ollied
  SetSpecialFriction [ 0 , 10 , 15 , 20 , 30 , 50 ]
  SetQueueTricks NoTricks
  SetManualTricks Special = SpecialManualTricks ManualTricks
  NollieOff
  if Obj_FlagSet FLAG_SKATER_REVERTFS
    Obj_ClearFlag FLAG_SKATER_REVERTFS
    PlayAnim Anim = <FSAnim>
    SetTrickName <FSName>
  else
    if Obj_FlagSet FLAG_SKATER_REVERTBS
      Obj_ClearFlag FLAG_SKATER_REVERTBS
      PlayAnim Anim = <BSAnim>
      SetTrickName <BSName>
    else
      if LastSpinWas Frontside
        PlayAnim Anim = <FSAnim>
        SetTrickName <FSName>
      else
        PlayAnim Anim = <BSAnim>
        SetTrickName <BSName>
      endif
    endif
  endif
  Display Blockspin
  FlipAfter
  BoardRotateAfter
  BlendperiodOut 0.0
  Wait 0.1 seconds
  SetException Ex = Ollied Scr = Ollie
  WaitAnimFinished
  SetRollingFriction #"default"
  DoNextManualTrick FromAir
  OnGroundExceptions
  CheckGapTricks
  ClearPanel_Landed
  OverrideCancelGround Off
  ClearEventBuffer
  ClearManualTrick
  WaitAnimWhilstChecking AndManuals
  goto OnGroundAI
endscript
script RevertCheeseTimer
  Obj_SetFlag FLAG_SKATER_REVERTCHEESE
  Wait 25 seconds
  SetTags RevertCheese = 0
  Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
endscript
script RevertCheeseIncrement
  Gettags
   <RevertCheese> = ( <RevertCheese> + 1 )
  SetTags RevertCheese = <RevertCheese>
  return RevertCheese = <RevertCheese>
endscript
script ToggleSwitchRegular
  OnGroundExceptions
  SetQueueTricks NoTricks
  ClearTrickQueues
  SetException Ex = Ollied Scr = Ollie params = { NoDoNextTrick }
  NollieOff
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    Obj_SpawnScript CessTrail params = { delay = 3 }
    Vibrate Actuator = 0 percent = 80 duration = 0.5
    Vibrate Actuator = 1 percent = 80 duration = 0.1
  endif
  if GotParam PowerSlide
    Rotate y = 180 duration = 0.3 seconds
    if LeftPressed
      if Flipped
        PlayAnim Anim = FSPowerslide
      else
        PlayAnim Anim = BSPowerslide
      endif
    else
      if RightPressed
        if Flipped
          PlayAnim Anim = BSPowerslide
        else
          PlayAnim Anim = FSPowerslide
        endif
      else
        PlayAnim Anim = FSPowerslide
      endif
    endif
  else
    if LeftPressed
      if Flipped
        PlayAnim Anim = CessSlide180_FS
      else
        PlayAnim Anim = CessSlide180_BS
      endif
    else
      if RightPressed
        if Flipped
          PlayAnim Anim = CessSlide180_BS
        else
          PlayAnim Anim = CessSlide180_FS
        endif
      else
        PlayAnim Anim = CessSlide180_FS
      endif
    endif
  endif
  WaitAnim 30 percent
  FlipAfter
  BoardRotateAfter
  if not GetGlobalFlag flag = CHEAT_HOVERBOARD
    PlayCessSound
  endif
  WaitAnim 95 percent
  SetQueueTricks Jumptricks GroundTricks
  BlendperiodOut 0.0
  WaitAnimWhilstChecking AndManuals
  if not GotParam PowerSlide
    if CanKick
      if ShouldMongo
      else
        PlayAnim Anim = PushCycle cycle BlendPeriod = 0.2
      endif
    else
      if AnimFinished
        PlayAnim Anim = Idle cycle BlendPeriod = 0.4
      endif
    endif
  endif
  ClearTrickQueue
  goto OnGroundAI
endscript
script CessTrail repeat_times = 20
  if SpeedGreaterThan 400
    if GotParam delay
      Wait <delay> frames
    endif
    begin
      if not onground
        break
      else
        if IsXbox
          TextureSplat size = 6 radius = 0 bone = burnq_back_wheel name = "skidtrail" trail lifetime = 15
          TextureSplat size = 6 radius = 0 bone = burnq_front_wheel name = "skidtrail" trail lifetime = 15
        else
          TextureSplat size = 6 radius = 0 bone = burnq_back_wheel name = "skidtrail_ps2" trail lifetime = 15
          TextureSplat size = 6 radius = 0 bone = burnq_front_wheel name = "skidtrail_ps2" trail lifetime = 15
        endif
      endif
      Wait 1 game frame
    repeat <repeat_times>
  endif
endscript
script ToggleNollieRegular
  OnGroundExceptions
  SetException Ex = Ollied Scr = Nollie params = { NoDoNextTrick }
  ClearTrickQueues
  SetQueueTricks GroundTricks
  if InNollie
    printf "in Nollie mode ---------------------------"
    NollieOff
    if Crouched
      PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1 Backwards
    else
      PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1 Backwards
    endif
  else
    NollieOn
    if Crouched
      PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1
    else
      PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1
    endif
  endif
  WaitAnimWhilstChecking AndManuals
  if InNollie
    goto OnGroundNollieAI
  else
    goto OnGroundAI
  endif
endscript
script Nollie
  if GotParam NoDoNextTrick
  else
    DoNextTrick
  endif
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 percent = 50 duration = 0.05
  NollieOn
  PlayAnim Anim = Nollie BlendPeriod = 0.1
  if ProfileEquals stance = regular
    if Flipped
      SetTrickName 'Nollie'
      SetTrickScore 200
    else
      SetTrickName 'Fakie Ollie'
      SetTrickScore 200
    endif
  else
    if Flipped
      SetTrickName 'Fakie Ollie'
      SetTrickScore 200
    else
      SetTrickName 'Nollie'
      SetTrickScore 200
    endif
  endif
  Display
  Bailoff
  WaitAnimWhilstChecking
  goto Airborne
endscript
script NollieNoDisplay OutSpeed = 1
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  SetTrickName 'Nollie'
  SetTrickScore 100
  Display Deferred
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 percent = 80 duration = 0.05
  NollieOn
  if GotParam OutAnim
    PlayAnim Anim = <OutAnim> BlendPeriod = 0.3 speed = <OutSpeed>
  else
    PlayAnim Anim = Nollie BlendPeriod = 0.1
  endif
  if GotParam BoardRotate
    BlendperiodOut 0
    BoardRotateAfter
  endif
  Bailoff
  WaitAnimWhilstChecking
  goto Airborne
endscript
Dpad = [ Up Down left right UpRight UpLeft DownRight DownLeft ]
script Ollie OutSpeed = 1
  StopSkitch
  if GotParam NoDoNextTrick
  else
    DoNextTrick
  endif
  SetTrickName 'Ollie'
  SetTrickScore 100
  Display Deferred
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 percent = 50 duration = 0.05
  if GotParam FromLip
    printf "came from lip=================="
    PlayAnim Anim = <OutAnim> BlendPeriod = 0.0
    BlendperiodOut 0
  else
    if GotParam OutAnim
      PlayAnim Anim = <OutAnim> BlendPeriod = 0.3 speed = <OutSpeed>
    else
      PlayAnim Anim = Ollie BlendPeriod = 0.0 NoRestart
    endif
  endif
  if GotParam BoardRotate
    BlendperiodOut 0
    BoardRotateAfter
  endif
  if GotParam RotateAfter
    RotateAfter
  endif
  if GotParam FlipAfter
    printf "=========flipping the skater in Ollie"
    FlipAfter
  endif
  if GotParam NoBlend
    BlendperiodOut 0
  endif
  if GotParam WaitOnOlliePercent
    BailOn
    WaitAnim <WaitOnOlliePercent> percent
  endif
  Bailoff
  WaitAnimWhilstChecking
  goto Airborne
endscript
script NoComply
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump"
  InAirExceptions
  Vibrate Actuator = 1 percent = 80 duration = 0.05
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  Bailoff
  PlayAnim Anim = NoComply BlendPeriod = 0.2
  WaitAnimWhilstChecking
  goto Airborne
endscript
script Beanplant
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 percent = 80 duration = 0.1
  PlaySound boneless09 pitch = 85
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  PlayAnim Anim = Beanplant BlendPeriod = 0.2
  WaitAnimWhilstChecking
  goto Airborne
endscript
script Fastplant
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 percent = 80 duration = 0.1
  SetTrickName <name>
  SetTrickScore <Score>
  Display
  PlayAnim Anim = Fastplant BlendPeriod = 0.2
  Bailoff
  WaitAnimWhilstChecking
  goto Airborne
endscript
script Boneless Anim = Boneless name = 'Boneless' Score = 250
  ClearTrickQueue
  ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
  #"Jump" BonelessHeight
  InAirExceptions
  Vibrate Actuator = 1 percent = 80 duration = 0.1
  PlaySound boneless09 pitch = 85
  SetTrickName <name>
  SetTrickScore <Score>
  if not SkaterIsNamed Vallely
    PlayAnim Anim = <Anim> BlendPeriod = 0.2
  else
    PlayAnim Anim = _540Boneless BlendPeriod = 0.1 speed = 1.25 From = 10
    SetTrickScore 300
    SetTrickName "MikeV Boneless"
    FlipAfter
    BlendperiodOut 0
  endif
  Display
  Bailoff
  WaitAnimWhilstChecking
  goto Airborne
endscript
script BonelessWaitAnimWhilstChecking
  begin
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    if AnimFinished
      break
    endif
    WaitOneGameFrame
    if onground
      goto Land
    endif
  repeat
endscript
script Taunt
  ClearException Ollied
  PlayAnim Anim = <Anim> BlendPeriod = 0.3
  GetPreferenceString pref_type = Taunt <string_id>
  if InNetGame
    SendChatMessage string = <ui_string>
  endif
  Wait 10 game frame
  OnGroundExceptions
  if SpeedLessThan 1
    SetRollingFriction 100
    WaitAnimWhilstChecking AndManuals
    goto Handbrake
  else
    WaitAnimWhilstChecking AndManuals
    goto OnGroundAI
  endif
endscript
script Props
  OnGroundExceptions
  PlayAnim random( @Anim = Prop @Anim = Cheer1  ) BlendPeriod = 0.3
  GetPreferenceString pref_type = Taunt <string_id>
  if InNetGame
    SendChatMessage string = <ui_string>
  endif
  if SpeedLessThan 1
    SetRollingFriction 100
    WaitAnimWhilstChecking AndManuals
    goto Handbrake
  else
    WaitAnimWhilstChecking AndManuals
    goto OnGroundAI
  endif
endscript
script BitchSlap
  OnGroundExceptions
  PlayAnim Anim = Slapright NoRestart BlendPeriod = 0.3
  WaitAnimWhilstChecking AndManuals
  goto OnGroundAI
endscript
script Skitch
  ClearExceptions
  ResetLandedFromVert
  KillExtraTricks
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called CallInsteadOfGoto
  SetException Ex = Ollied Scr = Ollie params = { <...> }
  SetException Ex = OffMeterTop Scr = SkitchOut
  SetException Ex = OffMeterBottom Scr = SkitchOut
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetTags state = skater_skitching
  ClearTrickQueue
  SetQueueTricks NoTricks
  ClearManualTrick
  SetManualTricks NoTricks
  StartSkitch
  StartBalanceTrick
  PlayAnim Anim = SkitchInit
  WaitAnimFinished
  PlaySound Hud_jumpgap
  SetTrickName "\c2Skitchin\C0"
  SetTrickScore 500
  Display
  DoBalanceTrick ButtonA = right ButtonB = left type = Skitch Tweak = 5
  PlayAnim Anim = SkitchRange wobble
  begin
    overridelimits max = 10000 friction = 0 time = 5 gravity = 0
    if held Down
      Obj_SpawnScript NoBrake_Timer
      goto SkitchOut
    endif
    WaitOneGameFrame
  repeat
endscript
script SkitchOut
  StopSkitch
  StopBalanceTrick
  PlayAnim Anim = SkitchInit Backwards
  OnGroundExceptions
  ClearException Skitched
  ClearPanel_Landed
  WaitAnimFinished
  goto OnGroundAI
endscript
script NoBrake_Timer
  CanBrakeOff
  Wait 0.5 seconds
  CanBrakeOn
endscript
