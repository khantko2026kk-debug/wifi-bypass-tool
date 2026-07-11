#!/bin/bash

echo "[*] Installing dependencies..."
pkg update && pkg upgrade -y
pkg install -y python clang make python-dev

echo "[*] Compiling the tool..."
# Compile codea.c to a binary
gcc -O3 $(python3-config --includes) codea.c -o wifi-bypass $(python3-config --ldflags --embed)

if [ $? -eq 0 ]; then
    chmod +x wifi-bypass
    echo "[+] Installation successful!"
    echo "[+] You can now run the tool using: ./wifi-bypass"
else
    echo "[-] Compilation failed. Please make sure you have python-dev and clang installed."
fi
