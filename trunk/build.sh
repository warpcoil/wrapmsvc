#!/bin/sh

DEST="$1"
WINEGCC="winegcc"

if [ -z "$DEST" ]; then
	echo "Usage: $0 <destination folder>"
	exit 1
fi

"$WINEGCC" -o "$DEST/cl" wrapmsvc.c -DWRAP_CL -lmsvcrt &&
"$WINEGCC" -o "$DEST/link" wrapmsvc.c -DWRAP_LINK -lmsvcrt &&
"$WINEGCC" -o "$DEST/rc" wrapmsvc.c -DWRAP_RC -lmsvcrt &&
"$WINEGCC" -o "$DEST/mt" wrapmsvc.c -DWRAP_MT -lmsvcrt &&
ln -sf cl.exe "$DEST/cl" &&
ln -sf link.exe "$DEST/link" &&
ln -sf rc.exe "$DEST/rc" &&
ln -sf mt.exe "$DEST/mt"
