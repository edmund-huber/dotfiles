import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = do
    xscreensaverProc <- spawnPipe "xscreensaver -no-splash"
    xssLockProc <- spawnPipe "xss-lock -- xscreensaver-command --lock"
    xmonad $ defaultConfig
        {
            layoutHook = smartBorders $ layoutHook defaultConfig,
            modMask = mod1Mask,
            startupHook = do spawn "xsetroot -solid black"
        } `additionalKeysP` [
            ("M-p", spawn "dmenu_run"),
            ("M-/", spawn "xscreensaver-command -lock"),
            ("M-w", sendMessage ToggleStruts),
            ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10"),
            ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10"),
            ("<XF86AudioMute>", spawn "amixer set Master toggle"),
            ("<XF86AudioLowerVolume>", spawn "amixer set Master 10%-"),
            ("<XF86AudioRaiseVolume>", spawn "amixer set Master 10%+")
        ]
