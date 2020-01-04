## set up mirrors
# update pacman database and get tools for testing mirrors
pacman -Sy
pacman -S pacman-contrib
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
awk '/## United States/{print;getline;print}' /etc/pacman.d/mirrorlist.backup | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 10 - > /etc/pacman.d/mirrorlist