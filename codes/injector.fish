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
[2]desktop(install a full set of centerlinux)
[-1]exit injector"
    read -P "$prefix >>> " args -a
    for target in $args
        switch $target
            case 0
                ctpkg grab upg && ctpkg grab center-id ctcontainer ctpkg neofetch progynosh ctutils
            case 1
                ctpkg grab upg && ctpkg grab center-plymouth-theme center-grub-theme enter-id ctcontainer ctpkg neofetch progynosh ctutils
            case 2
                ctpkg grab upg && ctpkg grab center-id-desktop chromeos-gtk-theme matcha-kde-wallpapers papirus-icon-theme center-kde-theme grab center-plymouth-theme center-grub-theme enter-id ctcontainer ctpkg neofetch progynosh ctutils
            case "*"
                logger 4 "Unexpect Input,abort"
                exit
        end
    end
end
