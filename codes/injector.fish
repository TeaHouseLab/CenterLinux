function injector
    if command -v ctpkg
    else
        init
    end
    logger 0 "Welcome using CenterLinux Injector,choose what package you want to flash in the following menu"
    logger 0 ">>> 0 1"
    logger 0 "you don't need to type a space before the first arg"
    echo "[0]core (basefile like id package,tools,etc)
[1]advance (install bootup splash and grub themes)
[2]desktop for kde(install a full set of centerlinux)
[3]desktop for gnome(install a full set of centerlinux)
[-1]exit injector"
    read -P "$prefix >>> " args -a
    for target in $args
        switch $target
            case 0
                ctpkg grab upg && ctpkg grab center-id ctcontainer ctpkg neofetch progynosh ctutils
            case 1
                ctpkg grab upg && ctpkg grab center-plymouth-theme center-grub-theme center-id ctcontainer ctpkg neofetch progynosh ctutils
            case 2
                ctpkg grab upg && ctpkg grab center-id-desktop papirus-icon-theme center-kde-theme center-plymouth-theme center-grub-theme center-id ctcontainer ctpkg neofetch progynosh ctutils
            case 3
                ctpkg grab upg && ctpkg grab center-id-desktop center-plymouth-theme center-grub-theme center-id ctcontainer ctpkg neofetch progynosh ctutils center-gnome-theme 
            case "*"
                logger 4 "Unexpect Input,abort"
                exit
        end
    end
end
