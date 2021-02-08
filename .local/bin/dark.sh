sed -i '5s_gtk-theme-name=.*_gtk-theme-name="Matcha-dark-azul"_' ~/.gtkrc-2.0
sed -i '10s_gtk-theme-name=.*_gtk-theme-name=Matcha-dark-azul_' ~/.config/gtk-3.0/settings.ini
sed -i '1s_Net/IconThemeName.*_Net/IconThemeName "Qogir-manjaro-dark"_' ~/.xsettingsd
sed -i '2s_Net/ThemeName.*_Net/ThemeName "Matcha-dark-azul"_' ~/.xsettingsd
xsettingsd &> /dev/null &
sleep 3s && killall xsettingsd &
notify-send -u low "Switch to dark mode"
