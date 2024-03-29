show_date_time() {
  local index=$1
  local icon="$(get_tmux_option "@theme_date_time_icon" "󰃰")"
  local color="$(get_tmux_option "@theme_date_time_color" "$thm_mantle")"
  local background="$(get_tmux_option "@theme_date_time_bg" "$thm_purple")"
  local text="$(get_tmux_option "@theme_date_time_text" "%Y-%m-%d %H:%M")"

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
