
ExcludeFromSkaterDebug =
[
  waitonegameframe
  waitanimfinished
  waitanimwhilstchecking
  just_coasting
  DoCrouch_slope
  SetClothesInactive
  SetClothesActive
  ShutDownWindyBone
  PlayLeftRightTennisAnim
  PlayBrakeAnim
  CessBrake
]
script SkaterInit
  Obj_StopStream
  Unhide
  UnpausePhysics
  NotInBail
  BashOff
  NotifyBailDone
  Obj_KillSpawnedScript name = BailBoardControl
  SwitchOnBoard
  SetSkaterCamLerpReductionTimer time = 0
  ClearLipCombos
  AllowRailTricks
  Obj_KillSpawnedScript name = SetUpLipCombo
  ClearTrickQueues
  ResetLandedFromVert
  BlendperiodOut 0
  Obj_Attachframe bone = "head"
  SetTags state = skater_none racemode = none
  if LevelIs Load_Alc
    Obj_StopSound ShoppingCartLoop
  endif
  if not GotParam NoEndRun
    SetException Ex = RunHasEnded Scr = EndOfRun
    SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  endif
  StopBalanceTrick
  if Skitching
    StopSkitch
    setstate ground
  endif
  VibrateOff
  ClearSkaterFlags
  printf "Clearing skaters flags =============="
  SetExceptionThatPreservesBalanceTrick MadeOtherSkaterBail
  Obj_KillSpawnedScript name = WindyClothes
  Obj_SpawnScript WindyClothes
  SetBoneTransActive bone = breast_cloth_zz 0
  if not GotParam NoAnims
    PlayAnim Anim = Idle
  endif
  SetBalanceTrickParams ManualParams
  Obj_KillSpawnedScript name = BloodSmall
  Obj_KillSpawnedScript name = BloodSplat
  Obj_KillSpawnedScript name = SkaterBloodOn
  ResetSkaterParticleSystems
  LockVelocityDirection Off
  CanBrakeOn
  RestoreAutoKick
  overridelimits max = 1000 friction = 0 time = 0
  CleanUpExtraProps
  SetSlomo 1
  kill_blur
  KillExtraTricks
  EnableSkaterRotation
  if SkaterIsNamed jenna
    SwitchOffAtomic shoes
  endif
  SetSkaterCamOverride heading = 0 tilt = 0 time = 0.0 zoom = 1
  wait 1 game frame
  ClearSkaterCamOverride
  ClearPanel_Landed
  if not GotParam ReturnControl
    goto OnGroundAI
  endif
endscript
script CleanUpExtraProps
  if GameModeEquals is_career
    if LevelIs Load_Alc
      kill prefix = "ago_ShoppingCart"
    endif
  endif
endscript
script ClientSkaterInit
  SwitchOffAtomic special_item
endscript
script SkaterRetryScript
  SkaterInit
endscript
Exceptions =
[
  GoalHasEnded
  RunHasEnded
  SkaterCollideBail
  MadeOtherSkaterBail
  Ollied
  GroundGone
  Landed
  OntoRail
  OffRail
  FlailHitWall
  FlailLeft
  FlailRight
  OffMeterTop
  OffMeterBottom
  WallRideLeft
  WallRideRight
  WallRideBail
  CarBail
  CarPlant
  WonGame
  LostGame
  Skitched
]
script OnGroundExceptions
  if GotParam NoClear
  else
    ClearExceptions
  endif
  if GotParam NoEndRun
  else
    SetException Ex = RunHasEnded Scr = EndOfRun
    SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  endif
  SetException Ex = GroundGone Scr = GroundGone
  SetException Ex = Ollied Scr = Ollie
  SetException Ex = FlailHitWall Scr = FlailHitWall
  SetException Ex = FlailLeft Scr = FlailLeft
  SetException Ex = FlailRight Scr = FlailRight
  SetException Ex = CarPlant Scr = CarPlant
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = Skitched Scr = Skitch
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail
  SetQueueTricks Jumptricks GroundTricks
  SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
  SetManualTricks special = SpecialManualTricks GroundManualTricks
  SetTags state = skater_onground
  VibrateOff
  SwitchOnBoard
  EnablePlayerInput
  BailOff
  BashOff
  SetRollingFriction #"default"
  CanSpin
  AllowRailTricks
  SetSkaterCamLerpReductionTimer time = 0
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  BloodParticlesOff
  if GotParam NoEndRun
  else
    ResetLandedFromVert
  endif
endscript
script OnGroundExceptions_NoClear
  OnGroundExceptions NoClear
endscript
script OnGroundExceptions_NoEndRun
  OnGroundExceptions NoEndRun
endscript
script InAirExceptions
  ClearExceptions
  SetException Ex = Landed Scr = Land
  SetException Ex = WallRideLeft Scr = WallRide Params = { Left }
  SetException Ex = WallRideRight Scr = WallRide Params = { Right }
  SetException Ex = WallRideBail Scr = WallRideBail
  SetException Ex = CarPlant Scr = CarPlant CallInsteadofGoto
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailAir CallInsteadofGoto
  SetQueueTricks special = SpecialTricks AirTricks
  SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
  SetManualTricks special = SpecialManualTricks ManualTricks
  SetTags state = skater_inair
  VibrateOff
  EnablePlayerInput
  BailOff
  BashOff
  SetRollingFriction #"default"
  setstate Air
  CanSpin
  OverrideCancelGround Off
endscript
script ClearTrickQueues
  ClearTrickQueue
  ClearManualTrick
  ClearExtraGrindTrick
