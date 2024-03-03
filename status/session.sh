show_session() {
  local index=$1
  local icon=$(get_tmux_option "@theme_session_icon" "")
  local color=$(get_tmux_option "@theme_session_color" "${thm_mantle}")
  local background=$(get_tmux_option "@theme_session_bg" "#{?client_prefix,$thm_red,$thm_green}")
  local text=$(get_tmux_option "@theme_session_text" "#S")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
