MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = 1 ]; do
	sleep 2
done
# Booted: give the UI a minute, then count it as a good boot.
sleep 60
rm -f $MODDIR/boot_count
