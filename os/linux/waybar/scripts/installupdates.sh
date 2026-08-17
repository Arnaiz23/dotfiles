echo "Pacman update lists":
checkupdates
echo "AUR update lists":
paru -Qu
read -n1 -rep 'Download updates? (s,n)' UPD
if [[ $UPD == "S" || $UPD == "s" ]]; then
    paru --noconfirm -Syu
fi
