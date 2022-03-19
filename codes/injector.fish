function injector
    if command -q -v ctpkg
    else
        init
    end
    logger 0 "We're going to install the basic system,continue?"
    read -P "$prefix [Press enter to confirm,Ctrl+C to abort]"
    logger 0 "Grabbing the package index..."
    ctpkg grab upg
    logger 0 "Start processing packages..."
    ctpkg grab center-plymouth-theme center-grub-theme center-id ctcontainer ctpkg neofetch progynosh ctutils
    logger 0 "Processed."
end
