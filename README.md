# PG-Launcher 🚀
### Setup For Installing Pentagone Group Launcher Tools
[![YouTube Channel](https://img.shields.io/badge/YouTube-Channel-red)](https://www.youtube.com/@TrabbitOne)


## Tools
``Pentagone-Toolkit``, ``Loctrac (Text-Only)``, ``Sshot`` and ``GRS``

## Installation (Single Line Installation)
```
clear; echo -e "\e[42m SETUP \e[0m"; (command -v pkg >/dev/null 2>&1 && pkg update && pkg install -y git) || (command -v apt-get >/dev/null 2>&1 && apt-get update && apt-get install -y git) || (command -v apt-cyg >/dev/null 2>&1 && apt-cyg install git) && for repo in GRS Sshot Pentagone-Toolkit loctrac; do [ ! -d "$repo" ] && echo "Cloning $repo..." && git clone https://github.com/Trabbit0ne/$repo.git || echo "$repo already exists. Skipping clone."; done && for repo in GRS Sshot Pentagone-Toolkit loctrac; do [ -d "$repo" ] && cd $repo && setup_script=$(find . -name "*.sh" | head -n 1) && [ -n "$setup_script" ] && chmod +x "$setup_script" && echo "Setup script for $repo found. Skipping execution of the tool." || echo "No setup script found for $repo."; cd ..; done; cd Pentagone-Toolkit; chmod +x setup.sh; ./setup.sh; clear; echo -e "\e[42m PENTAGONE LAUNCHER INSTALLED \e[0m"
```
