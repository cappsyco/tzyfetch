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

alldistros[almalinux]="$blue {X}"
alldistros[alpine]="$blue <^>"
alldistros[altlinux]="$yellow r,l" #?
alldistros[amzn]="$yellow |Y|"
alldistros[anarchy]="$blue /-\\"
alldistros[arch]="$blue /.\\"
alldistros[arch32]="$blue /.\\"
alldistros[archcraft]="$blue /.\\"
alldistros[arcolinux]="$blue /,\\"
alldistros[arkane]="$red ^,^"
alldistros[artix]="$blue />\\"
alldistros[bazzite]="$purple Γ+)" #?
alldistros[blackarch]="$lightblue /|\\"
alldistros[blendos]="$green (B)"
alldistros[bodhi]="$green '\'" #?
alldistros[cachyos]="$green C:\`" #?
alldistros[centos]="$blue <+>"
alldistros[centos_stream]="$blue <+>"
alldistros[chimera]="$red °w°"
alldistros[clear-linux-os]="$lightblue |\Γ" #?
alldistros[debian]="$red (@)"
alldistros[Deepin]="$lightblue (%)" #?
alldistros[devuan]="$red >cv" #?
alldistros[dragonfly]="$red =I="
alldistros[elementary]="$lightblue (e)"
alldistros[endeavouros]="$purple |D)"
alldistros[endless]="$yellow d\p"
alldistros[eurolinux]="$blue (-)" #?
alldistros[exherbo]="$white °o°"
alldistros[fedora]="$blue (f)"
alldistros[fedoraremixforwsl]="$blue (f)"
alldistros[freebsd]="$red ^O^"
alldistros[funtoo]="$purple f°°"
alldistros[garuda]="$blue o\`>"
alldistros[gentoo]="$gray >°>"
alldistros[ghostbsd]="$blue (G)" #?
alldistros[gnoppix]="$blue (G)" #?
alldistros[hyperbola]="$white /H/"
alldistros[kali]="$lightblue 3c\`" #?
alldistros[kaos]="$blue l<.?"
alldistros[linuxmint]="$green lm)"
alldistros[mageia]="$blue (°)" #?
alldistros[manjaro]="$green (M)" #?
alldistros[manjaro-arm]="$green (M)" #?
alldistros[miraclelinux]="$green l|l"
alldistros[neon]="$lightblue (•)"
alldistros[nilrt]="$green [n]"
alldistros[nixos]="$blue <=>" #?
alldistros[nobara]="$white n•>"
alldistros[ol]="$red (_)" #?
alldistros[omnios]="$white \\\`>" #?
alldistros[openmandriva]="$blue ((o"
alldistros[opensuse]="$green @n>"
alldistros[suse]="$green @n>"
alldistros[opensuse-leap]="$green \\^/"
alldistros[opensuse-tumbleweed]="$lightblue o/o"
alldistros[openwrt]="$lightblue (V)" #?
alldistros[parrot]="$green <\\^"
alldistros[pclinuxos]="$blue (v)" #?
alldistros[pengwin]="$purple (p)" #?
alldistros[photon]="$gray (:)"
alldistros[pisilinux]="$purple ^v^"
alldistros[pop]="$lightblue P!_"
alldistros[pureos]="$blue POS" #?
alldistros[rebornos]="$lightblue <X>"
alldistros[redox-os]="$lightblue (R)"
alldistros[rhel]="$red _n_"
alldistros[rocky]="$green (/,)"
alldistros[slackware]="$lightblue (S)"
alldistros[sled]="$green @n>"
alldistros[sles]="$green @n>"
alldistros[solaris]="$red \\|/"
alldistros[solus]="$blue |\\)"
alldistros[steamos]="$blue •))"
alldistros[tails]="$purple :Dc"
alldistros[tinycore]="$gray (/)"
alldistros[trisquel]="$blue @Y@"
alldistros[ubuntu]="$yellow {•}"
alldistros[ultramarine]="$blue (;)" #?
alldistros[vanillaos]="$yellow >*<"
alldistros[virtuozzo]="$red ?\\z/"
alldistros[void]="$green (\\)"
alldistros[wolfi]="$red	,O,"
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

# Find distro(s) and send to output
for key in "${!alldistros[@]}" ; do
    set -- ${alldistros[$key]}
    # If in 'all' mode
    if [[ "$distro_id" == "all" ]] ; then
        cat <<EOF
  $1$2  ${key}${reset}
EOF
    # If distro has a match
    elif [[ "$distro_id" == "$key" ]] ; then
        # If it's a match from the argument
        if [[ "$distro_name" == "" ]] ; then
            cat <<EOF

  $1$2  ${key}${reset}
        
EOF
            exit
        # Otherwise, print the full fetch based on the user system
        else
            cat <<EOF

  $1$2  ${distro_name} ${bold}${gray}:: ${white}${USER}${gray}@${white}${HOST} ${gray}:: ${white}${distro_kernel} ${gray}:: ${white}${UPS}s${reset}

EOF
        fi
        exit
    fi
done

exit
