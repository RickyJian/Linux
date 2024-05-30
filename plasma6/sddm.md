# sddm settings

## Enable HiDPI

creating file `/etc/sddm.conf.d/hidpi.conf`

```
[Wayland]
EnableHiDPI=true
```

use qt base greeter can set self dpi

file `/etc/sddm.conf.d/kde_settings.conf`

```
[General]
GreeterEnvironment=QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=192
```
