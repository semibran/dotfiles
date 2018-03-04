#!/bin/bash
ActiveWindow(){
  echo -n $(xdotool getwindowfocus getwindowname)
}

Clock() {
  echo $(date +%T)
}

Battery() {
  echo $(acpi --battery | cut -d, -f2)
}

while true; do
  echo -e "%{Sf}%{l}$(ActiveWindow)%{c}$(Clock)%{r}$(Battery)\uf242"
  sleep 0.0625s
done | lemonbar -B#000