endscript
script OnGroundAI Coasting = 0 Pushes = 0 Blendperiod = 0.4
  if not OnGround
    setstate ground
  endif
  OnGroundExceptions
  SetRollingFriction #"default"
  EnablePlayerInput
  NollieOff
  begin
    GetSlope
    if LeftPressed
      if Crouched
        if Flipped
          if AnimEquals CrouchTurnRightIdle
          else
            PlayAnim Anim = CrouchTurnRight NoRestart Blendperiod = 0.4
            if AnimFinished
              PlayAnim Anim = CrouchTurnRightIdle Cycle NoRestart Blendperiod = 0.4
            endif
          endif
        else
          if AnimEquals CrouchTurnLeftIdle
          else
            PlayAnim Anim = CrouchTurnLeft NoRestart Blendperiod = 0.4
            if AnimFinished
              PlayAnim Anim = CrouchTurnLeftIdle Cycle NoRestart Blendperiod = 0.4
            endif
          endif
        endif
      else
        if Flipped
          if AnimEquals TurnRightIdle
          else
            PlayAnim Anim = TurnRight NoRestart Blendperiod = 0.4
            if AnimFinished
              PlayAnim Anim = TurnRightIdle Cycle NoRestart Blendperiod = 0.4
            endif
          endif
        else
          if AnimEquals TurnLeftIdle
          else
            PlayAnim Anim = TurnLeft NoRestart Blendperiod = 0.4
            if AnimFinished
              PlayAnim Anim = TurnLeftIdle Cycle NoRestart Blendperiod = 0.4
            endif
          endif
        endif
      endif
    else
      if RightPressed
        if Crouched
          if Flipped
            if AnimEquals CrouchTurnLeftIdle
            else
              PlayAnim Anim = CrouchTurnLeft NoRestart Blendperiod = 0.4
              if AnimFinished
                PlayAnim Anim = CrouchTurnLeftIdle Cycle NoRestart Blendperiod = 0.4
              endif
            endif
          else
            if AnimEquals CrouchTurnRightIdle
            else
              PlayAnim Anim = CrouchTurnRight NoRestart Blendperiod = 0.4
              if AnimFinished
                PlayAnim Anim = CrouchTurnRightIdle Cycle NoRestart Blendperiod = 0.4
              endif
            endif
          endif
        else
          if Flipped
            if AnimEquals TurnLeftIdle
            else
              PlayAnim Anim = TurnLeft NoRestart Blendperiod = 0.4
              if AnimFinished
                PlayAnim Anim = TurnLeftIdle Cycle NoRestart Blendperiod = 0.4
              endif
            endif
          else
            if AnimEquals TurnRightIdle
            else
              PlayAnim Anim = TurnRight NoRestart Blendperiod = 0.4
              if AnimFinished
                PlayAnim Anim = TurnRightIdle Cycle NoRestart Blendperiod = 0.4
              endif
            endif
          endif
        endif
      else
        if Crouched
          DoCrouch_slope Slope = <Slope> ChangeInSlope = <ChangeInSlope>
        else
          if Braking
            if SpeedLessThan 1
              PlayBrakeAnim
              if HeldLongerThan Button = down 2 second
                goto HandBrake
              endif
            else
              if HeldLongerThan Button = down 0.2 second
                CessBrake
              else
                PlayBrakeAnim
              endif
            endif
          else
            if ( <Slope> > PUSH_IF_SLOPE )
              if AutoKickIsOff
                if ShouldMongo
                  PlayAnim Anim = MongoPush NoRestart Blendperiod = 0.4
                  waitanimfinished
                  PlayAnim Anim = MongoPushCycle NoRestart Blendperiod = 0.4
                  waitanimfinished
                  PlayAnim Anim = Idle Cycle NoRestart Blendperiod = 0.4
                else
                  PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart Blendperiod = 0.4
                  waitanimfinished
                  PlayAnim Anim = Idle Cycle NoRestart Blendperiod = 0.4
                endif
              else
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart Blendperiod = 0.4
                  else
                    PlayAnim Anim = MongoPush NoRestart
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart Blendperiod = 0.4
                  endif
                else
                  just_coasting
                endif
              endif
            else
              if AutoKickIsOff
                if held square
                  if ShouldMongo
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart Blendperiod = 0.4
                  else
                    PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart Blendperiod = 0.4
                    waitanimfinished
                    PlayAnim Anim = Idle Cycle NoRestart Blendperiod = 0.4
                  endif
                else
                  if AnimEquals [ PushCycle MongoPushCycle MongoPush ]
                  else
                    PlayAnim Anim = Idle Cycle NoRestart Blendperiod = 0.4
                  endif
                endif
              else
                just_coasting
              endif
            endif
          endif
        endif
      endif
    endif
  Blendperiod = 0.4
    DoNextTrick
    DoNextManualTrick
    waitonegameframe
    if InNetgame
      CheckforNetBrake
    endif
  repeat
endscript
crouch_wobble_params = {
  WobbleAmpA = { (10.1, 10.1) STATS_RAILBALANCE }
  WobbleAmpB = { (10.1, 10.1) STATS_RAILBALANCE }
  WobbleK1 = { (20, 20) STATS_RAILBALANCE }
  WobbleK2 = { (10, 10) STATS_RAILBALANCE }
  SpazFactor = { (1, 1) STATS_RAILBALANCE }
}
script DoCrouch_slope
  if ( ( <ChangeInSlope> > 5 ) or ( <ChangeInSlope> < -5 ) )
    if AnimEquals [ CrouchBumpUp CrouchBumpDown ]
      if AnimFinished
        if ( <ChangeInSlope> > 5 )
          PlayAnim Anim = CrouchBumpUp Blendperiod = 0.3
        else
          PlayAnim Anim = CrouchBumpDown Blendperiod = 0.3
        endif
      endif
    else
      if ( <ChangeInSlope> > 5 )
        PlayAnim Anim = CrouchBumpUp Blendperiod = 0.3
      else
        PlayAnim Anim = CrouchBumpDown Blendperiod = 0.3
      endif
    endif
  else
    if not AnimEquals [ CrouchIdle CrouchIdle2 CrouchIdle3 CrouchBumpUp CrouchBumpDown ]
      CrouchFrameFrom = randomrange(1, 40)
      CrouchFrameTo = <CrouchFrameFrom>
      CrouchFrameFrom = ( <CrouchFrameFrom> -8 )
      if ( <CrouchFrameFrom> < 1 )
        CrouchFrameFrom = 1
      endif
      CrouchFrameTo = ( <CrouchFrameTo> + 8 )
      if ( <CrouchFrameTo> > 40 )
        CrouchFrameTo = 40
      endif
      PlayAnim random( @Anim = CrouchIdle @Anim = CrouchIdle2 @Anim = CrouchIdle3  ) Cycle Blendperiod = 0.4
    else
      if AnimFinished
        PlayAnim Anim = CrouchIdle Blendperiod = 0.4
      endif
    endif
  endif
