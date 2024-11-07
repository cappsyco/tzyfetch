# tzyfetch
tzyfetch is an extremely simple fetch utility, built for a single line output with a three character distro logo.

## Install
        git clone https://github.com/cappsyco/tzyfetch.git
        cd tzfetch
        chmod +x tzyfetch.sh
        ./tzyfetch.sh 

## Use
        tzyfetch
Default behaviour will return the logo and name of your distro, plus system and session specific information.

        tzyfetch -d pisilinux
        tzyfetch -distro freebsd
Outputs the logo of the specified distro ID

        tzyfetch -d all
Outputs every distro logo and ID that tzyfetch knows
