killall CrossOver 2>/dev/null
find ~/Library/Application\ Support/CrossOver/Bottles -mindepth 1 -maxdepth 1 -type d | while read -r bottle; do
  if [ -f "$bottle/system.reg" ]; then
    cp "$bottle/system.reg" "$bottle/system.reg.bak"
    awk '/^\[Software\\\\CodeWeavers\\\\CrossOver/ {skip=1; next} /^\[/ {skip=0} !skip {print}' "$bottle/system.reg.bak" > "$bottle/system.reg"
    echo "CrossOver bottles have been reset successfully."
  else
    echo "No system.reg found in $bottle"
  fi
done
