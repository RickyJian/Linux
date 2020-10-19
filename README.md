# Linux

My linux installation guide and configuration

Manjaro Linux: [Manjaro Official](https://manjaro.org)

Desktop Environment: [KDE Plasma 5](https://kde.org/plasma-desktop)

## 1. Install OS & Desktop Environment

install `Manjaro` and `KDE`

Manjaro download page: [Download](https://manjaro.org/download/)

Manjaro installation guide: [Link](https://manjaro.org/support/firststeps/)

## 2. Basic Package

install linux basic package

* [yay](https://github.com/Jguer/yay)

  package manager

* [base-devel](https://www.archlinux.org/groups/x86_64/base-devel/)

  basic linux package

* [curl](https://curl.haxx.se/)

  curl is used in command lines or scripts to transfer data

* [vim](https://www.vim.org/)

  a highly configurable text editor

* [git](https://git-scm.com/)

  version control system

* [neofetch](https://github.com/dylanaraps/neofetch) (optional)

  a command-line system information tool

## 3. Terminal

my zsh config refer to: [Link](.zshrc)

* [Tilix](https://gnunn1.github.io/tilix-web/)
  
  terminal

* [zsh](https://www.zsh.org/)

  * [oh-my-zsh](https://ohmyz.sh/)

    * [powerlevel10k](https://github.com/romkatv/powerlevel10k)

      zsh theme
    
      ```shell
      # file: ~/.zshrc 
      # custom terminal layout
      
      # zshrc theme
      ZSH_THEME="powerlevel10k/powerlevel10k"
      
      # left elements
      POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable go_version vsc vi_mode)
      
      # right elements
      POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status backgrond_jobs history time)
      
      # hide current user
      DEFAULT_USER="ricky"
      
      # format history time
      HIST_STAMPS="yyyy-mm-dd"
      
      ```
  
  * [nerd-fonts-complete](https://github.com/ryanoasis/nerd-fonts)
    
    ```shell
    # file: ~/.zshrc
    
    # show all icons
    POWERLEVEL9K_MODE="nerdfont-complete"
    ```
    
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    
    ```shell
    # file: ~/.zshrc
    
    # enable zsh-autosuggestions
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ```
    
  * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  
    ```shell
    # file: ~/.zshrc
    
    # hight text style
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline"
    
    # enable zsh-syntax-highlighting
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ```

* bind local script

  when you want to use shell script in everywhere by yourself, you should create `bin` directory and export it.

  ```shell
  # create local script directory
  $ mkdir ~/bin
  
  # file: ~/.zshrc
  
  # export bin path
  export PATH=$PATH:~/bin
  ```

## 4. Hardware

my touchpad config refer to: 

* [Natural Scrolling](30-touchpad.conf)
* [fusuma](config.yml)

### Touchpad Gesture

* Natural Scrolling

  ```shell
  # file: /etc/X11/xorg.conf.d/30-touchpad.conf
  
  # enable natural scrolling
  Option "Natural Scrolling" "true"
  ```

* [fusuma](https://github.com/iberianpig/fusuma)

  fusuma is multitouch gesture recognizer.

  ```yaml
  # file: ~/.config/fusuma/config.yml
  
  # gesture config
  swipe:
    3:
      left:
        command: "xdotool key alt+Right" # History forward 
      right:
        command: "xdotool key alt+Left" # History back
    4:
      left:
        command: "xdotool key ctrl+alt+Right" # Switch to next workspace
      right:
        command: "xdotool key ctrl+alt+Left" # Switch to previous workspace
      up:
        command: "xdotool key ctrl+F10" # Switch to next workspace
      down:
        command: "xdotool key ctrl+F12" # Switch to previous workspace
  pinch:
    in:
      command: "xdotool keydown ctrl click 4 keyup ctrl" # Zoom in
    out:
      command: "xdotool keydown ctrl click 5 keyup ctrl" # Zoom out
  ```
  
  > xdotool intreduction: [Link](https://github.com/jordansissel/xdotool/blob/master/xdotool.pod)

### Display

my displays shell scripts refer to:

* [XSetup](Xsetup)
* [auto-xrandr](auto-xrandr.sh)
* [si-xrandr](si-xrandr.sh)
* [ex-xrandr](ex-xrandr.sh)

#### HiDPI Setting

when your PC/NB shows low resolution or icons too small, use `xrandr` command to handle this problem.

* [xorg-xrandr](https://wiki.archlinux.org/index.php/xrandr) 

  an official configuration utility to the resize and rotate X Window System extension.

* [SDDM](https://github.com/sddm/sddm/)

  ```shell
  # file: /usr/share/sddm/scripts/Xsetup
  
  # detected displays and adjust resolutions
  primary=$(</sys/class/drm/card0/card0-eDP-1/status)
  secondary=$(</sys/class/drm/card0/card0-DP-1/status)
  connected=connected
  
  if [ "$primary" == "$connected" ] && [ "$secondary" == "$connected" ]; then
         	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
  elif [ "$primary" == "$connected" ]; then
         	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
  elif [ "$secondary" == "$connected" ]; then
         	 xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
  fi
  ```

* displays detected

  * auto-xrandr

    ```shell
    # file: ~/bin/auto-xrandr.sh
    
    # auto change primary, external, or both displays
    primary=$(</sys/class/drm/card0/card0-eDP-1/status)
    secondary=$(</sys/class/drm/card0/card0-DP-1/status)
    connected=connected
    
    if [ "$primary" == "$connected" ] && [ "$secondary" == "$connected" ]; then
           	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
    	notify-send 'switch to multi displays'
    elif [ "$primary" == "$connected" ]; then 
           	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
    	notify-send 'switch to primary display'
    elif [ "$secondary" == "$connected" ]; then
           	 xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
    	notify-send 'switch to external display'
    fi
    ```

  * si-xrandr

    ```shell
    # file: ~/bin/si-xrandr.sh
    
    # change to primary display
    primary=$(</sys/class/drm/card0/card0-eDP-1/status)
    connected=connected
    
    if [ "$primary" == "$connected" ]; then 
           	 xrandr --output eDP1 --primary --mode 3200x1800 --pos 698x1890 --rotate normal --scale 1x1 --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
    	notify-send 'switch to primary display'
    fi
    ```

  * ex-xrandr

    ```shell
    # file: ~/bin/auto-xrandr.sh
    
    # change to external display
    secondary=$(</sys/class/drm/card0/card0-DP-1/status)
    connected=connected
    
    if [ "$secondary" == "$connected" ]; then
           	 xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 618x0 --scale 1.75x1.75 --rotate normal --output DP2 --off --output VIRTUAL1 --off
    	notify-send 'switch to external display'
    fi
    ```

> xorg introduction: [Link](https://wiki.archlinux.org/index.php/Xorg)

#### Hot Plugin

comming soon...

### Input Method

my ibus config refer to: [Link](.xprofile)

* [ibus](https://github.com/ibus/ibus/wiki)

  input method framework

* [ibus-chewing](https://github.com/definite/ibus-chewing)

  chinese input method

```shell
# file: .xprofie

# ibus setting
export LANG="zh_TW.UTF-8"
export XMODIFIERS="@im=ibus"
export XMODIFIER="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export DefaultIMModule="ibus"
export XMODIFIERS="@im=ibus"
export LC_CTYPE="zh_TW.UTF-8"
# --replace: if there is an old ibus-daemon is running, it will be replaced.
# --deamonize: run ibus as background process.
# if you want to know other commands, can type ibus-deamon --help in your terminal
ibus-daemon --replace --daemonize
```

> .xprofle introduction: [Link](https://wiki.archlinux.org/index.php/Xprofile)

#### HiDPI Setting

when your candidate panel will shows on the wrong position, you should add `--xim` after `ibus-daemon`

solution refer to: [ibus issue#2221](https://github.com/ibus/ibus/issues/2221#issuecomment-708908247)

```shell
# file: .xprofie

# --xim：execute ibus XIM server.
ibus-daemon --xim --replace --daemonize
```

> X Input Method(xim) intrduction: [Link](https://en.wikipedia.org/wiki/X_Input_Method)

## 5. Appearance

### Application

below settings under `System Setttings` > `Appearance`

* global theme: `ChromeOS-dark`

* plasma style: `ChromeOS`

* application style: `Material-Original_Light`

  should install `kde-gtk-config`

* window decorations: `sweet-mars-transparent`

* colors: `ChromeOSLight`

* fonts: `jf open 粉圓 1.1`

  Download [Link](https://justfont.com/huninn/)

* icons: `Tela circle blue dark`

* cursors: `Vimix Cursors`

### Task Pannel

* [Latte Dock](https://github.com/KDE/latte-dock)

  a dock based on plasma frameworks that provides an elegant and intuitive experience for your tasks and plasmoids.

### Virtual Desktop Bar

* [virtual-desktop-bar](https://github.com/wsdfhjxc/virtual-desktop-bar)

  displays virtual desktops as text labels (numbers, names, both) with indicators (various styles).

### SDDM

below settings under `System Setttings` > `Workspace` > `Startup and Shutdown` > `Login Screen`

* Theme: `WhiteSur`

## 6. Workspace & Windows Behavior

### Desktop Effects

below settings in `System Setttings` > `Workspace Behavior` > `Desktop Effects`

* accessibility
  * zoom
* apperance
  * background contrast
  * blur
  * desaturate unresponsive applications
  * fading popups
  * login
  * logout
  * maximize
  * morphin popups
  * screen edge
  * sliding popups
  * wobbly windows
  * magic lamp
* focus
  * dialog parent
  * slide back
* show desktop animation
  * window aperture
* virtual desktop switching animation
  * slide
* window management
  * desktop grid
  * flip switch
  * parent windows
* window open/close animation
  * fade

### Window Management

below settings in `System Setttings` > `Window Management` > `Task Switcher` 

* visualization: `Cover Switch`

## Other Applications

* folder management: [dolphin](https://web.archive.org/web/20110324033008/http://dolphin.kde.org/)

* browser: [firefox-developer-edition](https://www.mozilla.org/en-US/firefox/developer/)

* painter: [krita](https://krita.org/en/)

  a professional FREE and open source painting program. It is made by artists that want to see affordable art tools for everyone.

* image viewer: [nomacs](https://nomacs.org/)

  a free, open source image viewer, which supports multiple platforms. You can use it for viewing all common image formats including RAW and psd images.

* bittorrent downloader: [qbtorrent](https://www.qbittorrent.org/)

* video player: [mpv](https://mpv.io/)

  a free (as in freedom) media player for the command line. It supports a wide variety of media file formats, audio and video codecs, and subtitle types. 

* pdf viewer: [okular](https://okular.kde.org/)

* markdown editor: [typora](https://typora.io/)

  Typora gives you a seamless experience as both a reader and a writer.

* archives: [ark](https://utils.kde.org/projects/ark/)

  a program for managing various archive formats within the KDE environment. 



