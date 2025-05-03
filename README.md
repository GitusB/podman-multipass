# Running podman with multipass 

Just a small side project to us a multipass ubuntu VM for podman on macOS

Prerequitsites: https://brew.sh home brew installed (you probably already have this).

```
 # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 ```

 ## Scripts

 * setup.sh     - Run all the scripts below....
 *  install.sh   - Optional script to install packages
 *  multipass.sh - create the multipadd instance
 *  podman.sh    - create the podman connections
 * purge.sh      - remove all of the above Usage purge.sh instance_name