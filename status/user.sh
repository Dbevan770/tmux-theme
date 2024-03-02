show_user() {
  local index=$1
  local icon=$(get_tmux_option "@theme_user_icon" "")
  local color=$(get_tmux_option "@theme_user_color" "$thm_sky")
  local text=$(get_tmux_option "@theme_user_text" "#(whoami)")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
