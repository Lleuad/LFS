set -e
mkfs.ext4 "$PBASE"1
mount "$PBASE"1 "$LFS"