endscript
SLOPE_CUTOFF = 40
script DoCrouch_Slope_old
  if not GotParam Slope
    Slope = 0
  endif
  if ( <Slope> > SLOPE_CUTOFF )
     <Slope> = SLOPE_CUTOFF
  endif
  if ( <Slope> < ( 0 - SLOPE_CUTOFF ) )
     <Slope> = ( 0 - SLOPE_CUTOFF )
  endif
  CrouchFrame = ( 1 + ( SLOPE_CUTOFF -1 ) * ( ( SLOPE_CUTOFF - <Slope> ) / ( 2 * SLOPE_CUTOFF ) ) )
  if not GotParam CrouchFrame
  endif
  printf "CrouchFrame=%g" g = <CrouchFrame>
  PlayAnim Anim = CrouchLean_Range From = <CrouchFrame> To = ( <CrouchFrame> + 1 )
endscript
PUSH_IF_SLOPE = 2
script just_coasting
  GetSlope
  if ( <Slope> > PUSH_IF_SLOPE )
    if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 ]
      if AnimFinished
        DoAPush
      endif
    else
      PlayAnim Anim = Idle NoRestart Blendperiod = 0.4
    endif
  else
    if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 MongoPushCycle ]
      if AnimFinished
        RandomPush = randomrange(1, 2)
        if ( <RandomPush> < 2 )
          DoAPush
        else
          PlayAnim Anim = Idle NoRestart Blendperiod = 0.4
        endif
      endif
    else
      if AnimEquals Idle
        if AnimFinished
          RandomPush = randomrange(1, 3)
          if ( <RandomPush> < 2 )
            DoAPush
          else
            PlayAnim Anim = Idle Blendperiod = 0.4
          endif
        endif
      else
        PlayAnim Anim = Idle NoRestart Blendperiod = 0.4
      endif
    endif
  endif
endscript
script DoAPush
  if AnimEquals [ PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5 MongoPushCycle ]
    if AnimFinished
      if not ShouldMongo
        PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart Blendperiod = 0.4
      else
        PlayAnim Anim = MongoPushCycle NoRestart Blendperiod = 0.4
      endif
    endif
  else
    if not ShouldMongo
      PlayAnim random( @Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5  ) NoRestart Blendperiod = 0.3
    else
      PlayAnim Anim = MongoPushCycle NoRestart Blendperiod = 0.4
    endif
  endif
endscript
script CheckforNetBrake
  if InNetgame
    GetPreferenceChecksum pref_type = network auto_brake
    if ( <checksum> = boolean_true )
      if ScreenElementExists id = current_menu_anchor
        goto NetBrake
      endif
      if ScreenElementExists id = dialog_box_anchor
        goto NetBrake
      endif
      if ScreenElementExists id = controller_unplugged_dialog_anchor
        goto NetBrake
      endif
    endif
  endif
endscript
script PlayBrakeAnim
  if ShouldMongo
    PlayAnim Anim = SlowDownBrake_Mongo NoRestart
  else
    PlayAnim Anim = SlowDownBrake NoRestart
  endif
endscript
script CessBrake
  ClearEventBuffer
  if SpeedGreaterThan 300
    PlayAnim Anim = CessSlide180_FS From = Start To = 28 Speed = 1.2 Blendperiod = 0.2
    WaitAnim frame 5
    PlayCessSound
    WaitAnim frame 25
    PlayAnim Anim = CessSlide180_FS From = 27 To = Start Speed = 1.2 Blendperiod = 0.2
    waitanimfinished
  endif
  PlayBrakeAnim
endscript
script SlalomBrake
  BigBrake
endscript
script BigBrake
  ClearExceptions
  DisablePlayerInput
  WaitOnGround
  SetRollingFriction 20
  StopSkitch
  StopBalanceTrick
  CessBrake
  wait 1 second
  goto SkaterInit
endscript
script NetBrake
  if InBail
    SkaterInit ReturnControl NoAnims
  endif
  StopBalanceTrick
  SetRollingFriction 20
  OnExceptionRun NetBrake_out
  CessBrake
  begin
    if SpeedLessThan 5
      HandBrake
      if ShouldMongo
        PlayAnim Anim = MongoBrakeIdle Cycle NoRestart
      else
        PlayAnim Anim = BrakeIdle Cycle NoRestart
      endif
    endif
    if ObjectExists id = current_menu_anchor
      waitonegameframe
    else
      if ObjectExists id = dialog_box_anchor
        waitonegameframe
      else
        if ObjectExists id = controller_unplugged_dialog_anchor
          waitonegameframe
        else
          break
        endif
      endif
    endif
  repeat
  SetRollingFriction #"default"
  if SpeedLessThan 5
    goto HandBrake
  else
    if InNollie
      goto OnGroundNollieAI
    else
      goto OnGroundAI
    endif
  endif
endscript
script NetBrake_out
  SetRollingFriction #"default"
endscript
script HandBrake
  ClearEventBuffer
  OnExceptionRun BrakeDone
  SetRollingFriction 100
  if ShouldMongo
    PlayAnim Anim = NewBrake_Mongo
  else
    PlayAnim Anim = NewBrake
  endif
  begin
    DoNextTrick
    if AnimFinished
      break
    endif
    if Crouched
      break
    endif
    wait 1 game frame
  repeat
  if ShouldMongo
    flip
    BlendperiodOut 0
  endif
  begin
    if AutoKickIsOff
      if held square
        waitonegameframe
        break
      endif
    else
      if held up
        break
      endif
      if Crouched
        break
      endif
    endif
    if RightPressed
      if Flipped
        PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
      else
        PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
      endif
    else
      if LeftPressed
        if Flipped
          PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
        else
          PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
        endif
      else
        if AnimEquals [ NewBrakeIdle NewBrakeIdle2 NewBrakeIdle3 NewBrakeIdle4 NewBrakeIdle5 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8 ]
          if AnimFinished
            PlayBrakeIdle
          endif
        else
          PlayBrakeIdle
        endif
      endif
    endif
    waitonegameframe
    DoNextTrick
    DoNextManualTrick
  repeat
  PlayAnim Anim = NewBrakeIdleToIdle
  wait 0.25 seconds
  SetRollingFriction #"default"
  waitanimwhilstchecking
  if InNollie
    goto OnGroundNollieAI
  else
    goto OnGroundAI
  endif
