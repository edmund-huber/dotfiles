import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = do
    xmobarProc <- spawnPipe "xmobar"
    xscreensaverProc <- spawnPipe "xscreensaver -no-splash"
    xmonad $ defaultConfig
        {
            manageHook = manageDocks <+> manageHook defaultConfig,
            layoutHook = avoidStruts $ layoutHook defaultConfig,
            modMask = mod4Mask
        } `additionalKeysP` [
            ("M-p", spawn "dmenu_run"),
            ("M-l", spawn "xscreensaver-command -lock"),
            ("M-w", sendMessage ToggleStruts),
            ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10"),
            ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10"),
            ("<XF86AudioMute>", spawn "amixer set Master toggle"),
            ("<XF86AudioLowerVolume>", spawn "amixer set Master 10%-"),
            ("<XF86AudioRaiseVolume>", spawn "amixer set Master 10%+")
        ]
