# Tools_Install.sh

This script automates the installation and updating of various reconnaissance and security tools commonly used in penetration testing and bug bounty hunting. It handles Go-based tools, apt-package installations, pipx installations, and git-cloned tools.

## Features

-   **ZSH Setup:** Checks for ZSH installation and configures the `~/.zshrc` file with necessary PATH variables.
-   **Go Environment:** Ensures Go is installed and configures `GOPATH`.
-   **Node.js & npm:** Installs Node.js and npm if not present.
-   **Docker & Docker Compose:** Installs Docker and Docker Compose if not present.
-   **PDTM Tools:** Installs and updates a comprehensive list of ProjectDiscovery tools via `pdtm`.
-   **Additional Tools:** Installs Visual Studio Code, massdns, and seclists via apt and snap.
-   **Other Tools:** Installs and updates a variety of other essential tools including:
    -   `amass`, `anew`, `assetfinder`, `curl`, `dirb`, `dirsearch`, `feroxbuster`, `ffuf`, `figlet`, `gemini`, `jsfinder`, `jq`, `nmap`, `nikto`, `update-fingerprints`, `waybacklister`, `wget`, `whatweb`, `docker`, `docker-compose`.
-   **Python Environment:** Installs Python build dependencies and `pipx`.
-   **PATH Configuration:** Adds necessary Go and PDTM binary paths to `~/.bashrc` and `~/.zshrc`.
-   **Installation Summary:** Provides a clear summary of successfully installed tools and those that encountered verification issues at the end of the execution.

## Usage

1.  **Set Your Password:**
    This script requires `sudo` privileges for many installations. Before running, you **must** open the `Tools_Install.sh` file and change the `PASSWORD` variable to your own `sudo` password.
    ```bash
    # Line 15 in Tools_Install.sh
    PASSWORD="your_sudo_password_here"
    ```

2.  **Make the Script Executable:**
    After downloading, give the script execute permissions using the `chmod` command:
    ```bash
    chmod +x Tools_Install.sh
    ```

3.  **Run the Script:**
    Now you can execute the script:
    ```bash
    ./Tools_Install.sh
    ```

## Sample Output

```
[+] Verifying tool installations...

--- Installation Summary ---
[✓] Successfully installed tools:
    - amass (/usr/bin/amass)
    - anew (/usr/local/bin/anew)
    - assetfinder (/usr/local/bin/assetfinder)
    - curl (/usr/bin/curl)
    - dirb (/usr/bin/dirb)
    - dirsearch (/usr/local/bin/dirsearch)
    - docker (/usr/bin/docker)
    - docker-compose (/usr/bin/docker-compose)
    - feroxbuster (/usr/bin/feroxbuster)
    - ffuf (/usr/bin/ffuf)
    - figlet (/usr/bin/figlet)
    - gemini (/usr/local/bin/gemini)
    - jsfinder (/usr/local/bin/jsfinder)
    - jq (/usr/bin/jq)
    - nmap (/usr/bin/nmap)
    - nikto (/usr/bin/nikto)
    - update-fingerprints (/usr/local/bin/update-fingerprints)
    - waybacklister (/usr/local/bin/waybacklister)
    - wget (/usr/bin/wget)
    - whatweb (/usr/bin/whatweb)
    - aix ($HOME/.pdtm/go/bin/aix)
    - alterx ($HOME/.pdtm/go/bin/alterx)
    - asnmap ($HOME/.pdtm/go/bin/asnmap)
    - cdncheck (/usr/local/bin/cdncheck)
    - chaos-client ($HOME/.pdtm/go/bin/chaos-client)
    - cloudlist ($HOME/.pdtm/go/bin/cloudlist)
    - dnsx (/usr/local/bin/dnsx)
    - httpx (/usr/local/bin/httpx)
    - interactsh-client ($HOME/.pdtm/go/bin/interactsh-client)
    - interactsh-server ($HOME/.pdtm/go/bin/interactsh-server)
    - katana (/usr/local/bin/katana)
    - mapcidr ($HOME/.pdtm/go/bin/mapcidr)
    - naabu ($HOME/.pdtm/go/bin/naabu)
    - notify ($HOME/.pdtm/go/bin/notify)
    - nuclei (/usr/local/bin/nuclei)
    - pdtm (/usr/local/bin/pdtm)
    - proxify ($HOME/.pdtm/go/bin/proxify)
    - shuffledns ($HOME/.pdtm/go/bin/shuffledns)
    - simplehttpserver ($HOME/.pdtm/go/bin/simplehttpserver)
    - subfinder (/usr/bin/subfinder)
    - tldfinder ($HOME/.pdtm/go/bin/tldfinder)
    - tlsx ($HOME/.pdtm/go/bin/tlsx)
    - tunnelx ($HOME/.pdtm/go/bin/tunnelx)
    - uncover ($HOME/.pdtm/go/bin/uncover)
    - urlfinder ($HOME/.pdtm/go/bin/urlfinder)
    - vulnx ($HOME/.pdtm/go/bin/vulnx)
[✓] All tools verified successfully.
----------------------------
```