endscript
script PlayBrakeIdle
  PlayAnim randomnorepeat( @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle2
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle3
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle4
  @Anim = NewBrakeIdle5
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle6
  @Anim = NewBrakeIdle7
  @Anim = NewBrakeIdle8
  @Anim = NewBrakeIdle
  @Anim = NewBrakeIdle ) 
endscript
script BrakeDone
  SetRollingFriction #"default"
endscript
script OnGroundNollieAI
  setstate ground
  EnablePlayerInput
  ClearExceptions
  OnGroundExceptions
  SetException Ex = Ollied Scr = Nollie
  SetQueueTricks Jumptricks GroundTricks
  SetManualTricks special = SpecialManualTricks GroundManualTricks
  NollieOn
  begin
    if LeftPressed
      if Crouched
        if Flipped
          PlayAnim Anim = NollieCrouchTurnRight NoRestart Blendperiod = 0.04
        else
          PlayAnim Anim = NollieCrouchTurnLeft NoRestart
        endif
      else
        if Flipped
          PlayAnim Anim = NollieSkatingTurnRight NoRestart Blendperiod = 0.04
        else
          PlayAnim Anim = NollieSkatingTurnLeft NoRestart Blendperiod = 0.04
        endif
      endif
    else
      if RightPressed
        if Crouched
          if Flipped
            PlayAnim Anim = NollieCrouchTurnLeft NoRestart Blendperiod = 0.04
          else
            PlayAnim Anim = NollieCrouchTurnRight NoRestart Blendperiod = 0.04
          endif
        else
          if Flipped
            PlayAnim Anim = NollieSkatingTurnLeft NoRestart Blendperiod = 0.04
          else
            PlayAnim Anim = NollieSkatingTurnRight NoRestart Blendperiod = 0.04
          endif
        endif
      else
        if Crouched
          PlayAnim Anim = NollieCrouchIdle Cycle NoRestart Blendperiod = 0.04
        else
          if Braking
            if SpeedLessThan 1
              PlayAnim Anim = NollieSkatingIdle NoRestart Blendperiod = 0.04
              if HeldLongerThan Button = down 2 second
                goto HandBrake
              endif
            else
              if HeldLongerThan Button = down 0.2 second
                CessBrake
              else
                PlayBrakeAnim
              endif
            endif
          else
            if CanKick
              if AutoKickIsOff
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle NoRestart Blendperiod = 0.04
                  else
                    PlayAnim Anim = MongoPush NoRestart Blendperiod = 0.04
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle NoRestart Blendperiod = 0.04
                  endif
                else
                  PlayAnim Anim = PushCycle NoRestart Blendperiod = 0.04
                endif
              else
                if ShouldMongo
                  if AnimEquals MongoPushCycle
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart Blendperiod = 0.04
                  else
                    PlayAnim Anim = MongoPush NoRestart
                    waitanimfinished
                    PlayAnim Anim = MongoPushCycle Cycle NoRestart Blendperiod = 0.04
                  endif
                else
                  PlayAnim Anim = PushCycle Cycle NoRestart Blendperiod = 0.04
                endif
              endif
            else
              if AnimFinished
                PlayAnim Anim = NollieSkatingIdle Cycle NoRestart Blendperiod = 0.04
              endif
            endif
          endif
        endif
      endif
    endif
    DoNextTrick
    DoNextManualTrick
    CheckforNetBrake
    waitonegameframe
  repeat
endscript
script FlailExceptions
  NollieOff
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  SetException Ex = RunHasEnded Scr = EndOfRun
  SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
  ClearTrickQueue
  ClearManualTrick
  ClearEventBuffer
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  SpawnClothingLandScript
endscript
script FlailHitWall
  goto FlailLeft
endscript
script FlailLeft
  FlailExceptions
  FlailVibrate
  if Crouched
    if SpeedGreaterThan 400
      PlayAnim random( @Anim = FlaiLleftCrouched @Anim = FlailLeftCrouched2  ) Blendperiod = 0.04
    else
      PlayAnim Anim = FlailLeftCrouched_small Blendperiod = 0.04
    endif
  else
    PlayAnim random( @Anim = FlailLeft @Anim = FlailLeft2  ) Blendperiod = 0.04
  endif
  waitanimfinished
  goto OnGroundAI
endscript
script FlailRight
  FlailExceptions
  FlailVibrate
  if Crouched
    if SpeedGreaterThan 400
      PlayAnim random( @Anim = FlailRightCrouched @Anim = FlailLeftCrouched2  ) Blendperiod = 0.04
    else
      PlayAnim Anim = FlailRightCrouched_small Blendperiod = 0.03
    endif
  else
    PlayAnim random( @Anim = FlailRight @Anim = FlailRight2  ) Blendperiod = 0.04
  endif
  waitanimfinished
  goto OnGroundAI
endscript
script FlailVibrate
  if SpeedGreaterThan 600
    Vibrate Actuator = 1 Percent = 80 Duration = 0.25
  else
    Vibrate Actuator = 1 Percent = 50 Duration = 0.15
  endif
