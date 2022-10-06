
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
}

function hgl() {
    if [ -n "$1" ]
    then
        hg log -l $1 --template '{node|short} {author|user} {desc|strip|firstline}\n'
    else
        hg log --template '{node|short} {author|user} {desc|strip|firstline}\n'
    fi
}
