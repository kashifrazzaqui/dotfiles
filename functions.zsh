
#Functions
function gitignore()
{
    echo $1 >> .gitignore
}

function search() {
    echo "searching for '$1'"
    grep -Rains "$1" .
}

function reindex() {
    #cd /
    #sudo mdutil -E /
    #sudo mdutil -a -i off
    #sudo rm -fr /System/Volumes/Data/.Spotlight-V100/
    #sudo mdutil -i on /System/Volumes/Data
    sudo mdutil -Ea
    sudo mdutil -ai off
    sudo mdutil -ai on
}

function code() {
    cd ~/code/$1
}

#Change directory & list files
function cl() {
    cd $1
    ls -la
}
#Make directory & enter it
function mkcd() {
    mkdir -p $1
    cd $1
}

function unmount()
{
    diskutil unmount $1
}

function parsebuild()
{
    ~/fba/fbandroid/scripts/aloha/parseBuildNumber.sh $1
}

function appversion()
{
    adb shell dumpsys package $1 | grep versionName
}

function punt-cs()
{
    export PUNT_CONFIG="~/code/punt_config/punt_comp"
    cat ~/code/punt_config/punt_comp
    adb logcat | punt
}

function zap()
{
    mkdir -p ~/empty
    rsync -a --delete ~/empty/ $1
    rm -rf ~/empty
    rm -rf $1
}

function hgl() {
    if [ -n "$1" ]
    then
        hg log -l $1 --template '{node|short} {author|user} {desc|strip|firstline}\n'
    else
        hg log --template '{node|short} {author|user} {desc|strip|firstline}\n'
    fi
}

function ytdl() {
    pushd ~/Videos
    yt-dlp -v -N 4 --buffer-size 16000 --restrict-filenames "$1"
    popd
}

function ytdlp() {
    pushd ~/Videos
    mkdir $1
    pushd $1
    yt-dlp -v -N 4 --buffer-size 16000 --restrict-filenames --yes-playlist $2
    popd
    popd
}

function cp2server() {
    scp $1 "kashifr@devvm744.rva0.facebook.com:."
}

function cp4mserver() {
    # Copy a file from server using scp
    scp "kashifr@devvm744.rva0.facebook.com:$1" $2
}

function nimr() {
    # nim r doesn't work because of MacOS SIP issues
    # with DYLD paths being stripped, this fixes that
    IFS=\. read -A fields <<<"$1"
    echo $fields[1]

    nim c $1
    $fields[1]
}

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

function color_print() {
    # Define an array of color codes
    local colors=(31 32 33 34 35 36 37)

    # Split the input into words
    local words=("${(@s/ /)1}")

    # Initialize color index
    local i=0

    # Iterate over each word
    for word in "${words[@]}"; do
        # Select color
        local color=${colors[i]}

        # Print the word with color
        echo -ne "\e[${color}m${word}\e[0m "

        # Increment color index, and wrap around if necessary
        i=$(( (i + 1) % ${#colors} ))
    done
    echo -ne "\n\c"
}

function convert-file-to-unix-newline() {
cat $1 | tr '\r' '\n' | tr -s '\n' > $2
}

function vpn-up() {
export TF_VAR_public_ip=$PUBLIC_IP
echo "PUBLIC IP: $TF_VAR_public_ip"
unset AWS_REGION;
unset AWS_DEFAULT_REGION;
export AWS_PROFILE=default;
export AWS_DEFAULT_REGION=$1;
export TF_VAR_region=$1;
cd ~/code/terraform-aws-openvpn-ephemeral/examples/default-instance-size;
terragrunt init --terragrunt-non-interactive;
terragrunt apply -auto-approve;
mv openvpn.ovpn ~;
cd ~;
open openvpn.ovpn;
}

function vpn-down() {
export AWS_PROFILE=default;
export AWS_DEFAULT_REGION=$1;
export TF_VAR_region=$1;
cd ~;
rm *.ovpn;
cd ~/code/terraform-aws-openvpn-ephemeral/examples/default-instance-size;
terragrunt destroy -auto-approve;
rm -rf .terraform && rm -rf .terraform.lock.hcl;
}

function aws-ssh() {
ssh -i ~/.ssh/champion_rsa  ubuntu@$1
}

