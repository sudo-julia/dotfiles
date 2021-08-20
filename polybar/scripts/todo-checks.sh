#!/usr/bin/bash
# puts number of items in markdown todo list in polybar

todo_file="${HOME}/lib/todo/TODO.md"
newest_mod="$(stat -c '%Y' "${todo_file}")"
last_file="${HOME}/lib/todo/TODO.last"
last_mod="$(cat "${last_file}")"

update_module() {
	local working todo complete
	echo "${newest_mod}" >"${last_file}"
	working="$(grep -cs -- '<!--a-->$' "${todo_file}")"
	todo="$(grep -cs -- '^- \[ \]' "${todo_file}")"
	complete="$(grep -cs -- '^- \[X\]' "${todo_file}")"
	if ((working != 0)); then
		if ((todo > 10)); then
			echo "! ${working}  * ${todo}  X ${complete}"
		else
			extra="$(grep -cs '^/\|^~' "${todo_file}")"
			echo "! ${working}  % ${extra}  * ${todo}  X ${complete}"
		fi
	else
		if ((todo > 10)); then
			echo "* ${todo}  X ${complete} ~"
		else
			extra="$(grep -cs '^/\|^~' "${todo_file}")"
			echo "% ${extra}  * ${todo}  X ${complete}"
		fi
	fi
}

if ((newest_mod > last_mod)); then
	update_module
elif [[ ! "$todo_started" ]]; then
	export todo_started=1
	update_module
fi
exit 0
