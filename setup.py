import os
import subprocess
import platform

def run_command(command):
    result = subprocess.run(command, shell=True, check=True, text=True, capture_output=True)
    return result.stdout.strip()

def is_mac():
    return platform.system() == "Darwin"

def is_linux():
    return platform.system() == "Linux"

def setup_oh_my_zsh():
    try:
        run_command("which omz")
    except subprocess.CalledProcessError:
        run_command('/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"')

def setup_symlinks(home, dotfiles):
    zshrc_path = os.path.join(home, ".zshrc")
    if os.path.exists(zshrc_path):
        os.remove(zshrc_path)
    os.symlink(os.path.join(dotfiles, ".zshrc"), zshrc_path)

    vim_path = os.path.join(home, ".vim")
    if os.path.exists(vim_path):
        os.remove(vim_path)
    os.symlink(os.path.join(dotfiles, "vim"), vim_path)

def setup_homebrew(home, dotfiles):
    try:
        run_command("which brew")
    except subprocess.CalledProcessError:
        run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
        with open(os.path.join(home, ".zprofile"), "a") as zprofile:
            zprofile.write('eval "$(/opt/homebrew/bin/brew shellenv)"\n')
        run_command('eval "$(/opt/homebrew/bin/brew shellenv)"')

    print("brew is updating...")
    run_command("brew update")
    run_command("brew tap homebrew/bundle")
    run_command(f"brew bundle --file {os.path.join(dotfiles, 'Brewfile')}")

def clone_repositories(dotfiles):
    run_command(os.path.join(dotfiles, "clone.sh"))

def setup_macos_preferences(dotfiles):
    run_command(f"source {os.path.join(dotfiles, '.macos')}")

def main():
    print("Setting up your system...")
    home = os.path.expanduser("~")
    dotfiles = os.path.join(home, "code", "dotfiles")
    print(f"DOTFILES is at {dotfiles}")

    if not is_linux():
        setup_oh_my_zsh()

    setup_symlinks(home, dotfiles)

    if is_mac():
        print("Mac detected, doing the homebrew bits")
        setup_homebrew(home, dotfiles)

    clone_repositories(dotfiles)
    print("run source $HOME/code/zsh-snap/install.zsh")

    if is_mac():
        setup_macos_preferences(dotfiles)

if __name__ == "__main__":
    main()
