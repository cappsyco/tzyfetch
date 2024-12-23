#!/usr/bin/env bash

# Function to display help text
Help() {
    cat <<EOF

tzyfetch is an extremely simple fetch utility, built for a single line output with a three-character distro logo.
Default behavior returns the logo and name of your distro, plus system and session-specific information.

Usage:
  tzyfetch [options]

Options:
  -h, --help        Display this help message.
  -d, --distro [ID] Return the logo and name for a specific distro ID.
  -d, --distro all  Print the logos and names for all distros tzyfetch knows about.
  -t, --time        Display uptime in a human-readable format.

EOF
}

# Function to get system information
GetSystemInfo() {
	HOST=$(< /proc/sys/kernel/hostname)
    KERNEL=$(< /proc/sys/kernel/osrelease)
    UPTIME_SECONDS=$(cut -d. -f1 /proc/uptime)
}

# Function to convert seconds to human-readable format
ConvertUptime() {
    local total_seconds=$1
    local days=$((total_seconds / 86400))
    local hours=$(( (total_seconds % 86400) / 3600 ))
    local minutes=$(( (total_seconds % 3600) / 60 ))
    local seconds=$((total_seconds % 60))

    if (( days > 0 )); then
        echo "${days}d ${hours}h"
    elif (( hours > 0 )); then
        echo "${hours}h ${minutes}m"
    elif (( minutes > 0 )); then
        echo "${minutes}m ${seconds}s"
    else
        echo "${seconds}s"
    fi
}

# Function to print distro information
PrintDistroInfo() {
    local logo=$1
    local name=$2
    local user=$3
    local host=$4
    local kernel=$5
    local uptime=$6

    echo ""
    echo -e "  ${logo}  ${name} ${bold}${gray}:: ${white}${user}${gray}@${white}${host} ${gray}:: ${white}${kernel} ${gray}:: ${white}${uptime}${reset}"
    echo ""
}

# Function to print distros
PrintDistros() {
    local distro_id=$1
    echo ""
    if [[ "$distro_id" == "all" ]]; then
        for key in "${order[@]}"; do
            echo -e "  ${alldistros[$key]}  ${key}${reset}"
        done
    elif [[ -n "${alldistros[$distro_id]}" ]]; then
        echo -e "  ${alldistros[$distro_id]}  ${distro_id}${reset}"
    else
        echo -e "  ${gray}?_?  GNUthing to see here${reset}"
    fi
    echo ""
    exit
}

# Main Script

# Styles
bold='\033[1m'
reset='\033[0m'

# Bold colours
black='\033[1;30m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
purple='\033[1;35m'
cyan='\033[1;36m'
white='\033[1;37m'
gray='\033[1;90m'
lightred='\033[1;91m'
lightgreen='\033[1;92m'
lightyellow='\033[1;93m'
lightblue='\033[1;94m'
lightmagenta='\033[1;95m'
lightcyan='\033[1;96m'

# Distro config
declare -A alldistros
declare -a order

