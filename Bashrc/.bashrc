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

alias cl="clear"
alias tarxz="tar -xf"
alias untar="tar -zxvf"
alias sha="shasum -a 256"
alias myip="curl ipinfo.io/ip"
alias myip2="curl ip.tyk.nu"
alias ls="ls -hN --color=auto --group-directories-first"
alias lt="ls --human-readable --size -l -S --classify"
alias ff="find . type f -iname"
alias la="ls -lisA"
alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'
alias rm="rm -i"
alias hnews="curl hkkr.in"
alias xmr="curl rate.sx/xmr"
alias crypto="curl rate.sx"
#alias vim="nvim"
#alias sudo="doas"
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
