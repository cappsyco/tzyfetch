#!/bin/bash

# Function to display help text
Help()
{
   echo
   echo "tzyfetch is an extremely simple fetch utility, built for a single line output with three character distro logo. Default behaviour will return the logo and name of your distro, plus system and session specific information."
   echo
   echo "Usage:"
   echo "tzyfetch [options]"
   echo
   echo "Options:"
   echo "-h, --help     Hello."
   echo "-d [ID]   		Return the logo and name for a specifically specified distro ID."
   echo "-d all         Print the logos and names for all distros tzyfetch knows about."
   echo
}

# Show help if requested
while getopts ":h" option; do
   case $option in
      h)
         Help
         exit
   esac
done

# Main Script

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
declare -a order

order+=("adelie") ; alldistros[adelie]="$red _/\`"
order+=("almalinux") ; alldistros[almalinux]="$blue {X}"
order+=("alpine") ; alldistros[alpine]="$blue <^>"
order+=("altlinux") ; alldistros[altlinux]="$yellow r,l"
order+=("amzn") ; alldistros[amzn]="$yellow |Y|"
order+=("anarchy") ; alldistros[anarchy]="$blue /-\\"
order+=("anduinos") ; alldistros[anduinos]="$blue <•>"
order+=("arch") ; alldistros[arch]="$blue /.\\"
order+=("arch32") ; alldistros[arch32]="$blue /.\\"
order+=("archbang") ; alldistros[archbang]="$green /!\\"
order+=("archcraft") ; alldistros[archcraft]="$blue /x\\"
order+=("archman") ; alldistros[archman]="$red /*\\"
order+=("arcolinux") ; alldistros[arcolinux]="$blue /,\\"
order+=("arkane") ; alldistros[arkane]="$red ^,^"
order+=("artix") ; alldistros[artix]="$blue />\\"
order+=("bazzite") ; alldistros[bazzite]="$purple Γ+)"
order+=("blackarch") ; alldistros[blackarch]="$lightblue /|\\"
order+=("blendos") ; alldistros[blendos]="$green (B)"
order+=("bodhi") ; alldistros[bodhi]="$green '\'"
order+=("cachyos") ; alldistros[cachyos]="$green C:\`"
order+=("centos") ; alldistros[centos]="$blue <+>"
order+=("centos_stream") ; alldistros[centos_stream]="$blue <+>"
order+=("chimera") ; alldistros[chimera]="$red [cL"
order+=("chimeraos") ; alldistros[chimeraos]="$red °w°"
order+=("chromeos") ; alldistros[chromeos]="$blue (o)"
order+=("clear-linux-os") ; alldistros[clear-linux-os]="$lightblue |\Γ"
order+=("debian") ; alldistros[debian]="$red (@)"
order+=("Deepin") ; alldistros[Deepin]="$lightblue (%)"
order+=("devuan") ; alldistros[devuan]="$red >cv"
order+=("dragonfly") ; alldistros[dragonfly]="$red =I="
order+=("elementary") ; alldistros[elementary]="$lightblue (e)"
order+=("endeavouros") ; alldistros[endeavouros]="$purple |D)"
order+=("endless") ; alldistros[endless]="$yellow d\p"
order+=("eurolinux") ; alldistros[eurolinux]="$blue (-)"
order+=("exherbo") ; alldistros[exherbo]="$white °o°"
order+=("fedora") ; alldistros[fedora]="$blue (f)"
order+=("fedoraremixforwsl") ; alldistros[fedoraremixforwsl]="$blue (f)"
order+=("freebsd") ; alldistros[freebsd]="$red ^O^"
order+=("funtoo") ; alldistros[funtoo]="$purple f°°"
order+=("garuda") ; alldistros[garuda]="$blue o\`>"
order+=("gentoo") ; alldistros[gentoo]="$gray >°>"
order+=("ghostbsd") ; alldistros[ghostbsd]="$blue (G)"
order+=("gnoppix") ; alldistros[gnoppix]="$blue (G)"
order+=("guix") ; alldistros[guix]="$yellow \`V\`"
order+=("hyperbola") ; alldistros[hyperbola]="$white /H/"
order+=("kali") ; alldistros[kali]="$lightblue 3c\`"
order+=("kaos") ; alldistros[kaos]="$blue l<."
order+=("linuxmint") ; alldistros[linuxmint]="$green lm)"
order+=("mageia") ; alldistros[mageia]="$blue (°)"
order+=("manjaro") ; alldistros[manjaro]="$green (M)"
order+=("manjaro-arm") ; alldistros[manjaro-arm]="$green (M)"
order+=("miraclelinux") ; alldistros[miraclelinux]="$green l|l"
order+=("neon") ; alldistros[neon]="$lightblue (•)"
order+=("nilrt") ; alldistros[nilrt]="$green [n]"
order+=("nixos") ; alldistros[nixos]="$blue <=>"
order+=("nobara") ; alldistros[nobara]="$white n•>"
order+=("ol") ; alldistros[ol]="$red (_)"
order+=("omnios") ; alldistros[omnios]="$white \\\`>"
order+=("openmandriva") ; alldistros[openmandriva]="$blue ((o"
order+=("opensuse") ; alldistros[opensuse]="$green @n>"
order+=("suse") ; alldistros[suse]="$green @n>"
order+=("opensuse-leap") ; alldistros[opensuse-leap]="$green \\^/"
order+=("opensuse-tumbleweed") ; alldistros[opensuse-tumbleweed]="$lightblue o/o"
order+=("openwrt") ; alldistros[openwrt]="$lightblue (V)"
order+=("parrot") ; alldistros[parrot]="$green <\\^"
order+=("pclinuxos") ; alldistros[pclinuxos]="$blue (v)"
order+=("pengwin") ; alldistros[pengwin]="$purple (p)"
order+=("photon") ; alldistros[photon]="$gray (:)"
order+=("pika") ; alldistros[pika]="$yellow •,•"
order+=("pisilinux") ; alldistros[pisilinux]="$purple ^v^"
order+=("pop") ; alldistros[pop]="$lightblue P!_"
order+=("puppy") ; alldistros[puppy]="$blue :>}"
order+=("pureos") ; alldistros[pureos]="$blue POS"
order+=("raspbian") ; alldistros[raspbian]="$red 'O'"
order+=("rebornos") ; alldistros[rebornos]="$lightblue <X>"
order+=("redox-os") ; alldistros[redox-os]="$lightblue (R)"
order+=("rhel") ; alldistros[rhel]="$red _n_"
order+=("rocky") ; alldistros[rocky]="$green (/,"
order+=("slackware") ; alldistros[slackware]="$lightblue (S)"
order+=("sled") ; alldistros[sled]="$green @n>"
order+=("sles") ; alldistros[sles]="$green @n>"
order+=("solaris") ; alldistros[solaris]="$red \\|/"
order+=("solus") ; alldistros[solus]="$blue |\\)"
order+=("steamos") ; alldistros[steamos]="$purple •))"
order+=("tails") ; alldistros[tails]="$purple :Dc"
order+=("tencent") ; alldistros[tencent]="$red \//"
order+=("tinycore") ; alldistros[tinycore]="$gray (/)"
order+=("trisquel") ; alldistros[trisquel]="$blue @Y@"
order+=("ubuntu") ; alldistros[ubuntu]="$yellow {•}"
order+=("ultramarine") ; alldistros[ultramarine]="$blue (;)"
order+=("vanillaos") ; alldistros[vanillaos]="$yellow >*<"
order+=("virtuozzo") ; alldistros[virtuozzo]="$red \\z/"
order+=("void") ; alldistros[void]="$green (\\)"
order+=("wolfi") ; alldistros[wolfi]="$red	,O,"
order+=("zorin") ; alldistros[zorin]="$blue <Z>"

