# Boot guard: if Android doesn't finish booting three times in a row with
# this driver, disable the module so the next boot uses the stock driver.
MODDIR=${0%/*}
n=$(cat $MODDIR/boot_count 2>/dev/null || echo 0)
if [ "$n" -ge 3 ]; then
	touch $MODDIR/disable
	rm -f $MODDIR/boot_count
	exit 0
fi
echo $((n + 1)) > $MODDIR/boot_count