endscript
script GroundGone
  InAirExceptions
  SetException Ex = Ollied Scr = Ollie
  ClearTricksFrom GroundTricks
  if GotParam NoBoneless
    SetQueueTricks special = SpecialTricks AirTricks
  else
    SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0
  endif
  if Crouched
    PlayAnim Anim = Crouch2InAir
  else
    PlayAnim Anim = Idle2InAir
  endif
  begin
    if AirTimeGreaterThan Skater_Late_Jump_Slop
      ClearException Ollied
      SetQueueTricks special = SpecialTricks AirTricks
    endif
    DoNextTrick
    if GotParam AndManuals
      DoNextManualTrick
    endif
    if AnimFinished
      break
    endif
    waitonegameframe
  repeat
  goto Airborne
endscript
AirAnimParams = { Hold Blendperiod = 0.3 NoRestart }
script Airborne stretchtime = 1 Blendperiod = 0.3
  if Obj_FlagSet FLAG_SKATER_INLOOP
    goto LoopGapStart
  endif
  InAirExceptions
  begin
    DoNextTrick
    GetAirTimeLeft
    if ( <AirTimeLeft> < 0.2 )
      PlayAnim Anim = StretchLegsInit Blendperiod = <Blendperiod> NoRestart
      break
    else
      if LeftPressed
        if Flipped
          PlayAnim Anim = AirTurnRight AirAnimParams
        else
          PlayAnim Anim = AirTurnLeft AirAnimParams
        endif
      else
        if RightPressed
          if Flipped
            PlayAnim Anim = AirTurnLeft AirAnimParams
          else
            PlayAnim Anim = AirTurnRight AirAnimParams
          endif
        else
          if held R2
            PlayAnim Anim = SpineTransfer Blendperiod = 0.3 NoRestart
          else
            if held L2
              PlayAnim Anim = SpineTransfer Blendperiod = 0.3 NoRestart
            else
              PlayAnim Anim = AirIdle Cycle Blendperiod = <Blendperiod> NoRestart
            endif
          endif
        endif
      endif
    endif
    waitonegameframe
  repeat
  waitanimwhilstchecking
  begin
    DoNextTrick
    waitonegameframe
  repeat
endscript
script Land
  SetSkaterCamLerpReductionTimer time = 0
  if AbsolutePitchGreaterThan 60
    if PitchGreaterThan 60
      goto PitchBail
    endif
  endif
  if SpeedGreaterThan 500
    if YawBetween (60, 120)
      goto YawBail
    endif
  endif
  if RollGreaterThan 50
    goto DoingTrickBail
  endif
  if DoingTrick
    printf "DOING A TRICK"
    goto DoingTrickBail
  endif
  if GotParam NoBlend
    BlendperiodOut 0
  endif
  if GotParam ReturnBacktoLipLand
  else
    if GotParam IgnoreAirTime
      goto Land2
    else
      if AirTimeLessThan 0.2 seconds
        goto Land2 Params = { LittleAir }
      else
        GotoPreserveParams Land2
      endif
    endif
  endif
endscript
script Land2 RevertTime = 5
  DoPerfectCheck
  AllowRailTricks
  NollieOff
  ClearLipCombos
  if LandedFromVert
    OverrideCancelGround
    Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
    SetExtraTricks tricks = Reverts Duration = <RevertTime>
  else
    if backwards
      FlipAndRotate
    endif
    DoNextManualTrick FromAir
  endif
  Vibrate Actuator = 1 Percent = 80 Duration = 0.1
  GetAirtime
  SpawnClothingLandScript
  if Crouched
    if GotParam LittleAir
      PlayAnim Anim = CrouchBumpDown
    else
      if backwards
        FlipAndRotate
        PlayAnim randomnorepeat( @Anim = CrouchedLandTurn @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3 @Anim = StretchLegsLand  ) Blendperiod = 0
        BoardRotate
      else
        if YawBetween (45, 60)
          if AirTimeGreaterThan 0.75 second
            PlayAnim random( @Anim = SketchyCrouchLand @Anim = SketchyLand1  ) Blendperiod = 0.1
            if InSplitScreenGame
            else
              LaunchPanelMessage "&C1Sketchy" properties = panelcombo
            endif
          else
            PlayLandAnim
          endif
        else
          PlayLandAnim
        endif
      endif
    endif
  else
    if GotParam LittleAir
      PlayAnim Anim = IdleBump
    else
      if backwards
        FlipAndRotate
        PlayAnim random( @Anim = CrouchedLandTurn @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3  ) Blendperiod = 0
        BoardRotate
      else
        if YawBetween (45, 60)
          if AirTimeGreaterThan 0.5 second
            PlayAnim random( @Anim = SketchyLand @Anim = SketchyLand1  ) Blendperiod = 0.1
            if InSplitScreenGame
            else
              LaunchPanelMessage "&C1Sketchy" properties = panelcombo
            endif
          else
            PlayLandAnim
          endif
        else
          PlayLandAnim
        endif
      endif
    endif
  endif
  ClearTrickQueue
  ClearEventBuffer buttons = [ X ]
  SetManualTricks special = SpecialManualTricks ManualTricks
  OnGroundExceptions_NoEndRun
  OnExceptionRun Landout
  if GotParam NoReverts
  else
    if LandedFromVert
      ResetLandedFromVert
      begin
        wait 1
      repeat <RevertTime>
    else
      begin
        DoNextManualTrick FromAir
        wait 1
      repeat 10
    endif
  endif
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  OverrideCancelGround Off
  ResetSpin
  ClearManualTrick
  Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
  OnGroundExceptions
  CheckforNetBrake
  waitanimwhilstchecking AndManuals
  goto OnGroundAI
endscript
script PlayLandAnim
  if AirTimeLessThan 0.5 seconds
    PlayAnim Anim = CrouchBumpDown
  else
    if AirTimeLessThan 0.75 seconds
      PlayAnim randomnorepeat( @Anim = CrouchedLand1_small @Anim = CrouchedLand2_small @Anim = CrouchedLand3_small  ) Blendperiod = 0.1
    else
      PlayAnim randomnorepeat( @Anim = CrouchedLand @Anim = CrouchedLand1 @Anim = CrouchedLand2 @Anim = CrouchedLand3 @Anim = StretchLegsLand  ) Blendperiod = 0.1
    endif
  endif
