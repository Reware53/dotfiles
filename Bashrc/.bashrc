#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return
alias ls='ls --color=auto'

#Pacman Shortcuts
alias sync="sudo pacman -Syyy"
alias update="sudo pacman -Syyu"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"

#AUR
alias aur="pacman -Qm"
alias aurup="paru -Syu --aur"

#Other

# Clear terminal
alias cl="clear"

# Extract tar.xz files and tar.gz files
alias tarxz="tar -xf"
alias untar="tar -zxvf"

# Calculate SHA-256 checksum
alias sha="shasum -a 256"

# Get public IP address
alias myip="curl ipinfo.io/ip"
alias myip2="curl ip.tyk.nu"

#List Files
# List files with human-readable sizes and directories first, colored output
alias ls="ls -hN --color=auto --group-directories-first"

# List files with human-readable sizes, sorted by size, and classify them by type
alias lt="ls --human-readable --size -l -S --classify"

# List all files, including hidden files
alias la="ls -lisA"

# Find files with case-insensitive name search
alias ff="find . type f -iname"

# Show disk usage summary
alias usage='du -ch | grep total'

# Show total disk space usage
alias totalusage='df -hl --total | grep total'

# Prompt before deleting files
alias rm="rm -i"

# Fetch HN news headlines
alias hnews="curl hkkr.in"

# Check XMR exchange rate
alias xmr="curl rate.sx/xmr"

# Check cryptocurrency exchange rates
alias crypto="curl rate.sx"

# Create parent directories if they don't exist
alias mkdir='mkdir -pv'

#cd 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#alias back="cd -"
#webtorrent

alias stream="webtorrent --playlist -o """/home/re/Videos/other/" --mpv "

# yt-dlp

#alias yt-aac="yt-dlp --extract-audio --audio-format aac "
#alias yt-flac="yt-dlp --extract-audio --audio-format flac "
alias yt-mp3="yt-dlp -P "/run/media/re/leonardo/yt-dlp/" -f 'ba' -x --audio-format mp3 --embed-thumbnail"
#alias yt-opus="yt-dlp --extract-audio --audio-format opus "
#alias yt-vorbis="yt-dlp --extract-audio --audio-format vorbis "
#alias yt-wav="yt-dlp --extract-audio --audio-format wav "
alias yt-best="yt-dlp -P "/run/media/re/leonardo/yt-dlp/" -f 'bv[height=1080][ext=mp4]+ba[ext=m4a]' --merge-output-format mp4"
alias yt-channel="yt-dlp -P "/home/re/Videos/channels/" -f 'bv*[height>=720]+ba' --merge-output-format mp4 --embed-thumbnail --embed-metadata --download-archive finished.txt"
alias yt-playlist="yt-dlp -P "/home/re/Videos/playlist/" -f 'bv*[height=1080]+ba' --merge-output-format mkv --embed-thumbnail --write-subs"

#export EDITOR=nvim 
#export EDITOR=vim 
export EDITOR=helix