# Add distros
order+=("adelie") ; alldistros[adelie]=$red"_/\`"
order+=("almalinux") ; alldistros[almalinux]=$blue"{X}"
order+=("alpine") ; alldistros[alpine]=$blue"<^>"
order+=("altlinux") ; alldistros[altlinux]=$yellow"r,l"
order+=("amzn") ; alldistros[amzn]=$yellow"|Y|"
order+=("anarchy") ; alldistros[anarchy]=$blue"/-\\"
order+=("anduinos") ; alldistros[anduinos]=$blue"<•>"
order+=("arch") ; alldistros[arch]=$blue"/.\\"
order+=("arch32") ; alldistros[arch32]=$blue"/.\\"
order+=("archbang") ; alldistros[archbang]=$green"/!\\"
order+=("archcraft") ; alldistros[archcraft]=$blue"/x\\"
order+=("archman") ; alldistros[archman]=$red"/*\\"
order+=("arcolinux") ; alldistros[arcolinux]=$blue"/,\\"
order+=("arkane") ; alldistros[arkane]=$red"^,^"
order+=("artix") ; alldistros[artix]=$blue"/>\\"
order+=("aurora") ; alldistros[aurora]=$red"/'\\"
order+=("bazzite") ; alldistros[bazzite]=$purple"Γ+)"
order+=("blackarch") ; alldistros[blackarch]=$lightblue"/|\\"
order+=("blendos") ; alldistros[blendos]=$green"(B)"
order+=("bluefin") ; alldistros[bluefin]=$blue",f'"
order+=("bodhi") ; alldistros[bodhi]=$green"'\\"
order+=("cachyos") ; alldistros[cachyos]=$green"C:\`"
order+=("centos") ; alldistros[centos]=$blue"<+>"
order+=("centos_stream") ; alldistros[centos_stream]=$blue"<+>"
order+=("chimera") ; alldistros[chimera]=$red"[cL"
order+=("chimeraos") ; alldistros[chimeraos]=$red"°w°"
order+=("chromeos") ; alldistros[chromeos]=$blue"(o)"
order+=("clear-linux-os") ; alldistros[clear-linux-os]=$lightblue"|Γ"
order+=("debian") ; alldistros[debian]=$red"(@)"
order+=("Deepin") ; alldistros[Deepin]=$lightblue"(%)"
order+=("devuan") ; alldistros[devuan]=$red">cv"
order+=("dragonfly") ; alldistros[dragonfly]=$red"=I="
order+=("elementary") ; alldistros[elementary]=$lightblue"(e)"
order+=("endeavouros") ; alldistros[endeavouros]=$purple"|D)"
order+=("endless") ; alldistros[endless]=$yellow"d\\p"
order+=("eurolinux") ; alldistros[eurolinux]=$blue"(-)"
order+=("exherbo") ; alldistros[exherbo]=$white"°o°"
order+=("fedora") ; alldistros[fedora]=$blue"(f)"
order+=("fedoraremixforwsl") ; alldistros[fedoraremixforwsl]=$blue"(f)"
order+=("freebsd") ; alldistros[freebsd]=$red"^O^"
order+=("funtoo") ; alldistros[funtoo]=$purple"f°°"
order+=("garuda") ; alldistros[garuda]=$blue"o\`>"
order+=("gentoo") ; alldistros[gentoo]=$gray">°>"
order+=("ghostbsd") ; alldistros[ghostbsd]=$blue"(G)"
order+=("gnoppix") ; alldistros[gnoppix]=$blue"(G)"
order+=("guix") ; alldistros[guix]=$yellow"\`V\`"
order+=("hyperbola") ; alldistros[hyperbola]=$white"/H/"
order+=("kali") ; alldistros[kali]=$lightblue"3c\`"
order+=("kaos") ; alldistros[kaos]=$blue"l<."
order+=("linuxmint") ; alldistros[linuxmint]=$green"lm)"
order+=("mageia") ; alldistros[mageia]=$blue"(°)"
order+=("manjaro") ; alldistros[manjaro]=$green"(M)"
order+=("manjaro-arm") ; alldistros[manjaro-arm]=$green"(M)"
order+=("miraclelinux") ; alldistros[miraclelinux]=$green"l|l"
order+=("neon") ; alldistros[neon]=$lightblue"(•)"
order+=("nilrt") ; alldistros[nilrt]=$green"[n]"
order+=("nixos") ; alldistros[nixos]=$blue"<=>"
order+=("nobara") ; alldistros[nobara]=$white"n•>"
order+=("ol") ; alldistros[ol]=$red"(_)"
order+=("omnios") ; alldistros[omnios]=$white"\\\`>"
order+=("openmandriva") ; alldistros[openmandriva]=$blue"((o"
order+=("opensuse") ; alldistros[opensuse]=$green"@n>"
order+=("suse") ; alldistros[suse]=$green"@n>"
order+=("opensuse-leap") ; alldistros[opensuse-leap]=$green"\\^/"
order+=("opensuse-tumbleweed") ; alldistros[opensuse-tumbleweed]=$lightblue"o/o"
order+=("openwrt") ; alldistros[openwrt]=$lightblue"(V)"
order+=("parrot") ; alldistros[parrot]=$green"<\\^"
order+=("pclinuxos") ; alldistros[pclinuxos]=$blue"(v)"
order+=("pengwin") ; alldistros[pengwin]=$purple"(p)"
order+=("photon") ; alldistros[photon]=$gray"(:)"
order+=("pika") ; alldistros[pika]=$yellow"•,•"
order+=("pisilinux") ; alldistros[pisilinux]=$purple"^v^"
order+=("pop") ; alldistros[pop]=$lightblue"P!_"
order+=("puppy") ; alldistros[puppy]=$blue":>}"
order+=("pureos") ; alldistros[pureos]=$blue"POS"
order+=("raspbian") ; alldistros[raspbian]=$red"'O'"
order+=("rebornos") ; alldistros[rebornos]=$lightblue"<X>"
order+=("redox-os") ; alldistros[redox-os]=$lightblue"(R)"
order+=("rhel") ; alldistros[rhel]=$red"_n_"
order+=("rocky") ; alldistros[rocky]=$green"(/,"
order+=("slackware") ; alldistros[slackware]=$lightblue"(S)"
order+=("sled") ; alldistros[sled]=$green"@n>"
order+=("sles") ; alldistros[sles]=$green"@n>"
order+=("solaris") ; alldistros[solaris]=$red"\\|/"
order+=("solus") ; alldistros[solus]=$blue"|\\)"
order+=("steamos") ; alldistros[steamos]=$purple"•))"
order+=("tails") ; alldistros[tails]=$purple":Dc"
order+=("tencent") ; alldistros[tencent]=$red"\\//"
order+=("tinycore") ; alldistros[tinycore]=$gray"(/)"
order+=("trisquel") ; alldistros[trisquel]=$blue"@Y@"
order+=("ubuntu") ; alldistros[ubuntu]=$yellow"{•}"
order+=("ultramarine") ; alldistros[ultramarine]=$blue"(;)"
order+=("vanillaos") ; alldistros[vanillaos]=$yellow">*<"
order+=("virtuozzo") ; alldistros[virtuozzo]=$red"\\z/"
order+=("void") ; alldistros[void]=$green"(\\)"
order+=("wolfi") ; alldistros[wolfi]=$red",O,"
order+=("zorin") ; alldistros[zorin]=$blue"<Z>"

