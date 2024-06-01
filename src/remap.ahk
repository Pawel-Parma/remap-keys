#NoEnv
#SingleInstance Force
SendMode Input

mapping := Object()
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

mapping["a"] := "l"
mapping["s"] := "k"
mapping["d"] := "j"
mapping["f"] := "h"
mapping["g"] := "g"
mapping["h"] := "f"
mapping["j"] := "d"
mapping["k"] := "s"
mapping["l"] := "a"

mapping["z"] := "m"
mapping["x"] := "n"
mapping["c"] := "b"
mapping["v"] := "v"
mapping["b"] := "c"
mapping["n"] := "x"
mapping["m"] := "z"

isMirrored := false

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

MirrorKey:
    StringRight, thisKey, A_ThisHotkey, 1
    Send % "{Blind}" mapping[thisKey]
return