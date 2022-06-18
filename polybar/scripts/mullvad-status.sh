#!/usr/bin/env bash
set -eo pipefail

tell_status() {
    # if the vpn's status changed, notify the user
    if [[ "$1" == "$2" ]]; then
        return
    else
        echo "$1" > "${status_file}" \
        && echo "VPN ${shorthand}" \
        && notify-send "Mullvad" "$1"
    fi
    exit 0
}

# format mullvad status to a better looking printable format
mullvad_status="$( mullvad status | awk '{print $1}' )"

# when a network connection is down, mullvad reports status as "Blocked:",
# which ruins consistent formatting. this is a quick fix
if [[ "${mullvad_status}" == Blocked: ]]; then
    mullvad_status="Blocked"
fi

# get the shorter version of if mullvad is connected; saves space in bar
if [[ "${mullvad_status}" == Connected ]]; then
    shorthand="✓"
else
    shorthand="✘"
fi

# log the most recent mullvad status
if [[ "${POLYBAR_MULLVAD_STATUSFILE}" ]]; then
    status_file="${POLYBAR_MULLVAD_STATUSFILE}"
else
    status_file="/tmp/mullvad_status.last"
fi

# create the status file if it doesn't exist
if [[ ! -s "${status_file}" ]]; then
    tell_status "${mullvad_status}" "bypass"
fi

last_status="$( cat "${status_file}" )"

tell_status "${mullvad_status}" "${last_status}"
