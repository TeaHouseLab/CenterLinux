set prefix [CenterLinux-Injector]
switch $argv[1]
    case injector
        injector
    case v
        logger 0 "Corleone@build1"
    case h help "*"
        logger 0 "Use ./app injector for cli guide-elf"
end
