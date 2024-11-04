#!/bin/sh

# Styles
bold='[1m'
reset='[0m'

# Bold colours
black='[1;30m'
red='[1;31m'
green='[1;32m'
yellow='[1;33m'
blue='[1;34m'
purple='[1;35m'
cyan='[1;36m'
white='[1;37m'
gray='[1;90m'
lightred='[1;91m'
lightgreen='[1;92m'
lightyellow='[1;93m'
lightblue='[1;94m'
lightmagenta='[1;95m'
lightcyan='[1;96m'

# Distro config
declare -A alldistros

alldistros[almalinux]="$red ?_?"
alldistros[alpine]="$red ?_?"
alldistros[altlinux]="$red ?_?"
alldistros[amzn]="$red ?_?"
alldistros[anarchy]="$red ?_?"
alldistros[arch]="$blue /.\\"
alldistros[arch32]="$blue /.\\"
alldistros[archcraft]="$blue /.\\"
alldistros[arcolinux]="$blue /,\\"
alldistros[arkane]="$red ?_?"
alldistros[artix]="$blue />\\"
alldistros[bazzite]="$purple Γ+)"
alldistros[blackarch]="$lightblue /|\\"
alldistros[blendos]="$red ?_?"
alldistros[bodhi]="$red ?_?"
alldistros[cachyos]="$red ?_?"
alldistros[centos]="$red ?_?"
alldistros[centos_stream]="$red ?_?"
alldistros[chimera]="$red ?_?"
alldistros[clear-linux-os]="$red ?_?"
alldistros[debian]="$red (@)"
alldistros[Deepin]="$red ?_?"
alldistros[devuan]="$red ?_?"
alldistros[dragonfly]="$red ?_?"
alldistros[elementary]="$red ?_?"
alldistros[endeavouros]="$red ?_?"
alldistros[endless]="$red ?_?"
alldistros[eurolinux]="$red ?_?"
alldistros[exherbo]="$red ?_?"
alldistros[fedora]="$blue (f)"
alldistros[fedoraremixforwsl]="$blue (f)"
alldistros[freebsd]="$red ?_?"
alldistros[funtoo]="$red ?_?"
alldistros[garuda]="$red ?_?"
alldistros[gentoo]="$red ?_?"
alldistros[ghostbsd]="$red ?_?"
alldistros[gnoppix]="$red ?_?"
alldistros[hyperbola]="$red ?_?"
alldistros[kali]="$red ?_?"
alldistros[kaos]="$red ?_?"
alldistros[linuxmint]="$green lm)"
alldistros[mageia]="$red ?_?"
alldistros[manjaro]="$red ?_?"
alldistros[manjaro-arm]="$red ?_?"
alldistros[miraclelinux]="$red ?_?"
alldistros[neon]="$red ?_?"
alldistros[nilrt]="$red ?_?"
alldistros[nixos]="$red ?_?"
alldistros[nobara]="$red ?_?"
alldistros[ol]="$red ?_?"
alldistros[omnios]="$red ?_?"
alldistros[openmandriva]="$red ?_?"
alldistros[opensuse]="$green @~>"
alldistros[suse]="$green @~>"
alldistros[opensuse-leap]="$green @~>"
alldistros[opensuse-tumbleweed]="$green @~>"
alldistros[openwrt]="$red ?_?"
alldistros[parrot]="$red ?_?"
alldistros[pclinuxos]="$red ?_?"
alldistros[pengwin]="$red ?_?"
alldistros[photon]="$red ?_?"
alldistros[pisilinux]="$red ?_?"
alldistros[pop]="$lightblue P!_"
alldistros[pureos]="$red ?_?"
alldistros[rebornos]="$red ?_?"
alldistros[redox-os]="$red ?_?"
alldistros[rhel]="$red ?_?"
alldistros[rocky]="$red ?_?"
alldistros[slackware]="$red ?_?"
alldistros[sled]="$red ?_?"
alldistros[sles]="$red ?_?"
alldistros[solaris]="$red ?_?"
alldistros[solus]="$red ?_?"
alldistros[steamos]="$blue •))"
alldistros[tails]="$purple :D="
alldistros[tinycore]="$red ?_?"
alldistros[trisquel]="$red ?_?"
alldistros[ubuntu]="$yellow {•}"
alldistros[ultramarine]="$red ?_?"
alldistros[vanillaos]="$red ?_?"
alldistros[virtuozzo]="$red ?_?"
alldistros[void]="$red ?_?"
alldistros[wolfi]="$red	?_?"
alldistros[zorin]="$blue <Z>"

# Get host
read -r HOST < /proc/sys/kernel/hostname

# Get kernel
read -r KERNEL < /proc/sys/kernel/osrelease

# Get uptime in seconds
IFS=. read -r s _ < /proc/uptime
UPS=$((s))

# Arguments
if [[ "$1" == "-d" ]] ; then
    # Set basic info
    distro_id="$2"
    distro_name=""
    distro_kernel=""
else
    # Set OS info
    source /etc/os-release
    distro_id="${ID}"
    distro_name="${PRETTY_NAME}"
    distro_kernel="${KERNEL}"
fi

# find distro(s) and send to output
for key in "${!alldistros[@]}" ; do
    set -- ${alldistros[$key]}
    if [[ "$distro_id" == "all" ]] ; then
        cat <<EOF
  $1$2  ${key}${reset}
EOF
    elif [[ "$distro_id" == "$key" ]] ; then
        if [[ "$distro_name" == "" ]] ; then
            cat <<EOF
  $1$2  ${key}${reset}
EOF
        else
            cat <<EOF
  $1$2  ${distro_name} ${bold}${gray}:: ${white}${USER}@${HOST} ${gray}:: ${white}${distro_kernel} ${gray}:: ${white}${UPS} sec${reset}
EOF
        fi
        exit
    fi
done

exit
