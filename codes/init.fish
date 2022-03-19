function init
curl -s -L -o ctpkg https://cdngit.ruzhtw.top/pkghub/ctpkg
fish ctpkg grab ctpkg
rm ctpkg
end