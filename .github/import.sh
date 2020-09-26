#!/usr/bin/bash

# Updates QT Translation sources, converts them into xlf
# Usage ./import.sh /path/to/mozVPN/ /path/to/translateGit
# 
# lupdate & lconvert with qml support must be available


/usr/lib/qt5/bin/lupdate vpn/src/src.pro -ts

for FILE in $1/translations/*; do 
if [ -f "$2/$(basename '$FILE').xlf" ]; then
    echo "$2/$(basename '$FILE').xlf Already Exists, wont import"
else 
    /usr/lib/qt5/bin/lconvert -i "$FILE" -o $2/"$(basename "$FILE")".xlf
fi

done