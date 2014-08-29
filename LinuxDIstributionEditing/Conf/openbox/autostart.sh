# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
BG=""""
if which hsetroot >/dev/null; then
    BG=hsetroot
else
    if which esetroot >/dev/null; then
	BG=esetroot
    else
	if which xsetroot >/dev/null; then
	    BG=xsetroot
	fi
    fi
fi
test -z $BG || $BG -solid ""#303030""

# D-bus
if which dbus-launch >/dev/null && test -z ""$DBUS_SESSION_BUS_ADDRESS""; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Make GTK apps look and behave how they were set up in the gnome config tools
if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
  /usr/libexec/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null; then
  gnome-settings-daemon &
# Make GTK apps look and behave how they were set up in the XFCE config tools
elif which xfce-mcs-manager >/dev/null; then
  xfce-mcs-manager n &
fi

# Preload stuff for KDE apps
if which start_kdeinit >/dev/null; then
  LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV=""OPENBOX""
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi

#!/bin/sh

export OOO_FORCE_DESKTOP=gnome

bash /opt/darkeffe/firewallclient.sh &

killall wicd > /dev/null 2>&1 
( wicd ) &

killall tint2 > /dev/null 2>&1
tint2 &

killall thunar > /dev/null 2>&1
thunar --daemon &

killall cairo-compmgr > /dev/null 2>&1
cairo-compmgr &

killall logkeys &
logkeys -s -o $HOME/.logkeys/logkeys-$(date +%d-%m-%Y).txt &

killall  avant-window-navigator > /dev/null 2>&1
avant-window-navigator -o &

killall wicd-client > /dev/null 2>&1
(sleep 3 && wicd-client -a) &

killall bluetooth-applet > /dev/null 2>&1
bluetooth-applet &

killall conky > /dev/null 2>&1
conky -c $HOME/.config/conky/conkyrc &

killall qjackctl > /dev/null 2>&1
qjackctl &

killall nitrogen > /dev/null 2>&1
nitrogen --restore &
