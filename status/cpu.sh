show_cpu() {
  # Background colors based on CPU usage
  local cpu_low_bg_color="$(get_tmux_option "@theme_cpu_low_bg_color" "${thm_green}")"
  local cpu_medium_bg_color="$(get_tmux_option "@theme_cpu_medium_bg_color" "${thm_yellow}")"
  local cpu_high_bg_color="$(get_tmux_option "@theme_cpu_high_bg_color" "${thm_red}")"

  # Set the Colors based on the custom values
  tmux set-option -g @cpu_low_bg_color "$cpu_low_bg_color"
  tmux set-option -g @cpu_medium_bg_color "$cpu_medium_bg_color"
  tmux set-option -g @cpu_high_bg_color "$cpu_high_bg_color"

  # Module configuration
  local index=$1
  local icon=$(get_tmux_option "@theme_cpu_icon" "")
  local color="$(get_tmux_option "@theme_cpu_color" "#{cpu_fg_color}")"
  local background="$(get_tmux_option "@theme_cpu_bg" "#{cpu_bg_color}")"
  local text="$(get_tmux_option "@theme_cpu_text" "#{cpu_percentage}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
