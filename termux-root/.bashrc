# termux-chroot
if [ -z "$TERMUX_CHROOT_ACTIVE" ]; then
    export TERMUX_CHROOT_ACTIVE=1
    exec termux-chroot
fi
# termux-root export
echo
export PATH="$HOME/bin:$PATH"
echo
echo "====={☆}====="
ulimit 
