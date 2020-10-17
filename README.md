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
  
  # export bin path
  # file: ~/.zshrc
  export PATH=$PATH:~/bin
  ```

## 4. Hardware



### Touchpad Gesture

* fusuma
* Natural Scrolling

### Display



### Input Method

* [ibus](https://github.com/ibus/ibus/wiki)

  input method framework

* [ibus-chewing](https://github.com/definite/ibus-chewing)

  chinese input method

```shell
# file: .xprofie
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



