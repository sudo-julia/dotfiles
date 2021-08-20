#!/usr/bin/env bash

# kill any running instances
killall -q polybar

# without removing this, mullvad status won't tell status on restart
rm -f /tmp/mullvad_status.last

# wait until processes have been shut down
while pgrep -u "${UID}" -x polybar >/dev/null; do sleep 1; done

wm="$(wmctrl -m | awk 'NR==1 {print $2}')"
external_connected="$(xrandr -q | awk '/HDMI-0/{print $2}')"

if [[ "$external_connected" == connected ]]; then
	polybar -c "${XDG_CONFIG_HOME}/polybar/config.${wm}" jambar >>/tmp/polybar1.log 2>&1 &
	polybar -c "${XDG_CONFIG_HOME}/polybar/config.${wm}" external >>/tmp/polybar1.log 2>&1 &
else
	polybar -c "${XDG_CONFIG_HOME}/polybar/config.${wm}" solo >>/tmp/polybar1.log 2>&1 &
fi
