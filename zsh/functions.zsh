# ==============================================================================
# Custom Zsh Functions
# ==============================================================================
# This file contains a collection of custom Zsh functions to improve productivity
# and streamline various tasks. Each function includes a description of its
# purpose and usage.
# ==============================================================================

# ==============================================================================
# Function Definitions
# ==============================================================================

# Add a pattern to .gitignore
function gitignore() {
    echo $1 >> .gitignore
}

# Search for a pattern recursively in the current directory
function search() {
    echo "searching for '$1'"
    rg -Sni --text --color=always  "$1" .
}

# Reindex macOS Spotlight
function reindex() {
    sudo mdutil -Ea
    sudo mdutil -ai off
    sudo mdutil -ai on
}

# Change directory and list files
function cl() {
    cd $1
    ls -la
}

# Create a directory and enter it
function mkcd() {
    mkdir -p $1
    cd $1
}

# Unmount a disk
function unmount() {
    diskutil unmount $1
}

# Parse build number using a specific script
function parsebuild() {
    ~/fba/fbandroid/scripts/aloha/parseBuildNumber.sh $1
}

# Get app version from an Android device
function appversion() {
    adb shell dumpsys package $1 | grep versionName
}

# Set PUNT configuration and start adb logcat with PUNT
function punt-cs() {
export PUNT_CONFIG="~/code/punt_config/punt_comp"
cat ~/code/punt_config/punt_comp
adb logcat | punt
}

# Remove all files in a directory
function zap() {
    mkdir -p ~/empty
    rsync -a --delete --progress ~/empty/ $1
    rm -rf ~/empty
    rm -rf $1
}

# Show Mercurial log with a custom format
function hgl() {
    if [ -n "$1" ]; then
        hg log -l $1 --template '{node|short} {author|user} {desc|strip|firstline}\n'
    else
        hg log --template '{node|short} {author|user} {desc|strip|firstline}\n'
    fi
}

# Download a video using yt-dlp
function ytdl() {
    pushd ~/Videos
    yt-dlp -v -N 4 --buffer-size 16000 --restrict-filenames "$1"
    popd
}

# Download a playlist using yt-dlp
function ytdlp() {
    pushd ~/Videos
    mkdir $1
    pushd $1
    yt-dlp -v -N 4 --buffer-size 16000 --restrict-filenames --yes-playlist $2
    popd
    popd
}

# Copy a file to a server
function cp2server() {
    scp $1 $FB_DEV_SERVER":."
}

# Copy a file from a server
function cp4mserver() {
    scp $FB_DEV_SERVER:$1 $2
}

# Compile and run a Nim program
function nimr() {
    IFS=\. read -A fields <<<"$1"
    echo $fields[1]
    nim c $1
    $fields[1]
}

# Create an alias for the last executed command
function alias_last_command() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: alias_last_command <alias_name>"
        return 1
    fi
    local alias_name="$1"
    local last_command=$(fc -ln -1)
    echo "alias $alias_name=\"$last_command\"" >> ~/code/dotfile/aliases.zsh
    echo "Alias '$alias_name' created for '$last_command'"
}