endscript
script Landout
  if ExceptionTriggered RunHasEnded
    SetSpeed 0
    setstate ground
    ClearExceptions
    SetException Ex = RunHasEnded Scr = EndOfRun
  else
    if ExceptionTriggered GoalHasEnded
      ClearExceptions
      SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
    else
      OnGroundExceptions_NoClear
    endif
  endif
  CheckGapTricks
  ClearGapTricks NotInSameFrame
  ClearPanel_Landed
  ClearManualTrick
  OverrideCancelGround Off
endscript
script DoPerfectCheck
  if SkaterCurrentScorePotGreaterThan 1
    if YawBetween (0, 5)
      AwardPerfect
    endif
    if YawBetween (175, 180)
      AwardPerfect
    endif
    if YawBetween (45, 60)
      AwardSloppy
    endif
    if YawBetween (120, 135)
      AwardSloppy
    endif
  endif
endscript
script AwardPerfect
  GetSpin
  if ( <spin> > 359.0 )
    if not InSplitScreenGame
      Create_Panel_Message text = "Perfect Landing!" id = perfect rgba = [ 50 150 50 128 ] pos = (110, 340) style = perfect_style
      Create_Panel_Message text = "+1000 Points" id = perfect2 rgba = [ 40 140 40 100 ] pos = (110, 360) style = perfect_style
    else
      PerfectSloppy_2p text = "Perfect!" rgb = [ 50 150 50 128 ]
    endif
    SetTrickName ''
    SetTrickScore 1000
    Display Blockspin NoDegrade
    Obj_SpawnScript PlayPerfectSound Params = { sound = ExtraTrick wait = 0.2 pitch = 80 }
  endif
endscript
script AwardSloppy
  if CurrentScorePotGreaterThan 750
    GetSpin
    if ( <spin> > 359.0 )
      if not InSplitScreenGame
        Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [ 200 50 50 128 ] pos = (110, 340) style = sloppy_style
        Create_Panel_Message text = "-500 Points" id = perfect2 rgba = [ 107 51 27 100 ] pos = (110, 360) style = sloppy_style
      else
        PerfectSloppy_2p text = "Sloppy!" rgb = [ 200 50 50 128 ]
      endif
      SetTrickName ''
      SetTrickScore -500
      Display Blockspin NoDegrade
      Obj_SpawnScript PlayPerfectSound Params = { sound = HUDtrickslopC pitch = 150 wait = 0.12 }
    endif
  endif
endscript
script PlayPerfectSound
  wait <wait> seconds
  Playsound <sound> pitch = <pitch>
endscript
script PerfectSloppy_2p
  ScriptGetScreenMode
  GetSkaterNumber
  switch <screen_mode>
  case split_vertical
    switch <skaternumber>
    case 0
      Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70, 340) style = perfect_style
    case 1
      Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (370, 340) style = perfect_style
    endswitch
  case split_horizontal
    switch <skaternumber>
    case 0
      Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70, 154) style = perfect_style
    case 1
      Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (70, 375) style = perfect_style
    endswitch
  endswitch
endscript
script perfect_style
  DoMorph time = 0 scale = (0, 0)
  DoMorph time = 0.1 scale = (0.95, 0.95)
  DoMorph time = 0.1 scale = (0.75, 0.75)
  DoMorph time = 0.1 scale = (0.8, 0.8)
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 1.2 alpha = 0
  die
endscript
script sloppy_style
  DoMorph time = 0 scale = (0, 0)
  DoMorph time = 0.1 scale = (0.8, 0.8)
  DoMorph time = 0.02 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.03 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.04 alpha = 0
  DoMorph time = 0.05 alpha = 1
  DoMorph time = 0.05 alpha = 0
  DoMorph time = 0.02 alpha = 1
  DoMorph time = 1 alpha = 0
  die
endscript
script WaitOnGround
  begin
    if OnGround
      break
    endif
    waitonegameframe
  repeat
endscript
script VibrateOff
  Vibrate Off
endscript
script EndOfRun
  EndOfRunStarted
  printf "EndOfRun called"
  setstate ground
  CleanUpSpecialItems
  StopBalanceTrick
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  ClearExceptions
  ClearTrickQueues
  ClearEventBuffer
  SetTags state = skater_endofrun
  if not GotParam NoBrake
    DisablePlayerInput AllowCameraControl
    SetException Ex = SkaterCollideBail Scr = EndBail
    SetException Ex = LostGame Scr = LostGame
    WaitOnGround
    SetRollingFriction 19
    wait 10 frames
    WaitOnGround
    if SpeedGreaterThan 400
      PlayCessSound
      PlayAnim Anim = CessSlide180_FS
      WaitAnim 50 Percent
      PlayAnim Anim = CessSlide180_FS From = Current To = 0
      waitanimfinished
    else
      PlayAnim Anim = brake
      waitanimfinished
    endif
    PlayAnim Anim = BrakeIdle Blendperiod = 0.3 Cycle
    begin
      if SpeedLessThan 40
        if OnGround
          break
        endif
      endif
      waitonegameframe
    repeat
    if InNetgame
      SetException Ex = WonGame Scr = WonGame
      SetException Ex = LostGame Scr = LostGame
    endif
    wait 1 seconds
    if not GotParam FromTaxiGuy
      if IsCareerMode
      endif
    endif
  endif
  FireEvent type = EndofRunDone
  if not GotParam FromTaxiGuy
    EndofRunDone
  endif
  wait 1 seconds
  if InNetgame
    if GameIsOver
    else
      if GameModeEquals is_king
      else
        if not GotParam FromTaxiGuy
          if not GameModeEquals is_goal_attack
            Create_Panel_Message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss
          endif
        endif
      endif
    endif
  endif
endscript
script Goal_EndOfRun
  Goal_EndOfRunStarted
  printf "Goal_EndOfRun called"
  setstate ground
  CleanUpSpecialItems
  StopBalanceTrick
  CheckGapTricks
  ClearGapTricks
  ClearPanel_Landed
  ClearExceptions
  ClearTrickQueues
  ClearEventBuffer
  FireEvent type = EndofRunDone
  if not GotParam FromTaxiGuy
    Goal_EndOfRunDone
  endif
  if InNetgame
    if GameIsOver
    else
      if GameModeEquals is_king
      else
        if not GotParam FromTaxiGuy
          if not GameModeEquals is_goal_attack
            Create_Panel_Message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss
          endif
        endif
      endif
    endif
  endif
  goto OnGroundAI
