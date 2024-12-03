#!/bin/bash

# Update package managers and install Git if not already installed
if command -v pkg >/dev/null 2>&1; then
    pkg update && pkg install -y git
elif command -v apt-get >/dev/null 2>&1; then
    apt-get update && apt-get install -y git
elif command -v apt-cyg >/dev/null 2>&1; then
    apt-cyg install git
else
    echo "No supported package manager found. Exiting..."
    exit 1
fi

# Clone repositories if not already cloned
for repo in GRS Sshot Pentagone-Toolkit loctrac; do
    if [ ! -d "$repo" ]; then
        echo "Cloning $repo..."
        git clone https://github.com/Trabbit0ne/$repo.git
        echo "Successfully cloned $repo."
    else
        echo "$repo already exists. Skipping clone."
    fi
done

# Run setup scripts if available
for repo in GRS Sshot Pentagone-Toolkit loctrac; do
    if [ -d "$repo" ]; then
        cd "$repo"
        setup_script=$(find . -name "*.sh" | head -n 1)
        if [ -n "$setup_script" ]; then
            chmod +x "$setup_script"
            echo "Setup script for $repo found. Skipping execution of the tool."
        else
            echo "No setup script found for $repo."
        fi
        cd ..
    fi
done

# Clear the terminal and display a banner
clear
echo -e "\e[42m PENTAGONE LAUNCHER INSTALLED \e[0m"
