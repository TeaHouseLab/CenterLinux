#!/usr/bin/env fish

function logger-warn
  set_color magenta
  echo "$prefix [Warn] $argv[1..-1]"
  set_color normal
end
function logger-error
  set_color red
  echo "$prefix [Error] $argv[1..-1]"
  set_color normal
end
function logger-info
  set_color normal
  echo "$prefix [Info] $argv[1..-1]"
  set_color normal
end
function logger-debug
  set_color yellow
  echo "$prefix [Debug] $argv[1..-1]"
  set_color normal
end
function logger-success
  set_color green
  echo "$prefix [Successed] $argv[1..-1]"
  set_color normal
end
function logger -d "a lib to print msg quickly"
switch $argv[1]
case 0
  logger-info $argv[2..-1]
case 1
  logger-success $argv[2..-1]
case 2
  logger-debug $argv[2..-1]
case 3
  logger-warn $argv[2..-1]
case 4
  logger-error $argv[2..-1]
end
end

function injector
    if command -v ctpkg
    else
        init
    end
    logger 0 "Welcome using CenterLinux Injector,choose what package you want to flash in the following menu,use space with 2+ args,For example"
    logger 0 ">>> 0 1"
    logger 0 "you don't need to type a space before the first arg"
    echo "[0]core (basefile like id package,tools,etc)
[1]advance (install bootup splash and grub themes)
[2]desktop(install recommended themes and layout for your gnome/kde desktop)
[-1]exit injector"
    read -P "$prefix >>> " args
    for target in $args
        switch $target
            case 0
                ctpkg ctpm grab center-id ctcontainer ctpkg neofetch progynosh
            case 1
                ctpkg ctpm grab center-plymouth-theme center-grub-theme
            case 2
                ctpkg ctpm grab center-id-desktop chromeos-gtk-theme matcha-kde-wallpapers papirus-icon-theme
            case "*"
                logger 4 "Unexpect Input,abort"
                exit
        end
    end
end

function init
curl -s -L -o ctpkg https://cdngit.ruzhtw.top/ctpkg/ctpkg
fish ctpkg install
rm ctpkg
end
echo Build_Time_UTC=2022-01-08_13:58:39
set prefix [CenterLinux-Injector]
switch $argv[1]
    case injector
        injector
    case v
        logger 0 "pomelo@build1"
    case h help "*"
        logger 0 "Use ./app injector for cli guide-elf"
end