# Print text with colors
function color_print() {
    local colors=(31 32 33 34 35 36 37)
    local words=("${(@s/ /)1}")
    local i=0
    for word in "${words[@]}"; do
        local color=${colors[i]}
        echo -ne "\e[${color}m${word}\e[0m "
        i=$(( (i + 1) % ${#colors} ))
    done
    echo -ne "\n\c"
}

# Convert a file to use Unix newlines
function convert-file-to-unix-newline() {
cat $1 | tr '\r' '\n' | tr -s '\n' > $2
}

# Set up and connect to VPN
function vpn-up() {
export TF_VAR_public_ip=$PUBLIC_IP
echo "PUBLIC IP: $TF_VAR_public_ip"
unset AWS_REGION
unset AWS_DEFAULT_REGION
export AWS_PROFILE=default
export AWS_DEFAULT_REGION=$1
export TF_VAR_region=$1
cd ~/code/terraform-aws-openvpn-ephemeral/examples/default-instance-size
terragrunt init --terragrunt-non-interactive
terragrunt apply -auto-approve
mv openvpn.ovpn ~
cd ~
open openvpn.ovpn
}

# Disconnect VPN and clean up
function vpn-down() {
export AWS_PROFILE=default
export AWS_DEFAULT_REGION=$1
export TF_VAR_region=$1
cd ~
rm *.ovpn
cd ~/code/terraform-aws-openvpn-ephemeral/examples/default-instance-size
terragrunt destroy -auto-approve
rm -rf .terraform && rm -rf .terraform.lock.hcl
}

# SSH into an AWS instance
function aws-ssh() {
ssh -i ~/.ssh/champion_rsa ubuntu@$1
}

function git-dirty() {
local search_path="${1:-.}"

for dir in "$search_path"/**/.git(/:h); do
    if ! git -C "$dir" diff-index --quiet HEAD --; then
        echo "$dir"
    fi
done
}

# Set up toggle directories
function toggle-setup() {
if [ "$#" -ne 2 ]; then
    echo "Usage: toggle-setup <dir1> <dir2>"
    return 1
fi
mkdir -p ~/.toggle
echo "$1" > ~/.toggle/config
echo "$2" >> ~/.toggle/config
}

# Toggle between two directories
function toggle() {
    if [ ! -f ~/.toggle/config ]; then
        echo "Toggle directories not set. Use toggle-setup to configure."
        return 1
    fi
    local dirs
    IFS=$'\n' dirs=($(<~/.toggle/config))
    local dir1="${dirs[0]}"
    local dir2="${dirs[1]}"
    if [ -z "$TOGGLE_LAST_DIR" ] || [ "$TOGGLE_LAST_DIR" = "$dir2" ]; then
        cd "$dir1"
        export TOGGLE_LAST_DIR="$dir1"
    else
        cd "$dir2"
        export TOGGLE_LAST_DIR="$dir2"
    fi
}

# extract various file formats
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Calculator
function calc() {
    echo "$*" | bc -l
}

# Make a directory and change to it
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

#Pretty JSON
function json_pretty() {
    python -m json.tool < "$1" | pygmentize -l json
}


# Function to copy the full contents of a directory with progress
# Example usage
# copyd /path/to/source /path/to/destination
#
function copyd() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: copyd <source_directory> <destination_directory>"
        return 1
    fi

    local source_directory="$1"
    local destination_directory="$2"

    if [ ! -d "$source_directory" ]; then
        echo "Error: Source directory does not exist."
        return 1
    fi

    total_size=$(du -sk "$source_directory" | awk '{print $1}')
    total_size=$((total_size * 1024))  # Convert from kilobytes to bytes

    rsync -av --progress "$source_directory"/ "$destination_directory" | pv -s $total_size > /dev/null

    if [ $? -eq 0 ]; then
        echo "Contents copied successfully from $source_directory to $destination_directory."
    else
        echo "Error occurred while copying contents."
        return 1
    fi
}


gpt() {
    # Help function
    show_help() {
        echo "Usage: gpt <command> <url>"
        echo "Options:"
        echo "  -h, --help    Show this help message"
        echo "  -yt           Use 'yt' command instead of 'http' (for YouTube URLs)"
        echo "Example: gpt summarize https://example.com"
    }

    # Check for help option
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        show_help
        return 0
    fi

    # Check if we have the correct number of arguments
    if [[ $# -lt 2 ]]; then
        echo "Error: Insufficient arguments"
        show_help
        return 1
    fi

    local command=$1
    local url=$2
    local fetch_cmd="http"

    # Check for -yt option
    if [[ "$1" == "-yt" ]]; then
        fetch_cmd="yt"
        command=$2
        url=$3
    fi

    # Check if required commands are available
    for cmd in $fetch_cmd fabric pbcopy; do
        if ! command -v $cmd &> /dev/null; then
            echo "Error: Required command '$cmd' not found"
            return 1
        fi
    done

    # Execute the command and store the output
    local output
    if output=$($fetch_cmd "$url" | fabric -sp "$command" 2>&1); then
        # If successful, print the output and copy to clipboard
        echo "$output"
        echo "$output" | pbcopy
        echo "Output has been copied to clipboard."
    else
        # If there's an error, display it
        echo "Error: $output"
        return 1
    fi
}


# git repository greeter
last_repository=
check_directory_for_new_repository() {
    current_repository=$(git rev-parse --show-toplevel 2> /dev/null)

    if [ "$current_repository" ] && \
        [ "$current_repository" != "$last_repository" ]; then
            onefetch
    fi
    last_repository=$current_repository
}

cd() {
    builtin cd "$@"
    check_directory_for_new_repository
}

cachedcurl() {
    # Check if correct number of arguments is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: cachedcurl <url> <cache_file>"
        return 1
    fi

    local url="$1"
    local cache_file="$2"
    local max_age=300  # 5 minutes in seconds

    # Check if the cache file exists and is less than 5 minutes old
    if [ -f "$cache_file" ] && [ $(($(date +%s) - $(date -r "$cache_file" +%s))) -lt $max_age ]; then
        # Cache is fresh, cat the file
        cat "$cache_file"
    else
        # Cache is stale or doesn't exist, make a curl call
        curl -s "$url" | tee "$cache_file"
    fi
}

# Weather
function weather() {
    local location=${1:-Barnes}
    curl "wttr.in/$location"
}

brew_recent_installs() {
    local num_items=${1:-10}  # Default to 10 items if no argument is provided

    (brew list --formula | xargs -n1 -I{} sh -c 'echo "$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$(brew --prefix)/Cellar/{}")/{}:formula"' && \
        brew list --cask | xargs -n1 -I{} sh -c 'echo "$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$(brew --prefix)/Caskroom/{}")/{}:cask"') | \
        sort -r | head -n "$num_items" | column -t -s '/'
    }
