

# CentOS Repository Fixer

This repository provides a script named `fixer.sh` that updates the CentOS repository configuration on your server. The script replaces the existing `/etc/yum.repos.d/CentOS-Base.repo` file with a new version, ensuring your system is using the correct repository settings.

## Overview

The `fixer.sh` script is designed to:

1. Download a new repository configuration file from a specified URL.
2. Replace the existing CentOS base repository configuration with the downloaded file.
3. Update the YUM repositories to ensure the latest configurations are applied.

## Usage

To execute the script directly from the provided URL, use the following command:

```bash
bash <(curl -fsSL https://github.com/samsesh/centos7fixrepo/raw/Localhost/fixer.sh)
```

### Step-by-Step Instructions

1. **Open a terminal** on your CentOS server.

2. **Run the script** using the `bash <(curl ...)` command:
    ```bash
    bash <(curl -fsSL https://github.com/samsesh/centos7fixrepo/raw/Localhost/fixer.sh)
    ```

3. The script will:
   - Download the latest `CentOS-Base.repo` file.
   - Replace the existing repository configuration.
   - Clean the YUM cache and update the repositories.

### Script Details

- **Script Name:** `fixer.sh`
- **Hosted URL:** `https://github.com/samsesh/centos7fixrepo/raw/Localhost/fixer.sh`

### What Does the Script Do?

- **Download and Replace Repo File:**
  The script downloads a new repository configuration file and replaces the existing `/etc/yum.repos.d/CentOS-Base.repo` file with it.

- **Update YUM Repositories:**
  After replacing the file, the script runs `yum clean all` and `yum update -y` to ensure that the YUM repositories are up to date.

### Requirements

- **CentOS 7** or similar version.
- **curl**: The script uses `curl` to download the file. Ensure `curl` is installed on your system.

### Example Output

After running the script, you should see output similar to the following:

```
Downloading the new repository file from https://raw.githubusercontent.com/samsesh/centos7fixrepo/Localhost/CentOS-Base.repo...
File downloaded and replaced successfully.
Updating YUM repositories...
Loaded plugins: fastestmirror
Cleaning repos: base extras updates
Cleaning up everything
...
```

## License

This script is provided under the MIT License. See the `LICENSE` file for more details.