# Parse arguments
human_readable_uptime=false
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -h|--help)
        	if [[ -n "$2" ]]; then
         		echo -e "\n  ${gray}?_?  $1 doesn't accept any arguments${reset}\n"
           		exit 1
           	else
            	Help
             	exit 0
            fi
            ;;
        -d|--distro)
            if [[ -n "$2" ]]; then
                distro_id="$2"
                shift 2
            else
                echo -e "\n  ${gray}?_?  $1 requires an argument${reset}\n"
                exit 1
            fi
            ;;
        -t|--time)
       		if [[ -n "$2" ]]; then
        		echo -e "\n  ${gray}?_?  $1 doesn't accept any arguments${reset}\n"
          		exit 1
          	else
         		human_readable_uptime=true
             	shift
            fi
            ;;
        *)
            echo -e "\n  ${gray}?_?  Unknown option: $1${reset}"
            Help
            exit 1
            ;;
    esac
done

# Get system information
GetSystemInfo

# Handle distro argument if provided
if [[ -n "$distro_id" ]]; then
    PrintDistros "$distro_id"
fi

# Set OS info
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
else
    echo -e "\n  ${gray}?_?  /etc/os-release not found. Unable to determine distro${reset}\n"
    exit 1
fi

distro_id="${ID}"
distro_nameid="${NAME,,}"
distro_name="${PRETTY_NAME}"
distro_kernel="${KERNEL}"

# Convert uptime if the flag is set
if $human_readable_uptime; then
    UPTIME=$(ConvertUptime "$UPTIME_SECONDS")
else
    UPTIME="${UPTIME_SECONDS}s"
fi

# Print distro information
if [[ -n "${alldistros[$distro_id]}" ]]; then
    PrintDistroInfo "${alldistros[$distro_id]}" "$distro_name" "$USER" "$HOST" "$distro_kernel" "$UPTIME"
elif [[ -n "${alldistros[$distro_nameid]}" ]]; then
    PrintDistroInfo "${alldistros[$distro_nameid]}" "$distro_name" "$USER" "$HOST" "$distro_kernel" "$UPTIME"
else # If the distro is no recognized it uses the default logo
    PrintDistroInfo ".8." "$distro_name" "$USER" "$HOST" "$distro_kernel" "$UPTIME"
fi
