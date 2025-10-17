#!/bin/bash
# =========================================
# Multi-Folder Sync Script
# Author: Aman Kumar
# Description: Syncs multiple folder pairs using rsync
# =========================================

# ---- CONFIGURATION ----
LOG_FILE="$HOME/Documents/rsync_sync.log"

# Each line = "source_path|destination_path"
FOLDER_PAIRS=(
  "$HOME/.config/hypr/|$HOME/Desktop/mydotfiles/hypr/"
  "$HOME/.config/waybar/|$HOME/Desktop/mydotfiles/waybar/"
  "$HOME/.config/rofi/|$HOME/Desktop/mydotfiles/rofi/"
  "$HOME/.config/btop/|$HOME/Desktop/mydotfiles/btop/"
  "$HOME/.config/fastfetch/|$HOME/Desktop/mydotfiles/fastfetch/"
  "$HOME/.config/kitty/|$HOME/Desktop/mydotfiles/kitty/"
  "$HOME/.config/nvim/|$HOME/Desktop/mydotfiles/nvim/"
  "$HOME/.config/nwg-look/|$HOME/Desktop/mydotfiles/nwg-look/"
  "$HOME/.config/xdg-desktop-portal/|$HOME/Desktop/mydotfiles/xdg-desktop-portal/"
  "$HOME/.oh-my-zsh/|$HOME/Desktop/mydotfiles/oh-my-zsh/"
  "$HOME/.themes/|$HOME/Desktop/mydotfiles/themes/"
)

# ---- TIMESTAMP ----
echo "========================================" >> "$LOG_FILE"
echo "🕒 Sync started at: $(date)" >> "$LOG_FILE"

# ---- LOOP THROUGH EACH PAIR ----
for pair in "${FOLDER_PAIRS[@]}"; do
  SRC=$(echo "$pair" | cut -d'|' -f1)
  DEST=$(echo "$pair" | cut -d'|' -f2)

  echo "----------------------------------------" >> "$LOG_FILE"
  echo "🔁 Syncing: $SRC → $DEST" >> "$LOG_FILE"

  # Check if source exists
  if [ ! -d "$SRC" ]; then
    echo "❌ ERROR: Source directory not found: $SRC" >> "$LOG_FILE"
    continue
  fi

  # Create destination if missing
  if [ ! -d "$DEST" ]; then
    echo "📁 Destination not found. Creating: $DEST" >> "$LOG_FILE"
    mkdir -p "$DEST"
  fi

  # Run rsync
  rsync -av --delete "$SRC"/ "$DEST"/ >> "$LOG_FILE" 2>&1

  # Check status
  if [ $? -eq 0 ]; then
    echo "✅ Sync successful for $SRC → $DEST at $(date)" >> "$LOG_FILE"
  else
    echo "❌ Sync failed for $SRC → $DEST at $(date)" >> "$LOG_FILE"
  fi
done

# ---- END TIMESTAMP ----
echo "✅ All syncs completed at: $(date)" >> "$LOG_FILE"
echo "========================================" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

