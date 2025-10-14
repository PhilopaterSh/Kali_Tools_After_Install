#!/bin/bash




# Author    : Ph.sh (Philopater Shenouda)
# Version   : 13
# Updated   : 2025-09-23
# LinkedIn  : https://www.linkedin.com/in/philopater-shenouda/

# === Colors ===
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# === Password ===
PASSWORD="kali"

# === ZSH Setup and PATH Configuration ===
setup_zsh_path() {
    echo -e "${BLUE}[+] Checking ZSH setup...${NC}"

    # Check if zsh is installed
    if ! command -v zsh &>/dev/null; then
        echo -e "${YELLOW}[!] ZSH is not installed. Please install ZSH for full functionality.${NC}"
        # Optionally, you could add installation instructions here, e.g.:
        # echo $PASSWORD | sudo -S apt install -y zsh
    else
        echo -e "${GREEN}[✓] ZSH is installed.${NC}"
    fi

    # Ensure ~/.zshrc exists
    if [ ! -f "$HOME/.zshrc" ]; then
        echo -e "${YELLOW}[!] ~/.zshrc not found. Creating a basic one.${NC}"
        touch "$HOME/.zshrc"
    else
        echo -e "${GREEN}[✓] ~/.zshrc exists.${NC}"
    fi

    # Add PDTM Go bin path to ~/.zshrc if not already present
    if ! grep -q 'export PATH=$PATH:$HOME/.pdtm/go/bin' "$HOME/.zshrc"; then
        echo -e "${BLUE}[+] Adding PDTM Go bin path to ~/.zshrc...${NC}"
        echo 'export PATH=$PATH:$HOME/.pdtm/go/bin' >> "$HOME/.zshrc"
        echo -e "${GREEN}[✓] PDTM Go bin path added to ~/.zshrc.${NC}"
    else
        echo -e "${GREEN}[✓] PDTM Go bin path already in ~/.zshrc.${NC}"
    fi

    # Source ~/.zshrc to apply changes immediately for the current script's environment
    source "$HOME/.zshrc" >/dev/null 2>&1
}

# === Required Tools ===
REQUIRED_TOOLS=(
    amass anew assetfinder curl dirb dirsearch feroxbuster ffuf figlet gemini
    jsfinder jq nmap nikto update-fingerprints waybacklister wget whatweb hexstrike-ai Ph.Sh-Subdomain
    ghauri dalfox trufflehog findomain
)

PDTM_TOOLS=(
    aix alterx asnmap cdncheck chaos-client cloudlist dnsx httpx
    interactsh-client interactsh-server katana mapcidr naabu notify nuclei
    pdtm proxify shuffledns simplehttpserver subfinder tldfinder tlsx
    tunnelx uncover urlfinder vulnx
)

# === Function: Verify Tool Installations ===