endscript
script ForceEndOfRun
  VibrateOff
  MakeSkaterGoto EndOfRun
endscript
script SkaterCollide_AtEndRun
endscript
script WonGame
  PlayAnim random( @Anim = Prop @Anim = Cheer1  ) Blendperiod = 0.3
  EndofRunDone
  waitanimfinished
  if ShouldMongo
    PlayAnim Anim = MongoBrakeIdle Cycle
  else
    PlayAnim Anim = BrakeIdle Cycle
  endif
endscript
script LostGame
  PlayAnim Anim = BrakeDefeat
  waitanimfinished
  EndofRunDone
  if ShouldMongo
    PlayAnim Anim = MongoBrakeIdle Cycle
  else
    PlayAnim Anim = BrakeIdle Cycle
  endif
  waitanimfinished
endscript
script EndBail
  EndofRunDone
  ClearExceptions
  InBail
  TurnToFaceVelocity
  VibrateOff
  Playsound random( @BoardBail01 @BoardBail02 ) 
  PlayAnim Anim = SlipForwards NoRestart Blendperiod = 0.3
  wait 10 frames
  SwitchOffBoard
  wait 10 frame
  Playsound random( @HitBody03 @HitBody04 ) 
  wait 10 frames
  SetRollingFriction 18
  Vibrate Actuator = 1 Percent = 100 Duration = 0.2
  if not GetGlobalFlag flag = BLOOD_OFF
    Obj_SpawnScript BloodSmall
  endif
  WaitAnim 25 Percent fromend
  Playsound FoleyMove01 vol = 50
  waitanimfinished
  Obj_SpawnScript BloodPool
  PlayAnim Anim = GetUpForwards Blendperiod = 0.1
  SetRollingFriction 20
  wait 50 frames
  SwitchOnBoard
  BoardRotate normal
  waitanimfinished
  NotifyBailDone
  NotInBail
  goto EndOfRun
endscript
script EndOfRunTimeOut
  EndofRunDone
endscript
script CarPlant
  ClearExceptions
  InAirExceptions
  ClearException CarPlant
  Playsound GrindMetalOn random( @pitch = 80 @pitch = 90 @pitch = 85 ) 
  Obj_SpawnScript CarSparks
  DoCarPlantBoost
  SetTrickName "Car Plant"
  SetTrickScore 400
  Display
  if DoingTrick
  else
    PlayAnim Anim = Beanplant Blendperiod = 0.3
    waitanimwhilstchecking
    goto Airborne
  endif
endscript
script CarSparks
  SparksOn
  wait 0.333 seconds
  SetException Ex = CarPlant Scr = CarPlant
  wait 3 seconds
  SparksOff
endscript
script FreezeSkater
  SwitchOnBoard
  ClearExceptions
  SetQueueTricks NoTricks
  DisablePlayerInput
  SetRollingFriction 10000
  PlayAnim Anim = StandIdle Cycle
endscript
script CarBail
  InBail
  Obj_SpawnScript BloodCar
  Playsound HitDumpsterX
  Playsound HitVehicle3
  goto NoseManualBail
endscript
script FlailingFall
  InBail
  ClearExceptions
  SetQueueTricks NoTricks
  DisablePlayerInput AllowCameraControl
  PlayAnim Anim = StretchtoFlailingFall Blendperiod = 0.3
  ClearGapTricks
  ClearPanel_Bailed
  WaitAnim 90 Percent
  SwitchOffBoard
  waitanimfinished
  PlayAnim Anim = FlailingFall Cycle
endscript
script DropIn DropInAnim = DropIn
  if GameModeEquals is_horse
    ResetLookAround
    GetCurrentSkaterID
    if not IsCurrentHorseSkater <objId>
      return
    endif
  endif
  SetTags state = skater_dropin
  ResetSkaterParticleSystems
  PausePhysics
  RestartSkaterExceptions
  SetSkaterCamOverride heading = 0 tilt = -0.75 time = 0.0 zoom = 5
  SetRollingFriction 10000
  DisablePlayerInput
  PlayAnim Anim = <DropInAnim> Blendperiod = 0.0
  WaitAnim 60 Percent
  ClearSkaterCamOverride
  WaitAnim 85 Percent
  UnpausePhysics
  setstate ground
  SetTags state = skater_onground
  SetRollingFriction 0
  waitanimfinished
  EnablePlayerInput
  OnGroundExceptions
  waitonegameframe
  SetLandedFromVert
  goto Land
endscript
script ZoomIn
  Skater:SetSkaterCamOverride heading = 0 time = 0.00001 zoom = 1.04
endscript
script ZoomOut
  Skater:ClearSkaterCamOverride
endscript
script StartSkating1
  RestartSkaterExceptions
  SetRollingFriction #"default"
  DisablePlayerInput AllowCameraControl
  if ProfileEquals is_named = mullen
    SetRollingFriction 10000
    PlayAnim Anim = MullenStart Blendperiod = 0.0
    WaitAnim 40 Percent
    Playsound boneless09 pitch = 110
    PlayBonkSound
    BlendperiodOut 0
    WaitAnim 60 Percent
    SetRollingFriction #"default"
  else
    if not Flipped
      flip
    endif
    if AutoKickIsOff
      if ShouldMongo
        PlayAnim Anim = MongoBrakeIdle
      else
        PlayAnim Anim = BrakeIdle
      endif
    else
      PlayAnim Anim = StartSkating1 Blendperiod = 0.0
      WaitAnim 75 Percent
    endif
  endif
  ClearSkaterCamOverride
  EnablePlayerInput
  OnGroundExceptions
  waitanimfinished
  goto OnGroundAI
