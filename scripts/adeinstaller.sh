#!/bin/bash

wine_install="$HOME/.wine"
export WINEPREFIX=$wine_install &>> log.txt

echo "welcome to ade installer"
echo "========================"
echo "before running, you should probably update your"
echo "system and repositories for best results, i.e. sudo pacman -Syu"
echo "========================"
echo
echo "1) install dependencies"
echo "2) get adobe keys"
echo
read -p "option: " option
echo

case $option in
    "1")
        echo "installation may take some time, outputting messages to log.txt"
        echo "you'll be prompted for installations, please complete them"
        echo "installing dependencies, password is needed for pacman"
        sudo pacman -S wine winetricks lib32-gnutls |& tee -a log.txt

        WINEARCH=win32 wineboot &>> log.txt
        winetricks -q corefonts &>> log.txt
        winetricks -q windowscodecs &>> log.txt
        winetricks -q dotnet35sp1 &>> log.txt
        winetricks -q python27 &>> log.txt

        curl -L https://adedownload.adobe.com/pub/adobe/digitaleditions/ADE_4.5_Installer.exe -o /tmp/adeinstaller.exe &>> log.txt
        curl -L http://www.voidspace.org.uk/python/pycrypto-2.6.1/pycrypto-2.6.1.win32-py2.7.exe -o /tmp/pycrypto.exe &>> log.txt

        mkdir -p "$wine_install/drive_c/dedrm_plugins/" &>> log.txt
        curl -L https://raw.githubusercontent.com/apprenticeharper/DeDRM_tools/master/DeDRM_plugin/adobekey.py \
        -o "$wine_install/drive_c/dedrm_plugins/adobekey.py" &>> log.txt

        wine /tmp/adeinstaller.exe &>> log.txt
        wine /tmp/pycrypto.exe &>> log.txt

        echo "put the following alias into your profile if you'd like a shortcut to start ade"
        echo "alias adestart=\"WINEPREFIX=$wine_install $wine_install/drive_c/Program\\ Files/Adobe/Adobe\\ Digital\\ Editions\\ 2.0/DigitalEditions.exe > /dev/null 2>&1 &\""
        ;;
    "2")
        echo "please make sure you have setup ade correctly or else this scripts will fail"
        echo 
        read -p "have you done so? (y/n) " option
        echo

        case $option in
            [yY] | [yY][eS][sS])
                wine python "$wine_install/drive_c/dedrm_plugins/adobekey.py" &>> log.txt
                echo "completed, find the key located in $wine_install/drive_c/dedrm_plugins/adobekey_1.der"
                ;;
            *)
                echo "please complete setup, exiting"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "unknown choice, exiting"
        exit 1
        ;;
esac

exit 0