verify_installations() {
    echo "[+] Verifying tool installations..."
    local tools=(
        "amass" "/usr/bin/amass"
        "anew" "/usr/local/bin/anew"
        "assetfinder" "/usr/local/bin/assetfinder"
        "curl" "/usr/bin/curl"
        "dirb" "/usr/bin/dirb"
        "dirsearch" "/usr/local/bin/dirsearch"
        "feroxbuster" "/usr/bin/feroxbuster"
        "ffuf" "/usr/bin/ffuf"
        "figlet" "/usr/bin/figlet"
        "gemini" "/usr/local/bin/gemini"
        "jsfinder" "" # jsfinder might be installed via pipx, so path might vary or not be directly in /usr/local/bin
        "jq" "/usr/bin/jq"
        "nmap" "/usr/bin/nmap"
        "nikto" "/usr/bin/nikto"
        "update-fingerprints" "/usr/local/bin/update-fingerprints"
        "waybacklister" "" # waybacklister might be installed via pipx, so path might vary or not be directly in /usr/local/bin
        "wget" "/usr/bin/wget"
        "whatweb" "/usr/bin/whatweb"
        "ghauri" "/usr/local/bin/ghauri"
        "dalfox" "/usr/local/bin/dalfox"
        "trufflehog" "/usr/local/bin/trufflehog"
        "findomain" "/usr/bin/findomain"
    )
    local go_tools=(
        "aix" "$HOME/.pdtm/go/bin/aix"
        "alterx" "$HOME/.pdtm/go/bin/alterx"
        "asnmap" "$HOME/.pdtm/go/bin/asnmap"
        "cdncheck" "/usr/local/bin/cdncheck" # cdncheck is installed via go install, but its path is /usr/local/bin
        "chaos-client" "$HOME/.pdtm/go/bin/chaos-client"
        "cloudlist" "$HOME/.pdtm/go/bin/cloudlist"
        "dnsx" "/usr/local/bin/dnsx" # dnsx is installed via go install, but its path is /usr/local/bin
        "httpx" "/usr/local/bin/httpx" # httpx is installed via go install, but its path is /usr/local/bin
        "interactsh-client" "$HOME/.pdtm/go/bin/interactsh-client"
        "interactsh-server" "$HOME/.pdtm/go/bin/interactsh-server"
        "katana" "/usr/local/bin/katana" # katana is installed via go install, but its path is /usr/local/bin
        "mapcidr" "$HOME/.pdtm/go/bin/mapcidr"
        "naabu" "$HOME/.pdtm/go/bin/naabu"
        "notify" "$HOME/.pdtm/go/bin/notify"
        "nuclei" "/usr/local/bin/nuclei" # nuclei is installed via go install, but its path is /usr/local/bin
        "pdtm" "/usr/local/bin/pdtm" # pdtm is installed via go install, but its path is /usr/local/bin
        "proxify" "$HOME/.pdtm/go/bin/proxify"
        "shuffledns" "$HOME/.pdtm/go/bin/shuffledns"
        "simplehttpserver" "$HOME/.pdtm/go/bin/simplehttpserver"
        "subfinder" "/usr/bin/subfinder" # subfinder is installed via go install, but its path is /usr/bin
        "tldfinder" "$HOME/.pdtm/go/bin/tldfinder"
        "tlsx" "$HOME/.pdtm/go/bin/tlsx"
        "tunnelx" "$HOME/.pdtm/go/bin/tunnelx"
        "uncover" "$HOME/.pdtm/go/bin/uncover"
        "urlfinder" "$HOME/.pdtm/go/bin/urlfinder"
        "vulnx" "$HOME/.pdtm/go/bin/vulnx"
    )

    local successful_tools=()
    local failed_tools=()

    for ((i=0; i<${#tools[@]}; i+=2)); do
        local tool_name="${tools[i]}"
        local expected_path="${tools[i+1]}"
        if command -v "$tool_name" &> /dev/null; then
            local actual_path=$(command -v "$tool_name")
            if [[ -n "$expected_path" && "$actual_path" == "$expected_path" ]]; then
                successful_tools+=("$tool_name ($actual_path)")
            elif [[ -z "$expected_path" ]]; then
                successful_tools+=("$tool_name ($actual_path)")
            else
                failed_tools+=("$tool_name (installed but not in expected PATH: $actual_path vs $expected_path)")
            fi
        else
            failed_tools+=("$tool_name (NOT installed or not in PATH)")
        fi
    done

    for ((i=0; i<${#go_tools[@]}; i+=2)); do
        local tool_name="${go_tools[i]}"
        local expected_path="${go_tools[i+1]}"
        if command -v "$tool_name" &> /dev/null; then
            local actual_path=$(command -v "$tool_name")
            if [[ -n "$expected_path" && "$actual_path" == "$expected_path" ]]; then
                successful_tools+=("$tool_name ($actual_path)")
            elif [[ -z "$expected_path" ]]; then
                successful_tools+=("$tool_name ($actual_path)")
            else
                failed_tools+=("$tool_name (installed but not in expected PATH: $actual_path vs $expected_path)")
            fi
        else
            failed_tools+=("$tool_name (NOT installed or not in PATH)")
        fi
    done

    echo ""
    echo "--- Installation Summary ---"
    if [ ${#successful_tools[@]} -gt 0 ]; then
        echo "[✓] Successfully installed tools:"
        for tool in "${successful_tools[@]}"; do
            echo "    - $tool"
        done
    else
        echo "[✓] No tools successfully installed."
    fi

    if [ ${#failed_tools[@]} -gt 0 ]; then
        echo "[✗] Tools with verification issues:"
        for tool in "${failed_tools[@]}"; do
            echo "    - $tool"
        done
    else
        echo "[✓] All tools verified successfully."
    fi
    echo "----------------------------"
}

# === Function: Check for Go ===
check_go() {
    if ! command -v go &>/dev/null; then
        echo -e "${BLUE}[+] Installing Go...${NC}"
        echo $PASSWORD | sudo -S apt update >/dev/null 2>&1
        echo $PASSWORD | sudo -S apt install -y golang >/dev/null 2>&1
        if command -v go &>/dev/null; then
            echo -e "${GREEN}[✓] Go installed successfully${NC}"
        else
            echo -e "${RED}[✗] Failed to install Go.${NC}"
            exit 1
        fi
    fi
}

# === Function: Check for Node.js and npm ===
check_node() {
    if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
        echo -e "${BLUE}[+] Installing Node.js and npm...${NC}"
        echo $PASSWORD | sudo -S apt update >/dev/null 2>&1
        echo $PASSWORD | sudo -S apt install -y nodejs npm >/dev/null 2>&1
        if command -v node &>/dev/null && command -v npm &>/dev/null; then
            echo -e "${GREEN}[✓] Node.js and npm installed successfully${NC}"
        else
            echo -e "${RED}[✗] Failed to install Node.js and npm.${NC}"
            exit 1
        fi
    fi
}

# === Function: Tool Checker and Updater ===
check_and_install_tools() {
    echo -e "${BLUE}[+] Checking and updating other tools...${NC}"
    for tool in "${REQUIRED_TOOLS[@]}"; do
        local installed_or_updated=false
        if command -v "$tool" &>/dev/null; then

            case $tool in
                figlet|ffuf|jq|nikto|feroxbuster|whatweb|curl|wget|dirb|nmap|subfinder|findomain)
                    echo $PASSWORD | sudo -S apt-get --only-upgrade install -y "$tool" >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                assetfinder|anew)
                    go install -v github.com/tomnomnom/"$tool"@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/"$tool" /usr/local/bin/ >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                update-fingerprints)
                    go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/update-fingerprints /usr/local/bin/update-fingerprints >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                dirsearch)
                    if [ -d "$HOME/tools/dirsearch" ]; then
                        (cd "$HOME/tools/dirsearch" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/maurosoria/dirsearch.git "$HOME/tools/dirsearch" >/dev/null 2>&1
                    fi
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/dirsearch/dirsearch.py" /usr/local/bin/dirsearch
                    if [ -f "/usr/local/bin/dirsearch" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                waybacklister)
                    if [ -d "$HOME/tools/waybacklister" ]; then
                        (cd "$HOME/tools/waybacklister" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/anmolksachan/waybacklister.git "$HOME/tools/waybacklister" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/waybacklister/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/waybacklister/venv/bin/activate"
                        pip3 install -r "$HOME/tools/waybacklister/requirements.txt" >/dev/null 2>&1
                    )
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/waybacklister/waybacklister.py" /usr/local/bin/waybacklister
                    if [ -f "/usr/local/bin/waybacklister" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                jsfinder)
                    if [ -d "$HOME/tools/jsfinder" ]; then
                        (cd "$HOME/tools/jsfinder" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/003random/JsFinder.git "$HOME/tools/jsfinder" >/dev/null 2>&1
                    fi
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/jsfinder/JsFinder.py" /usr/local/bin/jsfinder >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                nuclei)
                    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/nuclei /usr/local/bin/ >/dev/null 2>&1
                    nuclei -update-templates >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                gemini)
                    echo $PASSWORD | sudo -S npm install -g @google/gemini-cli >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                hexstrike-ai)
                    if [ -d "$HOME/tools/hexstrike-ai" ]; then
                        (cd "$HOME/tools/hexstrike-ai" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/0x4m4/hexstrike-ai.git "$HOME/tools/hexstrike-ai" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/hexstrike-ai/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/hexstrike-ai/venv/bin/activate"
                        pip3 install -r "$HOME/tools/hexstrike-ai/requirements.txt" >/dev/null 2>&1
                    )
                    echo -e '#!/bin/bash\nsource "$HOME/tools/hexstrike-ai/venv/bin/activate"\npython "$HOME/tools/hexstrike-ai/server.py" "$@"' > "$HOME/tools/hexstrike-ai/hexstrike-ai"
                    chmod +x "$HOME/tools/hexstrike-ai/hexstrike-ai"
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/hexstrike-ai/hexstrike-ai" /usr/local/bin/hexstrike-ai
                    if [ -f "/usr/local/bin/hexstrike-ai" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                ghauri)
                    if [ -d "$HOME/tools/ghauri" ]; then
                        (cd "$HOME/tools/ghauri" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/r0oth3x49/ghauri.git "$HOME/tools/ghauri" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/ghauri/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/ghauri/venv/bin/activate"
                        pip3 install --upgrade -r "$HOME/tools/ghauri/requirements.txt" >/dev/null 2>&1
                        python3 "$HOME/tools/ghauri/setup.py" install >/dev/null 2>&1
                    )
                    echo -e '#!/bin/bash\nsource "$HOME/tools/ghauri/venv/bin/activate"\nghauri "$@"' > "$HOME/tools/ghauri/ghauri-launcher"
                    chmod +x "$HOME/tools/ghauri/ghauri-launcher"
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/ghauri/ghauri-launcher" /usr/local/bin/ghauri
                    if [ -f "/usr/local/bin/ghauri" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                dalfox)
                    go install -v github.com/hahwul/dalfox/v2@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/dalfox /usr/local/bin/ >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                trufflehog)
                    curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                Ph.Sh-Subdomain)
                    if [ -d "$HOME/tools/Ph.Sh-Subdomain" ]; then
                        (cd "$HOME/tools/Ph.Sh-Subdomain" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/PhilopaterSh/Ph.Sh-Subdomain.git "$HOME/tools/Ph.Sh-Subdomain" >/dev/null 2>&1
                    fi
                    pip3 install --break-system-packages -r "$HOME/tools/Ph.Sh-Subdomain/requirements.txt" >/dev/null 2>&1
                    (cd "$HOME/tools/Ph.Sh-Subdomain" && go build >/dev/null 2>&1)
                    if [ -f "$HOME/tools/Ph.Sh-Subdomain/Ph.Sh-Subdomain" ]; then
                        cp "$HOME/tools/Ph.Sh-Subdomain/Ph.Sh-Subdomain" "$(go env GOPATH)/bin/" >/dev/null 2>&1 && installed_or_updated=true
                    fi
                    ;;
                *)
                    installed_or_updated=true
                    ;;
            esac
        else

            case $tool in
                figlet|ffuf|jq|nikto|feroxbuster|whatweb|curl|wget|dirb|nmap|subfinder|findomain)
                    echo $PASSWORD | sudo -S apt update >/dev/null 2>&1 && echo $PASSWORD | sudo -S apt install -y "$tool" >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                assetfinder|anew)
                    go install -v github.com/tomnomnom/"$tool"@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/"$tool" /usr/local/bin/ >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                update-fingerprints)
                    go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/update-fingerprints /usr/local/bin/update-fingerprints >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                amass)
                    go install -v github.com/owasp-amass/amass/v4/...@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/amass /usr/local/bin/ >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                dirsearch)
                    if [ -d "$HOME/tools/dirsearch" ]; then
                        (cd "$HOME/tools/dirsearch" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/maurosoria/dirsearch.git "$HOME/tools/dirsearch" >/dev/null 2>&1
                    fi
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/dirsearch/dirsearch.py" /usr/local/bin/dirsearch
                    if [ -f "/usr/local/bin/dirsearch" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                waybacklister)
                    if [ -d "$HOME/tools/waybacklister" ]; then
                        (cd "$HOME/tools/waybacklister" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/anmolksachan/waybacklister.git "$HOME/tools/waybacklister" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/waybacklister/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/waybacklister/venv/bin/activate"
                        pip3 install -r "$HOME/tools/waybacklister/requirements.txt" >/dev/null 2>&1
                    )
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/waybacklister/waybacklister.py" /usr/local/bin/waybacklister
                    if [ -f "/usr/local/bin/waybacklister" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                jsfinder)
                    if [ -d "$HOME/tools/jsfinder" ]; then
                        (cd "$HOME/tools/jsfinder" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/003random/JsFinder.git "$HOME/tools/jsfinder" >/dev/null 2>&1
                    fi
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/jsfinder/JsFinder.py" /usr/local/bin/jsfinder >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                nuclei)
                    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/nuclei /usr/local/bin/ >/dev/null 2>&1
                    nuclei -update-templates >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                gemini)
                    echo $PASSWORD | sudo -S npm install -g @google/gemini-cli >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                hexstrike-ai)
                    if [ -d "$HOME/tools/hexstrike-ai" ]; then
                        (cd "$HOME/tools/hexstrike-ai" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/0x4m4/hexstrike-ai.git "$HOME/tools/hexstrike-ai" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/hexstrike-ai/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/hexstrike-ai/venv/bin/activate"
                        pip3 install -r "$HOME/tools/hexstrike-ai/requirements.txt" >/dev/null 2>&1
                    )
                    echo -e '#!/bin/bash\nsource "$HOME/tools/hexstrike-ai/venv/bin/activate"\npython "$HOME/tools/hexstrike-ai/server.py" "$@"' > "$HOME/tools/hexstrike-ai/hexstrike-ai"
                    chmod +x "$HOME/tools/hexstrike-ai/hexstrike-ai"
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/hexstrike-ai/hexstrike-ai" /usr/local/bin/hexstrike-ai
                    if [ -f "/usr/local/bin/hexstrike-ai" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                ghauri)
                    if [ -d "$HOME/tools/ghauri" ]; then
                        (cd "$HOME/tools/ghauri" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/r0oth3x49/ghauri.git "$HOME/tools/ghauri" >/dev/null 2>&1
                    fi
                    python3 -m venv "$HOME/tools/ghauri/venv" >/dev/null 2>&1
                    (
                        source "$HOME/tools/ghauri/venv/bin/activate"
                        pip3 install --upgrade -r "$HOME/tools/ghauri/requirements.txt" >/dev/null 2>&1
                        python3 "$HOME/tools/ghauri/setup.py" install >/dev/null 2>&1
                    )
                    echo -e '#!/bin/bash\nsource "$HOME/tools/ghauri/venv/bin/activate"\nghauri "$@"' > "$HOME/tools/ghauri/ghauri-launcher"
                    chmod +x "$HOME/tools/ghauri/ghauri-launcher"
                    echo $PASSWORD | sudo -S ln -sf "$HOME/tools/ghauri/ghauri-launcher" /usr/local/bin/ghauri
                    if [ -f "/usr/local/bin/ghauri" ]; then
                        installed_or_updated=true
                    fi
                    ;;
                dalfox)
                    go install -v github.com/hahwul/dalfox/v2@latest >/dev/null 2>&1
                    echo $PASSWORD | sudo -S cp ~/go/bin/dalfox /usr/local/bin/ >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                trufflehog)
                    curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin >/dev/null 2>&1 && installed_or_updated=true
                    ;;
                Ph.Sh-Subdomain)
                    if [ -d "$HOME/tools/Ph.Sh-Subdomain" ]; then
                        (cd "$HOME/tools/Ph.Sh-Subdomain" && git pull >/dev/null 2>&1)
                    else
                        git clone https://github.com/PhilopaterSh/Ph.Sh-Subdomain.git "$HOME/tools/Ph.Sh-Subdomain" >/dev/null 2>&1
                    fi
                    pip3 install --break-system-packages -r "$HOME/tools/Ph.Sh-Subdomain/requirements.txt" >/dev/null 2>&1
                    (cd "$HOME/tools/Ph.Sh-Subdomain" && go build >/dev/null 2>&1)
                    if [ -f "$HOME/tools/Ph.Sh-Subdomain/Ph.Sh-Subdomain" ]; then
                        cp "$HOME/tools/Ph.Sh-Subdomain/Ph.Sh-Subdomain" "$(go env GOPATH)/bin/" >/dev/null 2>&1 && installed_or_updated=true
                    fi
                    ;;
                *)
                    ;;
            esac
        fi
        if $installed_or_updated; then
            echo -e "${GREEN}[✓] $tool installed/updated.${NC}"
        else
            echo -e "${RED}[✗] Failed to install/update $tool.${NC}"
        fi
    done
}

