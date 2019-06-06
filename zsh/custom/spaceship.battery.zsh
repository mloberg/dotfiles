#
# MacOS Battery
#
# Better battery prompt for Spaceship
# Adapted from: https://github.com/denysdovhan/spaceship-prompt/blob/master/sections/battery.zsh

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_OSX_BATTERY_SHOW="${SPACESHIP_OSX_BATTERY_SHOW=true}"
SPACESHIP_OSX_BATTERY_PERCENT="${SPACESHIP_OSX_BATTERY_PERCENT=false}"
SPACESHIP_OSX_BATTERY_REMAINING="${SPACESHIP_OSX_BATTERY_REMAINING=true}"
SPACESHIP_OSX_BATTERY_PREFIX="${SPACESHIP_OSX_BATTERY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OSX_BATTERY_SUFFIX="${SPACESHIP_OSX_BATTERY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OSX_BATTERY_SYMBOL_CHARGING="${SPACESHIP_OSX_BATTERY_SYMBOL_CHARGING="🔌 "}"
SPACESHIP_OSX_BATTERY_SYMBOL_DISCHARGING="${SPACESHIP_OSX_BATTERY_SYMBOL_DISCHARGING="🔋 "}"
SPACESHIP_OSX_BATTERY_SYMBOL_FULL="${SPACESHIP_OSX_BATTERY_SYMBOL_FULL="⚡ "}"
SPACESHIP_OSX_BATTERY_SYMBOL_CALCULATING="${SPACESHIP_OSX_BATTERY_SYMBOL_CALCULATING="⌛️ "}"
SPACESHIP_OSX_BATTERY_THRESHOLD="${SPACESHIP_OSX_BATTERY_THRESHOLD=30}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show MacOS battery status
spaceship_osx_battery() {
  [[ $SPACESHIP_OSX_BATTERY_SHOW == false ]] && return
  spaceship::exists pmset || return

  local battery_data battery_percent battery_status battery_remaining battery_symbol battery_color

  battery_data=$(pmset -g batt | grep "InternalBattery" | cut -f2)

  [[ -z "$battery_data" ]] && return

  battery_percent=$(echo "$battery_data" | cut -d';' -f1 | tr -d '%[,;]')

  [[ $battery_percent -gt $SPACESHIP_OSX_BATTERY_THRESHOLD && $SPACESHIP_OSX_BATTERY_SHOW != "always" ]] && return

  battery_status=$(echo "$battery_data" | cut -d';' -f2 | tr -d ' ')
  battery_remaining=$(echo "$battery_data" | cut -d';' -f3 | cut -d' ' -f2)

  [[ $battery_status == *"AC"* ]] && battery_status="charging"
  [[ $battery_remaining =~ "[0-9]" ]] || battery_remaining="${SPACESHIP_OSX_BATTERY_SYMBOL_CALCULATING}"

  battery_color="yellow"
  [[ $battery_percent -lt $SPACESHIP_OSX_BATTERY_THRESHOLD ]] && battery_color="red"

  if [[ $battery_status == "charging" ]];then
    battery_symbol="${SPACESHIP_OSX_BATTERY_SYMBOL_CHARGING}"
  elif [[ $battery_status =~ "^[dD]ischarg.*" ]]; then
    battery_symbol="${SPACESHIP_OSX_BATTERY_SYMBOL_DISCHARGING}"
  else
    battery_symbol="${SPACESHIP_OSX_BATTERY_SYMBOL_FULL}"
    battery_remaining=""
    battery_color="green"
  fi

  battery_percent="$battery_percent%% "
  [[ $battery_remaining != "" ]] && battery_remaining="$battery_remaining "
  [[ $battery_remaining == "0:00" ]] && battery_remaining=""
  [[ $SPACESHIP_OSX_BATTERY_REMAINING == false ]] && battery_remaining=""
  [[ $SPACESHIP_OSX_BATTERY_PERCENT == false ]] && battery_percent=""

  # Display battery section
  spaceship::section \
    "$battery_color" \
    "$SPACESHIP_OSX_BATTERY_PREFIX" \
    "$battery_symbol$battery_percent$battery_remaining" \
    "$SPACESHIP_OSX_BATTERY_SUFFIX"
}