endscript
script PedProps name = "Ped Props" score = 500
  if InSplitScreenGame
  else
    LaunchPanelMessage "Spectator Bonus" properties = Panelcombo2
  endif
  Playsound PedProps vol = 500
  SetTrickName <name>
  SetTrickScore <score>
  Display Blockspin
  waitonegameframe
  if OnGround
    if DoingTrick
    else
      CheckGapTricks
      ClearGapTricks
      ClearPanel_Landed
    endif
  endif
endscript
script RestartSkaterExceptions
  AllowRailTricks
  BoardRotate normal
  ClearExceptions
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  ClearTrickQueue
  SetQueueTricks NoTricks
  ClearManualTrick
  ClearEventBuffer
  SwitchOnBoard
  Obj_Attachframe bone = "head"
endscript
script LaunchSpecialMessage text = "Special Trick" vol = 100 pitch = 100
  if InMultiplayergame
    Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
  else
    if ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS )
      if GotParam Cool
        SetSlomo 0.6
        pulse_blur Start = 0 end = 150 Speed = 10
        Playsound HUD_specialtrickAA vol = 200 pitch = 75
        OnExceptionRun KillSpecial
      else
        Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
      endif
    else
      Playsound HUD_specialtrickAA vol = <vol> pitch = <pitch>
    endif
  endif
endscript
script EndSpecial
  if ( GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS )
    pulse_blur Start = 150 end = 0 time = 10
    SetSlomo 1
  endif
endscript
script KillSpecial
  kill_blur
  SetSlomo 1
endscript
script LaunchExtraMessage text = "Hidden Combo!"
  Playsound ExtraTrick vol = 100
endscript
script PedKnockDown
  if ObjectExists id = speech_box_anchor
    DestroyScreenElement id = speech_box_anchor
  endif
  if ObjectExists id = goal_start_dialog
    DestroyScreenElement id = goal_start_dialog
  endif
  Obj_SpawnScript BloodSmall
  SetRollingFriction 0
  StopBalanceTrick
  if OnLip
    StopBalanceTrick
    setstate Air
    Move z = 1
    Move y = 1
  endif
  if GotParam #"Jump"
    SetSpeed -150
    wait 1 game frame
    #"Jump"
    FlipAndRotate
    GotoRandomScript [ Faceplant Facesmash NoseManualBail ManualBail Hipper TailslideOut ]
  endif
  if backwards
    GotoRandomScript [ BackwardFaceSlam Shoulders ]
  else
    if Onrail
      goto FiftyFiftyFall
    else
      GotoRandomScript [ Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut ]
    endif
  endif
endscript
script SkaterPushPed
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  Playsound bitchslap2
  if AnimEquals [ CrouchIdle SkateIdle Land MongoPushCycle PushCycle ]
    goto FlailHitWall
  endif
  if AnimEquals [ runout runoutquick Smackwallupright ]
    goto Bailsmack Params = { SmackAnim = Smackwallupright }
  endif
  if InAir
    goto Airborne
  else
    if IsInBail
      if AnimEquals [ Smackwallfeet NutterFallBackward FiftyFiftyFallBackward BackwardsTest BackwardFaceSlam Smackwallfeet SlipBackwards ]
        goto Bailsmack Params = { SmackAnim = Smackwallfeet }
      else
        goto Bailsmack Params = { <...> }
      endif
    endif
    goto OnGroundAI
  endif
endscript
script SkaterAvoidGoalPed
  if GotParam heading
    Rotate y = <heading>
  endif
  if not SpeedGreaterThan 100
    SetSpeed <Speed>
  endif
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  Playsound bitchslap2
  goto FlailHitWall
endscript
script SkaterBreakGlass
  SetException Ex = CarBail Scr = CarBail
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  FlailVibrate
  NollieOff
  StopBalanceTrick
  if AnimEquals [ CrouchIdle SkateIdle Land MongoPushCycle PushCycle ]
    goto FlailHitWall
  endif
  if AnimEquals [ runout runoutquick Smackwallupright ]
    goto Bailsmack Params = { SmackAnim = Smackwallupright }
  endif
  if InAir
    goto Airborne
  else
    if IsInBail
      if AnimEquals [ Smackwallfeet NutterFallBackward FiftyFiftyFallBackward BackwardsTest BackwardFaceSlam Smackwallfeet SlipBackwards ]
        goto Bailsmack Params = { SmackAnim = Smackwallfeet }
      else
        goto Bailsmack Params = { <...> }
      endif
    endif
    goto OnGroundAI
  endif
endscript
TRANSFER_POINTS = 250
script SkaterAwardTransfer
  SetTrickName 'Spine Transfer'
  SetTrickScore TRANSFER_POINTS
  Display NoDegrade
  if not DoingTrick
    GetTags
    if ( <racemode> = none )
      setstate Air
      InAirExceptions
      PlayAnim Anim = SpineTransfer Blendperiod = 0.3
    endif
  endif
endscript
script PlayAnim_InLoop
  if AnimEquals <Anim>
    if not AnimFinished <Anim>
      PlayAnim Anim = <Anim> NoRestart Blendperiod = 0.4
    else
      PlayAnim Anim = <Cycle> Cycle NoRestart Blendperiod = 0.4
    endif
  else
    PlayAnim Anim = <Cycle> Cycle NoRestart Blendperiod = 0.4
  endif
endscript
script MakeSkaterFly
  MakeSkaterGoto FlyAi
endscript
script FlyAi Move = 8
  ClearExceptions
  SetQueueTricks NoTricks
  SetSpeed 0
  setstate Air
  SetRollingFriction 1000
  NoRailTricks
  begin
    if held R2
      #"Jump"
      wait 8 frames
    endif
    if held L1
      break
    endif
    if held L2
      if held square
        Move X = 18
      endif
      if held Circle
        Move X = -18
      endif
      if held Triangle
        Move z = 18
      endif
      if held X
        Move z = -18
      endif
    else
      if held square
        Move X = 6
      endif
      if held Circle
        Move X = -6
      endif
      if held Triangle
        Move z = 8
      endif
      if held X
        Move z = -8
      endif
    endif
    waitonegameframe
  repeat
  AllowRailTricks
  MakeSkaterGoto OnGroundAI
endscript