# === Function: Install pdtm Tools ===
install_pdtm_tools() {
    echo -e "${BLUE}[+] Installing/Updating pdtm tools...${NC}"
    for tool in "${PDTM_TOOLS[@]}"; do
        pdtm -i "$tool" >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}[✓] $tool installed/updated.${NC}"
        else
            echo -e "${RED}[✗] Failed to install/update $tool.${NC}"
        fi
    done
}

# === Main Execution ===
setup_zsh_path

check_go

export PATH=$PATH:$(go env GOPATH)/bin

go install github.com/projectdiscovery/pdtm/cmd/pdtm@latest >/dev/null 2>&1
if command -v pdtm &>/dev/null; then
    echo -e "${GREEN}[✓] pdtm installed successfully${NC}"
    
    install_pdtm_tools

    # Add Go binaries to ~/.bashrc and ~/.zshrc if not already present
    if ! grep -q 'export PATH=$PATH:$(go env GOPATH)/bin' "$HOME/.bashrc"; then
        echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> "$HOME/.bashrc"
    fi
    if ! grep -q 'export PATH=$PATH:$(go env GOPATH)/bin' "$HOME/.zshrc"; then
        echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> "$HOME/.zshrc"
    fi

    if ! grep -q 'export PATH=$PATH:$HOME/.pdtm/go/bin' "$HOME/.bashrc"; then
        echo 'export PATH=$PATH:$HOME/.pdtm/go/bin' >> "$HOME/.bashrc"
    fi
    if ! grep -q 'export PATH=$PATH:$HOME/.pdtm/go/bin' "$HOME/.zshrc"; then
        echo 'export PATH=$PATH:$HOME/.pdtm/go/bin' >> "$HOME/.zshrc"
    fi
    echo -e "${GREEN}[✓] Go binaries added to PATH in ~/.bashrc and ~/.zshrc. Please restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc'.${NC}"
