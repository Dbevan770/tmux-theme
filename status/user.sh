show_user() {
  local index=$1
  local icon=$(get_tmux_option "@theme_user_icon" "")
  local color=$(get_tmux_option "@theme_user_color" "$thm_sky")
  local background=$(get_tmux_option "@theme_user_bg" "$thm_mantle")
  local text=$(get_tmux_option "@theme_user_text" "#(whoami)")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