# Get host
read -r HOST < /proc/sys/kernel/hostname

# Get kernel
read -r KERNEL < /proc/sys/kernel/osrelease

# Get uptime in seconds
IFS=. read -r s _ < /proc/uptime
UPS=$((s))

# Handle distro argument
if [[ "$1" == "-d" ]] || [[ "$1" == "-distro" ]]; then
    # Set basic info
    distro_id="$2"
    distro_nameid=""
    distro_name=""
    distro_kernel=""
else
    # Set OS info
    source /etc/os-release
    distro_id="${ID}"
    distro_nameid="${NAME,,}"
    distro_name="${PRETTY_NAME}"
    distro_kernel="${KERNEL}"
fi

# Set fallback flag
fallback=true

# Blank top
echo ""

# Find distro(s) and send to output
for key in ${order[@]} ; do
    set -- ${alldistros[$key]}
    # If in 'all' mode
    if [[ "$distro_id" == "all" ]] ; then
		fallback=false
        cat <<EOF
  $1$2  ${key}${reset}
EOF
    # If distro has a match
    elif [[ "$distro_id" == "$key" ]] || [[ "$distro_nameid" == "$key" ]] ; then
        # If it's a match from the argument
        if [[ "$distro_name" == "" ]] ; then
            fallback=false
            cat <<EOF
  $1$2  ${key}${reset}

EOF
            exit
        # Otherwise, print the full fetch based on the user system
        else
            fallback=false
            cat <<EOF
  $1$2  ${distro_name} ${bold}${gray}:: ${white}${USER}${gray}@${white}${HOST} ${gray}:: ${white}${distro_kernel} ${gray}:: ${white}${UPS}s${reset}

EOF
        fi
        exit
    fi
done

# Generic fallback
if [[ "$fallback" == true ]] ; then
	# If it's a failed search
	if [[ "$distro_name" == "" ]] ; then
		cat <<EOF
  ${gray}?_?  GNUthing to see here${reset}

EOF
        exit
	# Must be an unknown distro or LFS
	else
		cat <<EOF
  $1.8.  ${distro_name} ${bold}${gray}:: ${white}${USER}${gray}@${white}${HOST} ${gray}:: ${white}${distro_kernel} ${gray}:: ${white}${UPS}s${reset}

EOF
		exit
	fi
fi

# Blank bottom
echo ""

exit
