#NoEnv
#SingleInstance Force
SendMode Input

; Mapping
mapping := {}

mapping["``"] := "{Backspace}"
mapping["F1"] := "{Enter}"

; 1 - 9 doesn't work (and more), needs a workaround
mapping["1"] := "0"
mapping["2"] := "9"
mapping["3"] := "8"
mapping["4"] := "7"
mapping["5"] := "6"
mapping["6"] := "5"
mapping["7"] := "4"
mapping["8"] := "3"
mapping["9"] := "2"
mapping["0"] := "1"
; q - p
mapping["q"] := "p"
mapping["w"] := "o"
mapping["e"] := "i"
mapping["r"] := "u"
mapping["t"] := "y"
mapping["y"] := "t"
mapping["u"] := "r"
mapping["i"] := "e"
mapping["o"] := "w"
mapping["p"] := "q"
; a - l
mapping["a"] := "l"
mapping["s"] := "k"
mapping["d"] := "j"
mapping["f"] := "h"
mapping["g"] := "g"
mapping["h"] := "f"
mapping["j"] := "d"
mapping["k"] := "s"
mapping["l"] := "a"
; z - m
mapping["z"] := "m"
mapping["x"] := "n"
mapping["c"] := "b"
mapping["v"] := "v"
mapping["b"] := "c"
mapping["n"] := "x"
mapping["m"] := "z"

; Toogle
isMirrored := false

; Hotkeys
^!Shift::
    isMirrored := !isMirrored
    if (isMirrored) {
        for key, value in mapping {
            Hotkey, $*%key%, MirrorKey, On
            Hotkey, $*+%key%, MirrorKey, On
            Hotkey, $*!%key%, MirrorKey, On
            Hotkey, $*^%key%, MirrorKey, On
            Hotkey, $*^+%key%, MirrorKey, On
            Hotkey, $*^!%key%, MirrorKey, On
            Hotkey, $*+!%key%, MirrorKey, On
            Hotkey, $*^+!%key%, MirrorKey, On
        }

    } else {
        for key, value in mapping {
            Hotkey, $*%key%, Off
            Hotkey, $*+%key%, Off
            Hotkey, $*!%key%, Off
            Hotkey, $*^%key%, Off
            Hotkey, $*^+%key%, Off
            Hotkey, $*^!%key%, Off
            Hotkey, $*+!%key%, Off
            Hotkey, $*^+!%key%, Off
        }
    }

return

; Helper functions
MirrorKey:
    StringRight, thisKey, A_ThisHotkey, 1
;    msgbox % StringRight " - " thisKey " - " A_ThisHotkey "`n"
;    .        mapping[StringRigth] " - " mapping[thisKey] " - " mapping[A_ThisHotkey] "`n"
;    .         " - " mapping[SubStr(thisKey, 3)] " - " mapping[SubStr(A_ThisHotkey, 3)]

    ; TODO: Fix this workaround
    ; For some strage reason when pressing some of the keys mapping[SubStr(A_ThisHotkey, 3)] returns nothing
    ; even though they are mapped (I checked other combinations) e.g.
    ;
    ;   %key% == SubStr(A_ThisHotkey, 3)                      ; True.
    ;   mapping[%key%] == mapping[SubStr(A_ThisHotkey, 3)]    ; False.
    ;   mapping[SubStr(A_ThisHotkey, 3)] == ""                ; True.
    ;
    ; So I have to use this workaround
    workaroundTriggered := false

    Switch SubStr(A_ThisHotkey, 3) {
        case "1":
            SendInput % "{Blind}" mapping["1"]
            workaroundTriggered := true
        case "2":
            SendInput % "{Blind}" mapping["2"]
            workaroundTriggered := true
        case "3":
            SendInput % "{Blind}" mapping["2"]
            workaroundTriggered := true
        case "4":
            SendInput % "{Blind}" mapping["3"]
            workaroundTriggered := true
        case "5":
            SendInput % "{Blind}" mapping["4"]
            workaroundTriggered := true
        case "6":
            SendInput % "{Blind}" mapping["5"]
            workaroundTriggered := true
        case "7":
            SendInput % "{Blind}" mapping["6"]
            workaroundTriggered := true
        case "8":
            SendInput % "{Blind}" mapping["7"]
            workaroundTriggered := true
        case "9":
            SendInput % "{Blind}" mapping["8"]
            workaroundTriggered := true
        case "0":
            SendInput % "{Blind}" mapping["9"]
            workaroundTriggered := true
    }

    if (!workaroundTriggered) {
        SendInput % "{Blind}" mapping[SubStr(A_ThisHotkey, 3)]
    }

return
