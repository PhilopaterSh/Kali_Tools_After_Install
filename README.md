# Tools_Install.sh

This script automates the installation and updating of various reconnaissance and security tools commonly used in penetration testing and bug bounty hunting. It handles Go-based tools, apt-package installations, pipx installations, and git-cloned tools.

## Features

-   **ZSH Setup:** Checks for ZSH installation and configures the `~/.zshrc` file with necessary PATH variables.
-   **Go Environment:** Ensures Go is installed and configures `GOPATH`.
-   **Node.js & npm:** Installs Node.js and npm if not present.
-   **PDTM Tools:** Installs and updates a comprehensive list of ProjectDiscovery tools via `pdtm`.
-   **Other Tools:** Installs and updates a variety of other essential tools including:
    -   `amass`, `anew`, `assetfinder`, `curl`, `dirb`, `dirsearch`, `feroxbuster`, `ffuf`, `figlet`, `gemini`, `jsfinder`, `jq`, `nmap`, `nikto`, `update-fingerprints`, `waybacklister`, `wget`, `whatweb`.
-   **Python Environment:** Installs Python build dependencies and `pipx`.
-   **PATH Configuration:** Adds necessary Go and PDTM binary paths to `~/.bashrc` and `~/.zshrc`.
-   **Installation Summary:** Provides a clear summary of successfully installed tools and those that encountered verification issues at the end of the execution.

## Usage

To run the script, navigate to its directory and execute it:

```bash
./Tools_Install.sh
```

The script requires `sudo` privileges for some installations. It uses a hardcoded password variable (`PASSWORD="kali"`). **It is highly recommended to change this password in the script if your `sudo` password is not `kali` to avoid issues or security risks.**

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

## Important Notes

-   After running the script, you may need to restart your terminal or run `source ~/.bashrc` or `source ~/.zshrc` for the new PATH variables to take effect.
-   Review the installation summary at the end to identify any tools that failed to install or update correctly.
-   **Security Warning:** The script contains a hardcoded `PASSWORD` variable. Change this to your actual `sudo` password or modify the script to prompt for the password securely if you intend to use it in a production environment.
