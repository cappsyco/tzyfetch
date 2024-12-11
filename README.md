# **tzyfetch** .8.
**tzyfetch** is an extremely simple fetch utility, built for a single line output featuring a unique, three character distro logo.

### **Install**

#### **Arch Linux Family**

1. **Install via AUR:**
	tzyfetch is available in the [AUR](https://aur.archlinux.org/packages/tzyfetch).
	You can use your favorite AUR helper to install it. For example, with **yay**:
    ```sh
    yay -S tzyfetch
    ```

#### **Other Distros**

1. **Clone the repository:**
   ```sh
   git clone https://github.com/cappsyco/tzyfetch.git
   ```

   or

   ```sh
   git clone git@github.com:cappsyco/tzyfetch.git
   ```

2. **Move to the repository directory:**
    ```sh
    cd tzyfetch
    ```

3. **Run the installer script:**
    ```sh
    sudo make install
    ```

### **Usage**

After installing, you can use the **tzyfetch** command as follows:

- **Displays the distro logo, name, and current system information:**
	```sh
    tzyfetch
    ```
- **Use *-d* or *--distro* to display the logo of a specific distro ID:**
	```sh
    tzyfetch -d ubuntu
    tzyfetch -distro freebsd
    ```
- **Outputs all distro logos and IDs recognized by tzyfetch**
	```sh
    tzyfetch -d all
    ```

### **Uninstall**

To uninstall **tzyfetch**:

- **Run the uninstaller script:**
    ```sh
    sudo make uninstall
    ```
