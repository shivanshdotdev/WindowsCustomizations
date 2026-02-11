
;TO CONTROL VOLUME WITH SCROLL WHEEL
+WheelUp::WheelLeft
+WheelDown::WheelRight
#WheelUp::Volume_Up
#WheelDown::Volume_Down
#Numpad5::Volume_Up
#Numpad2::Volume_Down

!i:: Run, wt.exe
return

!t::
    Run, "C:\Users\shiva\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Notion.lnk"
return
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
SetCapsLockState, AlwaysOff

CapsLock::
    Send, {LCtrl down}{LWin down}{Right}{LWin up}{LCtrl up}
return

+CapsLock::
    Send, {LCtrl down}{LWin down}{Left}{LWin up}{LCtrl up}
return

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;WINDOW + SHIFT + y
#+y::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "https://www.youtube.com/"
return

;WINDOW + CONTROL + y
#^y:: 
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" --incognito https://www.youtube.com
return   

;Window + E
#e::
    Run, "C:\Users\shiva\AppData\Local\Voidstar\FilePilot\FPilot.exe"
return 

#+s::Send {PrintScreen}	

#s:: Run, "C:\Program Files\Everything\Everything.exe"

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;OPENING SOME WEBSITES in SOME profiles USING Shortcuts

^!g::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "https://chatgpt.com/?temporary-chat=true"
return

^!p::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "https://www.perplexity.ai/"
return 

^!o::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "C:\Users\shiva\Desktop\Links.html"
return

^!m::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "https://claude.ai/new"
return

^!b::
    Run, "C:\Users\shiva\OneDrive\Pictures\Apps\Brave Profiles\Coding - Brave.lnk" "https://gemini.google.com/u/0/app"
return

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; Jump up 5 lines 
Control & Up:: ; F1 + Arrow Up
    SendInput, {Up 5} ; Moves up 5 lines in one action
    return

; Jump down 5 lines 
Control & Down:: ; F1 + Arrow Down
    SendInput, {Down 5} ; Moves down 5 lines in one action
    return

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
:*::smrk::😏
:*::skl::💀
:*::tear1::🥲
:*::tear2::🥹
:*::awk1::😳
:*::awk2::😑
:*::laf1::🤣
:*::laf2::😆
:*::tick::✅
:*::cross::❌

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
RAlt & Numpad2::
  AdjustScreenBrightness(-5)
  Return
RAlt & Numpad5::
  AdjustScreenBrightness(5)
  Return
RAlt & WheelDown::
  AdjustScreenBrightness(-10)
  Return
RAlt & WheelUp::
  AdjustScreenBrightness(10)
  Return
AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    minBrightness := 5  ; level below this is identical to this
    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)  ; parenthesis is necessary here
        curt := minBrightness
    toSet := curt + step
    if (toSet > 100)
        return
    if (toSet < minBrightness)
        toSet := minBrightness
    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
}
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
