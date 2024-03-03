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
  local batt_icon_status_unknown="$(get_tmux_option "@theme_batt_icon_status_unknown" "󰂑")"

  # Check for user defined colors
  # Primary colors -- Discharging state
  local batt_color_charge_primary_tier8=$(get_tmux_option "@theme_batt_color_charge_primary_tier8" "$thm_green")
  local batt_color_charge_primary_tier7=$(get_tmux_option "@theme_batt_color_charge_primary_tier7" "$thm_green")
  local batt_color_charge_primary_tier6=$(get_tmux_option "@theme_batt_color_charge_primary_tier6" "$thm_green")
  local batt_color_charge_primary_tier5=$(get_tmux_option "@theme_batt_color_charge_primary_tier5" "$thm_yellow")
  local batt_color_charge_primary_tier4=$(get_tmux_option "@theme_batt_color_charge_primary_tier4" "$thm_yellow")
  local batt_color_charge_primary_tier3=$(get_tmux_option "@theme_batt_color_charge_primary_tier3" "$thm_yellow")
  local batt_color_charge_primary_tier2=$(get_tmux_option "@theme_batt_color_charge_primary_tier2" "$thm_red")
  local batt_color_charge_primary_tier1=$(get_tmux_option "@theme_batt_color_charge_primary_tier1" "$thm_red")

  # Secondary colors -- Discharging state
  local batt_color_charge_secondary_tier8=$(get_tmux_option "@theme_batt_color_charge_secondary_tier8" "$thm_mantle")
  local batt_color_charge_secondary_tier7=$(get_tmux_option "@theme_batt_color_charge_secondary_tier7" "$thm_mantle")
  local batt_color_charge_secondary_tier6=$(get_tmux_option "@theme_batt_color_charge_secondary_tier6" "$thm_mantle")
  local batt_color_charge_secondary_tier5=$(get_tmux_option "@theme_batt_color_charge_secondary_tier5" "$thm_mantle")
  local batt_color_charge_secondary_tier4=$(get_tmux_option "@theme_batt_color_charge_secondary_tier4" "$thm_mantle")
  local batt_color_charge_secondary_tier3=$(get_tmux_option "@theme_batt_color_charge_secondary_tier3" "$thm_mantle")
  local batt_color_charge_secondary_tier2=$(get_tmux_option "@theme_batt_color_charge_secondary_tier2" "$thm_mantle")
  local batt_color_charge_secondary_tier1=$(get_tmux_option "@theme_batt_color_charge_secondary_tier1" "$thm_mantle")

  # Foreground colors -- Charging state
  local batt_fg_color_full_charge=$(get_tmux_option "@theme_batt_fg_color_full_charge" "$thm_mantle")
  local batt_fg_color_high_charge=$(get_tmux_option "@theme_batt_fg_color_high_charge" "$thm_mantle")
  local batt_fg_color_medium_charge=$(get_tmux_option "@theme_batt_fg_color_medium_charge" "$thm_mantle")
  local batt_fg_color_low_charge=$(get_tmux_option "@theme_batt_fg_color_low_charge" "$thm_mantle")
  local batt_fg_color_charging=$(get_tmux_option "@theme_batt_fg_color_charging" "$thm_mantle")

  # Background colors -- Charging state
  local batt_bg_color_full_charge=$(get_tmux_option "@theme_batt_bg_color_full_charge" "$thm_green")
  local batt_bg_color_high_charge=$(get_tmux_option "@theme_batt_bg_color_high_charge" "$thm_green")
  local batt_bg_color_medium_charge=$(get_tmux_option "@theme_batt_bg_color_medium_charge" "$thm_yellow")
  local batt_bg_color_low_charge=$(get_tmux_option "@theme_batt_bg_color_low_charge" "$thm_red")
  local batt_bg_color_charging=$(get_tmux_option "@theme_batt_bg_color_charging" "$thm_peach")

  # Combine foreground and background colors -- Charging state
  local batt_color_full_charge="#[fg=$batt_fg_color_full_charge,bg=$batt_bg_color_full_charge]"
  local batt_color_high_charge="#[fg=$batt_fg_color_high_charge,bg=$batt_bg_color_high_charge]"
  local batt_color_medium_charge="#[fg=$batt_fg_color_medium_charge,bg=$batt_bg_color_medium_charge]"
  local batt_color_low_charge="#[fg=$batt_fg_color_low_charge,bg=$batt_bg_color_low_charge]"
  local batt_color_charging="#[fg=$batt_fg_color_charging,bg=$batt_bg_color_charging]"

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
  tmux set-option -g @batt_color_full_charge "$batt_color_full_charge"
  tmux set-option -g @batt_color_high_charge "$batt_color_high_charge"
  tmux set-option -g @batt_color_medium_charge "$batt_color_medium_charge"
  tmux set-option -g @batt_color_low_charge "$batt_color_low_charge"
  tmux set-option -g @batt_color_charging "$batt_color_charging"

  local index=$1
  local icon=$(get_tmux_option "@theme_battery_icon" "#{battery_icon}")
  local color=$(get_tmux_option "@theme_battery_color" "#{battery_color_fg}")
  local background=$(get_tmux_option "@theme_battery_bg" "#{battery_color_bg}")
  local text=$(get_tmux_option "@theme_battery_text" "#{battery_percentage}")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
