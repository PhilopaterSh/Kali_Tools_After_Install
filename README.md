# Tools_Install.sh

> **Note:** This script is actively and continuously updated to include new tools and features.

This script automates the installation and updating of various reconnaissance and security tools commonly used in penetration testing and bug bounty hunting. It handles Go-based tools, apt-package installations, pipx installations, and git-cloned tools, moving their binaries to `/usr/local/bin` for immediate system-wide access.

## Features

-   **ZSH Setup:** Checks for ZSH installation and configures the `~/.zshrc` file.
-   **Go Environment:** Ensures Go is installed and configures `GOPATH`.
-   **Node.js & npm:** Installs Node.js and npm if not present.
-   **PDTM Tools:** Installs and updates a comprehensive list of ProjectDiscovery tools via `pdtm`.
-   **Global Access:** Automatically moves binaries for most Go-based and custom-built tools to `/usr/local/bin` for immediate availability in the PATH.
-   **Other Tools:** Installs and updates a variety of other essential tools including:
    -   `amass`, `anew`, `assetfinder`, `curl`, `dirb`, `dirsearch`, `feroxbuster`, `ffuf`, `figlet`, `gemini`, `jsfinder`, `jq`, `nmap`, `nikto`, `update-fingerprints`, `waybacklister`, `wget`, `whatweb`, `ghauri`, `dalfox`, `trufflehog`, `Ph.Sh-Subdomain`, `Ph.Sh_url`.
-   **Python Environment:** Installs Python build dependencies and `pipx`.
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
    - aix (/usr/local/bin/aix)
    - alterx (/usr/local/bin/alterx)
    - asnmap (/usr/local/bin/asnmap)
    - cdncheck (/usr/local/bin/cdncheck)
    - chaos-client (/usr/local/bin/chaos-client)
    - cloudlist (/usr/local/bin/cloudlist)
    - dnsx (/usr/local/bin/dnsx)
    - httpx (/usr/local/bin/httpx)
    - interactsh-client (/usr/local/bin/interactsh-client)
    - interactsh-server (/usr/local/bin/interactsh-server)
    - katana (/usr/local/bin/katana)
    - mapcidr (/usr/local/bin/mapcidr)
    - naabu (/usr/local/bin/naabu)
    - notify (/usr/local/bin/notify)
    - nuclei (/usr/local/bin/nuclei)
    - pdtm (/usr/local/bin/pdtm)
    - proxify (/usr/local/bin/proxify)
    - shuffledns (/usr/local/bin/shuffledns)
    - simplehttpserver (/usr/local/bin/simplehttpserver)
    - subfinder (/usr/bin/subfinder)
    - tldfinder (/usr/local/bin/tldfinder)
    - tlsx (/usr/local/bin/tlsx)
    - tunnelx (/usr/local/bin/tunnelx)
    - uncover (/usr/local/bin/uncover)
    - urlfinder (/usr/local/bin/urlfinder)
    - vulnx (/usr/local/bin/vulnx)
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
-   `dalfox`
-   `dirb`
-   `dirsearch`
-   `feroxbuster`
-   `ffuf`
-   `figlet`
-   `findomain`
-   `gemini` (Google Gemini CLI)
-   `ghauri`
-   `hexstrike-ai`
-   `jsfinder`
-   `jq`
-   `knockpy`
-   `nmap`
-   `nikto`
-   `Ph.Sh-Subdomain`
-   `Ph.Sh_url`
-   `trufflehog`
-   `update-fingerprints`
-   `waybacklister`
-   `wget`
-   `whatweb`
-   `massdns`
-   `seclists`
-   `sshpass`
-   `Visual Studio Code`

## Tool Categories

Here is a categorization of the installed tools based on their primary function in a security workflow.

### AI-Powered Security
-   `hexstrike-ai`

### Information Gathering & Asset Discovery
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
-   `Ph.Sh-Subdomain`
-   `Ph.Sh_url`
-   `findomain`
-   `knockpy`

### Content Discovery & Scanning
-   `dirb`
-   `dirsearch`
-   `feroxbuster`
-   `ffuf`
-   `katana`

### Web Application Analysis
-   `dalfox` (XSS Scanner)
-   `ghauri` (SQLi Scanner)

### Network & Vulnerability Scanning
-   `nmap`
-   `naabu`
-   `nikto`
-   `nuclei`
-   `vulnx`
-   `tlsx`
-   `interactsh-client` / `server`

### Code & Secret Scanning
-   `trufflehog`

### DNS Tools
-   `dnsx`
-   `massdns`
-   `shuffledns`
-   `alterx`
-   `mapcidr`

### Web Interaction Tools
-   `httpx`
-   `curl`
-   `wget`
-   `proxify`

### Utilities & Miscellaneous Tools
-   `anew`
-   `jq`
-   `seclists`
-   `pdtm`
-   `Visual Studio Code`
-   `gemini`
-   `figlet`
-   `notify`
-   `simplehttpserver`
-   `update-fingerprints`
-   `cdncheck`
-   `tunnelx`
-   `aix`
-   `sshpass`

## Important Notes

-   **Sudo Password:** The script contains a hardcoded `PASSWORD` variable. Change this to your actual `sudo` password.
-   **Shell Restart:** While the script moves most binaries for immediate access, it's still good practice to restart your terminal or run `source ~/.bashrc` or `source ~/.zshrc` after execution to ensure all PATH changes are applied.
-   **Verification:** Review the installation summary at the end to identify any tools that failed to install or update correctly.