## Tools Installed/Updated

The script installs and updates tools from various sources:

### PDTM (ProjectDiscovery Tools Manager) Tools

-   `aix`
-   `alterx`
-   `asnmap`
-   `cdncheck`
-   `chaos-client`
-   `cloudlist`
-   `dnsx`
-   `httpx`
-   `interactsh-client`
-   `interactsh-server`
-   `katana`
-   `mapcidr`
-   `naabu`
-   `notify`
-   `nuclei`
-   `pdtm`
-   `proxify`
-   `shuffledns`
-   `simplehttpserver`
-   `subfinder`
-   `tldfinder`
-   `tlsx`
-   `tunnelx`
-   `uncover`
-   `urlfinder`
-   `vulnx`

### Other Tools

-   `amass`
-   `anew`
-   `assetfinder`
-   `curl`
-   `dirb`
-   `dirsearch`
-   `docker`
-   `docker-compose`
-   `feroxbuster`
-   `ffuf`
-   `figlet`
-   `gemini` (Google Gemini CLI)
-   `jsfinder`
-   `jq`
-   `nmap`
-   `nikto`
-   `update-fingerprints`
-   `waybacklister`
-   `wget`
-   `whatweb`
-   `massdns`
-   `seclists`
-   `Visual Studio Code`

## Tool Categories

Here is a categorization of the installed tools based on their primary function in a security workflow.

### Information Gathering & Asset Discovery
Tools for discovering subdomains, IPs, and other assets related to a target.
-   `amass`
-   `assetfinder`
-   `subfinder`
-   `chaos-client`
-   `uncover`
-   `cloudlist`
-   `asnmap`
-   `whatweb`
-   `waybacklister`
-   `jsfinder`
-   `urlfinder`
-   `tldfinder`

### Content Discovery & Scanning
Tools for finding hidden files, directories, and endpoints on web servers.
-   `dirb`
-   `dirsearch`
-   `feroxbuster`
-   `ffuf`
-   `katana`

### Network & Vulnerability Scanning
Tools for scanning networks, ports, and known vulnerabilities.
-   `nmap`
-   `naabu`
-   `nikto`
-   `nuclei`
-   `vulnx`
-   `tlsx`
-   `interactsh-client` / `server`

### DNS Tools
Utilities for DNS enumeration, resolution, and manipulation.
-   `dnsx`
-   `massdns`
-   `shuffledns`
-   `alterx`
-   `mapcidr`

### Web Interaction Tools
Tools for making HTTP requests and interacting with web services.
-   `httpx`
-   `curl`
-   `wget`
-   `proxify`

### Utilities & Miscellaneous Tools
Helper scripts, wordlists, and other essential tools.
-   `anew`
-   `jq`
-   `seclists`
-   `pdtm`
-   `Visual Studio Code`
-   `docker` / `docker-compose`
-   `gemini`
-   `figlet`
-   `notify`
-   `simplehttpserver`
-   `update-fingerprints`
-   `cdncheck`
-   `tunnelx`
-   `aix`

## Important Notes

-   After running the script, you may need to restart your terminal or run `source ~/.bashrc` or `source ~/.zshrc` for the new PATH variables to take effect.
-   Review the installation summary at the end to identify any tools that failed to install or update correctly.
-   **Security Warning:** The script contains a hardcoded `PASSWORD` variable. Change this to your actual `sudo` password or modify the script to prompt for the password securely if you intend to use it in a production environment.
