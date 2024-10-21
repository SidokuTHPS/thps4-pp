
script WallRide
  ClearExceptions
  SetException Ex = Landed Scr = Land Params = { NoBlend }
  SetException Ex = Ollied Scr = Wallie
  SetException Ex = GroundGone Scr = WallrideEnd
  SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
  Vibrate Actuator = 1 percent = 40
  Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
  if GotParam Left
    move x = 36
  else
    move x = -36
  endif
  if BailIsOn
    SetState Air
    goto DoingTrickBail
  endif
  Bailoff
  SetQueueTricks WallRideTricks
  NollieOff
  SetTrickScore 200
  PlayCessSound
  if GotParam Left
    if Flipped
      SetTrickName 'BS Wallride'
      PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 cycle
    else
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 cycle
    endif
  else
    if Flipped
      SetTrickName 'FS Wallride'
      PlayAnim Anim = WallRideFrontTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideFrontLoop BlendPeriod = 0.1 cycle
    else
      SetTrickName 'BS Wallride'
      PlayAnim Anim = WallRideBackTrans BlendPeriod = 0.0
      WaitAnimFinished
      PlayAnim Anim = WallRideBackLoop BlendPeriod = 0.1 cycle
    endif
  endif
  Display
endscript
script WallrideEnd
  BlendperiodOut 0
  SetException Ex = Landed Scr = Land
  ClearExceptions
  if Inair
    goto Airborne
  endif
endscript
script Wallie
  Vibrate Actuator = 1 percent = 50 duration = 0.1
  PlayAnim Anim = Ollie BlendPeriod = 0.0
  SetTrickName "Wallie"
  SetTrickScore 250
  InAirExceptions
  Display
  #"Jump"
  WaitAnimWhilstChecking
  goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
WallRideTricks =
[ { Trigger = { TapTwiceRelease Up x 500 } Scr = Trick_WallPlant } ]
script Trick_WallPlant
  InAirExceptions
  Vibrate Actuator = 1 percent = 50 duration = 0.1
  PlayAnim Anim = Boneless BlendPeriod = 0.0
  SetTrickName "Wallplant"
  SetTrickScore 500
  Display
  #"Jump" BonelessHeight
  WaitAnimWhilstChecking
  goto Airborne StretchTime = 10 BlendPeriod = 0
endscript
script WallRideBail
endscript