else
    echo -e "${RED}[✗] Failed to install pdtm.${NC}"
fi

check_node

echo $PASSWORD | sudo -S apt update >/dev/null 2>&1
echo $PASSWORD | sudo -S apt install -y python3-dev build-essential libpcap-dev >/dev/null 2>&1
echo -e "${GREEN}[✓] Python build dependencies installed.${NC}"

echo $PASSWORD | sudo -S apt install -y pipx >/dev/null 2>&1
echo -e "${GREEN}[✓] pipx installed.${NC}"

pipx ensurepath >/dev/null 2>&1 || true
echo -e "${GREEN}[✓] pipx in PATH.${NC}"

check_and_install_tools

# === Function: Install Additional Tools (VSCode, massdns, seclists) ===
install_additional_tools() {
    echo -e "${BLUE}[+] Installing additional tools (VSCode, massdns, seclists)...${NC}"

    # Install snapd
    if ! command -v snap &>/dev/null; then
        echo -e "${BLUE}[+] Installing snapd...${NC}"
        echo $PASSWORD | sudo -S apt update >/dev/null 2>&1
        echo $PASSWORD | sudo -S apt install -y snapd >/dev/null 2>&1
        echo $PASSWORD | sudo -S systemctl enable snapd
        echo $PASSWORD | sudo -S systemctl start snapd
        if command -v snap &>/dev/null; then
            echo -e "${GREEN}[✓] snapd installed successfully.${NC}"
        else
            echo -e "${RED}[✗] Failed to install snapd.${NC}"
            return 1
        fi
    else
        echo -e "${GREEN}[✓] snapd is already installed.${NC}"
    fi

    # Install Visual Studio Code
    if ! command -v code &>/dev/null; then
        echo -e "${BLUE}[+] Installing Visual Studio Code...${NC}"
        echo $PASSWORD | sudo -S snap install code --classic >/dev/null 2>&1
        if command -v code &>/dev/null; then
            echo -e "${GREEN}[✓] Visual Studio Code installed successfully.${NC}"
        else
            echo -e "${RED}[✗] Failed to install Visual Studio Code.${NC}"
        fi
    else
        echo -e "${GREEN}[✓] Visual Studio Code is already installed.${NC}"
    fi

    # Install massdns
    if ! command -v massdns &>/dev/null; then
        echo -e "${BLUE}[+] Installing massdns...${NC}"
        echo $PASSWORD | sudo -S apt install -y massdns >/dev/null 2>&1
        if command -v massdns &>/dev/null; then
            echo -e "${GREEN}[✓] massdns installed successfully.${NC}"
        else
            echo -e "${RED}[✗] Failed to install massdns.${NC}"
        fi
    else
        echo -e "${GREEN}[✓] massdns is already installed.${NC}"
    fi

    # Install seclists
    if [ ! -d "/usr/share/seclists" ]; then
        echo -e "${BLUE}[+] Installing seclists...${NC}"
        echo $PASSWORD | sudo -S apt install -y seclists >/dev/null 2>&1
        if [ -d "/usr/share/seclists" ]; then
            echo -e "${GREEN}[✓] seclists installed successfully.${NC}"
        else
            echo -e "${RED}[✗] Failed to install seclists.${NC}"
        fi
    else
        echo -e "${GREEN}[✓] seclists is already installed.${NC}"
    fi
}

install_additional_tools

set +x

verify_installations
