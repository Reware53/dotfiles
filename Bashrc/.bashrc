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

#ls improved with eza
alias ls="eza -a --color=always --group-directories-first" 
alias la="eza -a --color=always --group-directories-first"
alias l.="eza -a | grep "^\.""
#more 
alias ll='eza -l --color=always --group-directories-first --sort=size'  
alias lt='eza -aT --color=always --group-directories-first'

#AUR
alias aur="pacman -Qm"
alias aurup="paru -Syu --aur"

#Other

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#Gives you what is using the most space. Both directories and files. Varies on current directory
alias most='du -hsx * | sort -rh | head -10'

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

# Find files with case-insensitive name search
alias ff="find . type f -iname"

# Show disk usage summary
alias usage='du -ch | grep total'

# Prompt before confirmartion
alias rm="rm -i"
alias mv="mv -i"

# Fetch HN news headlines
#alias hnews="curl hkkr.in" its broke
# Check XMR exchange rate
#alias xmr="curl rate.sx/xmr"
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

#alias stream="bun webtorrent --playlist -o """/home/re/Videos/other/" --mpv "

# yt-dlp aliases
alias yt-aac="yt-dlp -x --audio-format aac -o '%(title)s.%(ext)s'"
alias yt-flac="yt-dlp -x --audio-format flac -o '%(title)s.%(ext)s'"
alias yt-mp3="yt-dlp -o '/run/media/re/leonardo/yt-dlp/%(title)s.%(ext)s' -x --audio-format mp3 --embed-thumbnail"
alias yt-opus="yt-dlp -x --audio-format opus -o '%(title)s.%(ext)s'"
alias yt-vorbis="yt-dlp -x --audio-format vorbis -o '%(title)s.%(ext)s'"
alias yt-wav="yt-dlp -x --audio-format wav -o '%(title)s.%(ext)s'"
alias yt-thumb='yt-dlp --skip-download --write-thumbnail -o "./%(title)s.%(ext)s"'

# Best video and audio quality
alias yt-best='yt-dlp -o "/home/re/Videos/yt-dlp/%(title)s.%(ext)s" -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]" --embed-thumbnail --merge-output-format mp4'

# Download entire YouTube channel
alias yt-channel='yt-dlp -o "/home/re/Videos/channels/%(uploader)s [%(channel_id)s]/%(title)s [%(id)s].%(ext)s" -f "bv*[height>=720]+ba" --merge-output-format mp4 --embed-thumbnail --embed-metadata --embed-subs --download-archive finished.txt -i'

# Download entire YouTube playlist
alias yt-playlist='yt-dlp -o "/home/re/Videos/playlist/%(playlist_title)s/%(playlist_index)s - %(title)s [%(id)s].%(ext)s" -f "bv*[height=1080]+ba" --merge-output-format mkv --embed-thumbnail --write-subs'


#export EDITOR=nvim 
#export EDITOR=vim 
export EDITOR=helix

alias hx="helix"
#alias vim="nvim"
#alias sudo="doas"

alias neofetch="fastfetch"

export VISUAL=helix
export EDITOR=helix

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

function bitrate() {
    local filename="$1"
    local bitrate=$(ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$filename") && \
    local bitrate_mbps=$(echo "scale=6; $bitrate/1000000" | bc) && \
    echo "$bitrate_mbps Mbps"
}
