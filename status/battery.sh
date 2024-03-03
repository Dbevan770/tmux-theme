# This module is dependent on: https://github.com/tmux-plugins/tmux-battery
# That plugin provides the interface to get the status of the battery.
show_battery() {
  # Check for user defined icons
  # Icons -- Discharging state
  local batt_icon_charge_tier8="$(get_tmux_option "@theme_batt_icon_charge_tier8" "󰁹")"
  local batt_icon_charge_tier7="$(get_tmux_option "@theme_batt_icon_charge_tier7" "󰂁")"
  local batt_icon_charge_tier6="$(get_tmux_option "@theme_batt_icon_charge_tier6" "󰁿")"
  local batt_icon_charge_tier5="$(get_tmux_option "@theme_batt_icon_charge_tier5" "󰁾")"
  local batt_icon_charge_tier4="$(get_tmux_option "@theme_batt_icon_charge_tier4" "󰁽")"
  local batt_icon_charge_tier3="$(get_tmux_option "@theme_batt_icon_charge_tier3" "󰁼")"
  local batt_icon_charge_tier2="$(get_tmux_option "@theme_batt_icon_charge_tier2" "󰁻")"
  local batt_icon_charge_tier1="$(get_tmux_option "@theme_batt_icon_charge_tier1" "󰁺")"

  # Icons -- Charging state
  local batt_icon_status_charged="$(get_tmux_option "@theme_batt_icon_status_charged" "󰚥")"
  local batt_icon_status_charging="$(get_tmux_option "@theme_batt_icon_status_charging" "󰂄")"
  local batt_icon_status_discharging="$(get_tmux_option "@theme_batt_icon_status_discharging" "󰂃")"
  local batt_icon_status_attached="$(get_tmux_option "@theme_batt_icon_status_attached" "󰂂")"
  local batt_icon_status_unknown="$(get_tmux_option "@theme_batt_icon_status_unknown" "󰂑")"

  # Check for user defined colors
  # Primary colors -- Discharging state
  local batt_color_charge_primary_tier8=$(get_tmux_option "@theme_batt_color_charge_primary_tier8" "$thm_mantle")
  local batt_color_charge_primary_tier7=$(get_tmux_option "@theme_batt_color_charge_primary_tier7" "$thm_mantle")
  local batt_color_charge_primary_tier6=$(get_tmux_option "@theme_batt_color_charge_primary_tier6" "$thm_mantle")
  local batt_color_charge_primary_tier5=$(get_tmux_option "@theme_batt_color_charge_primary_tier5" "$thm_mantle")
  local batt_color_charge_primary_tier4=$(get_tmux_option "@theme_batt_color_charge_primary_tier4" "$thm_mantle")
  local batt_color_charge_primary_tier3=$(get_tmux_option "@theme_batt_color_charge_primary_tier3" "$thm_mantle")
  local batt_color_charge_primary_tier2=$(get_tmux_option "@theme_batt_color_charge_primary_tier2" "$thm_mantle")
  local batt_color_charge_primary_tier1=$(get_tmux_option "@theme_batt_color_charge_primary_tier1" "$thm_mantle")

  # Secondary colors -- Discharging state
  local batt_color_charge_secondary_tier8=$(get_tmux_option "@theme_batt_color_charge_secondary_tier8" "$thm_green")
  local batt_color_charge_secondary_tier7=$(get_tmux_option "@theme_batt_color_charge_secondary_tier7" "$thm_green")
  local batt_color_charge_secondary_tier6=$(get_tmux_option "@theme_batt_color_charge_secondary_tier6" "$thm_green")
  local batt_color_charge_secondary_tier5=$(get_tmux_option "@theme_batt_color_charge_secondary_tier5" "$thm_yellow")
  local batt_color_charge_secondary_tier4=$(get_tmux_option "@theme_batt_color_charge_secondary_tier4" "$thm_yellow")
  local batt_color_charge_secondary_tier3=$(get_tmux_option "@theme_batt_color_charge_secondary_tier3" "$thm_yellow")
  local batt_color_charge_secondary_tier2=$(get_tmux_option "@theme_batt_color_charge_secondary_tier2" "$thm_red")
  local batt_color_charge_secondary_tier1=$(get_tmux_option "@theme_batt_color_charge_secondary_tier1" "$thm_red")

  # Primary colors -- Charging state
  local batt_color_charged=$(get_tmux_option "@theme_batt_color_charged" "$thm_mantle")
  local batt_color_charging=$(get_tmux_option "@theme_batt_color_charging" "$thm_mantle")
  local batt_color_discharging=$(get_tmux_option "@theme_batt_color_discharging" "$thm_mantle")
  local batt_color_attached=$(get_tmux_option "@theme_batt_color_attached" "$thm_mantle")
  local batt_color_unknown=$(get_tmux_option "@theme_batt_color_unknown" "$thm_mantle")

  # Secondary colors -- Charging state
  local batt_color_charged_bg=$(get_tmux_option "@theme_batt_color_charged_bg" "$thm_sky")
  local batt_color_charging_bg=$(get_tmux_option "@theme_batt_color_charging_bg" "$thm_green")
  local batt_color_discharging_bg=$(get_tmux_option "@theme_batt_color_discharging_bg" "$thm_red")
  local batt_color_attached_bg=$(get_tmux_option "@theme_batt_color_attached_bg" "$thm_sky")
  local batt_color_unknown_bg=$(get_tmux_option "@theme_batt_color_unknown_bg" "$thm_red")

  # Set the battery icons
  tmux set-option -g @batt_icon_charge_tier8 "$batt_icon_charge_tier8"
  tmux set-option -g @batt_icon_charge_tier7 "$batt_icon_charge_tier7"
  tmux set-option -g @batt_icon_charge_tier6 "$batt_icon_charge_tier6"
  tmux set-option -g @batt_icon_charge_tier5 "$batt_icon_charge_tier5"
  tmux set-option -g @batt_icon_charge_tier4 "$batt_icon_charge_tier4"
  tmux set-option -g @batt_icon_charge_tier3 "$batt_icon_charge_tier3"
  tmux set-option -g @batt_icon_charge_tier2 "$batt_icon_charge_tier2"
  tmux set-option -g @batt_icon_charge_tier1 "$batt_icon_charge_tier1"
  tmux set-option -g @batt_icon_status_charged "$batt_icon_status_charged"
  tmux set-option -g @batt_icon_status_charging "$batt_icon_status_charging"
  tmux set-option -g @batt_icon_status_attached "$batt_icon_status_attached"
  tmux set-option -g @batt_icon_status_discharging "$batt_icon_status_discharging"
  tmux set-option -g @batt_icon_status_unknown "$batt_icon_status_unknown"

  # Set the battery colors -- Discharging state
  tmux set-option -g @batt_color_charge_primary_tier8 "$batt_color_charge_primary_tier8"
  tmux set-option -g @batt_color_charge_primary_tier7 "$batt_color_charge_primary_tier7"
  tmux set-option -g @batt_color_charge_primary_tier6 "$batt_color_charge_primary_tier6"
  tmux set-option -g @batt_color_charge_primary_tier5 "$batt_color_charge_primary_tier5"
  tmux set-option -g @batt_color_charge_primary_tier4 "$batt_color_charge_primary_tier4"
  tmux set-option -g @batt_color_charge_primary_tier3 "$batt_color_charge_primary_tier3"
  tmux set-option -g @batt_color_charge_primary_tier2 "$batt_color_charge_primary_tier2"
  tmux set-option -g @batt_color_charge_primary_tier1 "$batt_color_charge_primary_tier1"
  tmux set-option -g @batt_color_charge_secondary_tier8 "$batt_color_charge_secondary_tier8"
  tmux set-option -g @batt_color_charge_secondary_tier7 "$batt_color_charge_secondary_tier7"
  tmux set-option -g @batt_color_charge_secondary_tier6 "$batt_color_charge_secondary_tier6"
  tmux set-option -g @batt_color_charge_secondary_tier5 "$batt_color_charge_secondary_tier5"
  tmux set-option -g @batt_color_charge_secondary_tier4 "$batt_color_charge_secondary_tier4"
  tmux set-option -g @batt_color_charge_secondary_tier3 "$batt_color_charge_secondary_tier3"
  tmux set-option -g @batt_color_charge_secondary_tier2 "$batt_color_charge_secondary_tier2"
  tmux set-option -g @batt_color_charge_secondary_tier1 "$batt_color_charge_secondary_tier1"

  # Set the battery colors -- Charging state
  tmux set-option -g @batt_color_status_primary_charged "$batt_color_charged"
  tmux set-option -g @batt_color_status_primary_charging "$batt_color_charging"
  tmux set-option -g @batt_color_status_primary_discharging "$batt_color_discharging"
  tmux set-option -g @batt_color_status_primary_attached "$batt_color_attached"
  tmux set-option -g @batt_color_status_primary_unknown "$batt_color_unknown"
  tmux set-option -g @batt_color_status_secondary_charged "$batt_color_charged_bg"
  tmux set-option -g @batt_color_status_secondary_charging "$batt_color_charging_bg"
  tmux set-option -g @batt_color_status_secondary_discharging "$batt_color_discharging_bg"
  tmux set-option -g @batt_color_status_secondary_attached "$batt_color_attached_bg"
  tmux set-option -g @batt_color_status_secondary_unknown "$batt_color_unknown_bg"

  local index=$1
  local icon=$(get_tmux_option "@theme_battery_icon" "#{battery_icon}")
  local color=$(get_tmux_option "@theme_battery_color" "#{battery_color_fg}")
  local background=$(get_tmux_option "@theme_battery_bg" "#{battery_color_bg}")
  local text=$(get_tmux_option "@theme_battery_text" "#{battery_percentage}")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
