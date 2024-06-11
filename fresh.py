import os
import subprocess
import platform

def run_command(command):
    result = subprocess.run(command, shell=True, check=True, text=True, capture_output=True)
    return result.stdout.strip()

def main():
    print("Setting up your system...")
    home = os.path.expanduser("~")
    dotfiles = os.path.join(home, "code", "dotfiles")
    print(f"DOTFILES is at {dotfiles}")

    if platform.system() != "Linux":
        # Check for Oh My Zsh and install if we don't have it
        try:
            run_command("which omz")
        except subprocess.CalledProcessError:
            run_command('/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"')

    # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
    zshrc_path = os.path.join(home, ".zshrc")
    if os.path.exists(zshrc_path):
        os.remove(zshrc_path)
    os.symlink(os.path.join(dotfiles, ".zshrc"), zshrc_path)

    # Hook up vim
    vim_path = os.path.join(home, ".vim")
    if os.path.exists(vim_path):
        os.remove(vim_path)
    os.symlink(os.path.join(dotfiles, "vim"), vim_path)

    if platform.system() != "Linux":
        print("Mac detected, doing the homebrew bits")
        # Check for Homebrew and install if we don't have it
        try:
            run_command("which brew")
        except subprocess.CalledProcessError:
            run_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
            with open(os.path.join(home, ".zprofile"), "a") as zprofile:
                zprofile.write('eval "$(/opt/homebrew/bin/brew shellenv)"\n')
            run_command('eval "$(/opt/homebrew/bin/brew shellenv)"')

        # Update Homebrew recipes
        print("brew is updating...")
        run_command("brew update")
        # Install all our dependencies with bundle (See Brewfile)
        run_command("brew tap homebrew/bundle")
        run_command(f"brew bundle --file {os.path.join(dotfiles, 'Brewfile')}")

    # Clone Github repositories
    run_command(os.path.join(dotfiles, "clone.sh"))
    print("run source $HOME/code/zsh-snap/install.zsh")

    if platform.system() != "Linux":
        # Set macOS preferences - we will run this last because this will reload the shell
        run_command(f"source {os.path.join(dotfiles, '.macos')}")

if __name__ == "__main__":
    main()
