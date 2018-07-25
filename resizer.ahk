#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

EaseLUT := []
EaseLUT.Push(0.0000000001)
EaseLUT.Push(0.0000000032)
EaseLUT.Push(0.0000000243)
EaseLUT.Push(0.0000001024)
EaseLUT.Push(0.0000003125)
EaseLUT.Push(0.0000007776)
EaseLUT.Push(0.0000016807)
EaseLUT.Push(0.0000032768)
EaseLUT.Push(0.0000059049)
EaseLUT.Push(0.00001)
EaseLUT.Push(0.0000161051)
EaseLUT.Push(0.0000248832)
EaseLUT.Push(0.0000371293)
EaseLUT.Push(0.0000537824)
EaseLUT.Push(0.0000759375)
EaseLUT.Push(0.00010485760000000788)
EaseLUT.Push(0.00014198570000001354)
EaseLUT.Push(0.00018895679999997306)
EaseLUT.Push(0.0002476098999999454)
EaseLUT.Push(0.000320000000000098)
EaseLUT.Push(0.00040841009999992295)
EaseLUT.Push(0.0005153631999998964)
EaseLUT.Push(0.0006436343000000289)
EaseLUT.Push(0.0007962623999999696)
EaseLUT.Push(0.0009765625)
EaseLUT.Push(0.0011881376000000277)
EaseLUT.Push(0.0014348906999999134)
EaseLUT.Push(0.0017210368000000198)
EaseLUT.Push(0.002051114899999984)
EaseLUT.Push(0.002429999999999932)
EaseLUT.Push(0.0028629150999999187)
EaseLUT.Push(0.00335544320000003)
EaseLUT.Push(0.003913539300000046)
EaseLUT.Push(0.004543542399999989)
EaseLUT.Push(0.005252187500000005)
EaseLUT.Push(0.006046617600000026)
EaseLUT.Push(0.0069343957000000955)
EaseLUT.Push(0.00792351680000003)
EaseLUT.Push(0.009022419899999967)
EaseLUT.Push(0.010240000000000027)
EaseLUT.Push(0.011585620099999971)
EaseLUT.Push(0.013069123199999977)
EaseLUT.Push(0.014700844300000071)
EaseLUT.Push(0.016491622400000017)
EaseLUT.Push(0.018452812500000082)
EaseLUT.Push(0.020596297600000035)
EaseLUT.Push(0.022934500699999916)
EaseLUT.Push(0.025480396799999916)
EaseLUT.Push(0.028247524900000043)
EaseLUT.Push(0.03125)
EaseLUT.Push(0.03450252509999996)
EaseLUT.Push(0.0380204032)
EaseLUT.Push(0.04181954929999998)
EaseLUT.Push(0.045916502400000114)
EaseLUT.Push(0.050328437499999934)
EaseLUT.Push(0.05507317759999997)
EaseLUT.Push(0.06016920570000006)
EaseLUT.Push(0.06563567679999993)
EaseLUT.Push(0.07149242989999993)
EaseLUT.Push(0.07776000000000005)
EaseLUT.Push(0.08445963010000002)
EaseLUT.Push(0.09161328320000006)
EaseLUT.Push(0.09924365429999993)
EaseLUT.Push(0.10737418240000007)
EaseLUT.Push(0.1160290625)
EaseLUT.Push(0.12523325760000015)
EaseLUT.Push(0.13501251069999998)
EaseLUT.Push(0.1453933568000001)
EaseLUT.Push(0.1564031348999999)
EaseLUT.Push(0.16806999999999994)
EaseLUT.Push(0.18042293509999996)
EaseLUT.Push(0.19349176319999994)
EaseLUT.Push(0.2073071593)
EaseLUT.Push(0.22190066239999995)
EaseLUT.Push(0.2373046875)
EaseLUT.Push(0.25355253760000007)
EaseLUT.Push(0.27067841569999995)
EaseLUT.Push(0.28871743680000006)
EaseLUT.Push(0.3077056399)
EaseLUT.Push(0.3276800000000002)
EaseLUT.Push(0.34867844010000004)
EaseLUT.Push(0.3707398432)
EaseLUT.Push(0.3939040643)
EaseLUT.Push(0.4182119423999999)
EaseLUT.Push(0.4437053124999999)
EaseLUT.Push(0.47042701760000005)
EaseLUT.Push(0.4984209207000001)
EaseLUT.Push(0.5277319168000001)
EaseLUT.Push(0.5584059449000001)
EaseLUT.Push(0.5904900000000002)
EaseLUT.Push(0.6240321451000002)
EaseLUT.Push(0.6590815232000002)
EaseLUT.Push(0.6956883693)
EaseLUT.Push(0.7339040223999997)
EaseLUT.Push(0.7737809374999998)
EaseLUT.Push(0.8153726976)
EaseLUT.Push(0.8587340257)
EaseLUT.Push(0.9039207967999998)
EaseLUT.Push(0.9509900498999999)
EaseLUT.Push(1.0)

SetWinDelay, 0

Interp(a, b, t) ; t is between 0.0 and 1.0, it's (t)ime
{
    local lookedup, retval
    lookedup := EaseLUT[99 - t]
    retval := (b * (1.0 - lookedup)) + (a * lookedup)
    return retval
}

#z:: ; [Win]+[z]
    TransitionPos := 0
    WinGet, WindowID, ID, A
    Gui, Add, Edit, r1 vNewW Number x31 y34 w80 h20 +Center, Width
    Gui, Add, Edit, r1 vNewH Number x31 y79 w80 h20 +Center, Height
    Gui, Add, Button, Default x31 y109 w80 h40 gOK, Resize!
    Gui, Add, Text, x21 y9 w100 h20 +Center, Resize Window...
    Gui, Add, Text, x61 y59 w20 h20 +Center, by
    Gui, Add, Text, x116 y39 w20 h20, px
    Gui, Add, Text, x116 y84 w20 h20, px
    ; Generated using SmartGUI Creator 4.0
    Gui, Show, x514 y338 h163 w147, Resizer
    Return

OK:
    Gui, Submit
    Gosub, GuiClose
    WinGetPos, OldX, OldY, OldW, OldH, ahk_id %WindowID%
    Gosub, ResizeLabel
    Return

ResizeLabel:
    Loop, 25
    {
        TempW := Interp(OldW, NewW, TransitionPos)
        TempH := Interp(OldH, NewH, TransitionPos)
        TempX := OldX + (OldW-TempW)/2
        TempY := OldY + (OldH-TempH)/2
        WinMove, ahk_id %WindowID%, , TempX, TempY, TempW, TempH
        TransitionPos += 4
    }
    Return

GuiClose:
    Gui, Destroy
    Return