show_application() {
  local index=$1
  local icon=$(get_tmux_option "@theme_application_icon" "")
  local color=$(get_tmux_option "@theme_application_color" "$thm_mantle")
  local background=$(get_tmux_option "@theme_application_bg" "$thm_pink")
  local text=$(get_tmux_option "@theme_application_text" "#W")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
