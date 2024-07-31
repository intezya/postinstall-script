

if [[$EUID -ne 0]]; then
	echo "Script must be run as root"
	exit 1
fi


PKGS_CONFIG_FILE = "packages.cfg"


if [[ ! -f $PKGS_CONFIG_FILE ]]; then
	echo "$PKGS_CONFIG_FILE not found"
	exit 1
fi


echo "Updating system..."
pacman -Syu --noconfirm


echo "Installing packages..."
pacman -S --needed --noconfirm - < $PKGS_CONFIG_FILE
echo "Packages installed!"


echo "Installing Homebrew..."
export HOMEBREW_NO_INSTALL_FROM_API=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installed!"






