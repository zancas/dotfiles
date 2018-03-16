#exec dwm
xmodmap ${HOME}/.Xmodmap
while true; do
  xsetroot -name "`uptime | cut -d',' -f3- | xargs` || `date` || `iw dev wlp4s0 link | grep SSID: | xargs`, `iw dev wlp4s0 link | grep signal: | cut -d' ' -f2-` || `acpi | cut -d',' -f2 | xargs`"
  sleep .1
done &
exec ${HOME}/bin/startdwm.sh
