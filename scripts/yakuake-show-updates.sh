#!/bin/bash
# Starting Yakuake based on user preferences. Information based on https://forums.gentoo.org/viewtopic-t-873915-start-0.html
# Adding sessions from previous website is broken, use this: https://koston.pl/blog/sublime-text-3-cheatsheet-modules-web-develpment/

# This line is needed in case Yakuake does not accept fcitx inputs.
/usr/bin/yakuake --im /usr/bin/fcitx --inputstyle onthespot &

# gives Yakuake a couple seconds before sending dbus commands
sleep 1

session_id=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle "$session_id" "Updates"
wid=$(wmctrl -xl | grep -iF 'yakuake.yakuake' | head -n1 | cut -d' ' -f1)
	if [[ -z "$wid" ]]; then
		qdbus org.kde.yakuake /yakuake/window toggleWindowState > /dev/null
	else
		wmctrl -i -a $wid
    fi
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal $session_id " update-helper"
