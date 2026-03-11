#!/bin/bash
# ============================================================
# ocr-screen.sh — Screen OCR with language selection
# ============================================================
#
# DEPENDENCIES:
#   tesseract     - OCR engine
#   grim          - Wayland screenshot tool
#   slurp         - Region selection for Wayland
#   imagemagick   - Image preprocessing (convert)
#   wl-clipboard  - Wayland clipboard (wl-copy)
#   walker        - dmenu launcher (for language picker)
#   libnotify     - Desktop notifications (notify-send)
#
# INSTALL (Arch):
#   sudo pacman -S tesseract grim slurp imagemagick wl-clipboard walker libnotify
#
# TESSERACT LANGUAGE PACKS:
#   sudo pacman -S tesseract-data-eng tesseract-data-jpn tesseract-data-ara
#
# INSTALL (Debian/Ubuntu):
#   sudo apt install tesseract-ocr grim slurp imagemagick wl-clipboard libnotify-bin
#   sudo apt install tesseract-ocr-eng tesseract-ocr-jpn tesseract-ocr-ara
#   # walker: https://github.com/abenz1267/walker
#
# SETUP:
#   chmod +x ~/bin/ocr-screen.sh
#
# HYPRLAND KEYBIND (add to hyprland.conf):
#   bind = SUPER SHIFT, A, exec, ~/bin/ocr-screen.sh
#
# USAGE:
#   1. Press SUPER+SHIFT+A
#   2. Select OCR language from the picker
#   3. Draw a region on screen
#   4. Text is copied to clipboard automatically
# ============================================================

LANG=$(echo -e "eng\njpn\narab\neng+jpn\neng+arab\njpn+arab\neng+jpn+arab" | walker --dmenu -p "OCR Language:" 2>/dev/null || echo "eng+jpn+arab")

text=$(grim -g "$(slurp)" - | \
    convert - -resize 200% -colorspace Gray -normalize png:- | \
    tesseract stdin stdout -l "$LANG" --oem 1 --psm 6 2>/dev/null)

if [ -n "$text" ]; then
    echo "$text" | wl-copy
    notify-send "OCR Done" "[$LANG] copied to clipboard"
else
    notify-send "OCR Failed" "No text detected"
fi
