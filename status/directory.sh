show_directory() {
  local index=$1
  local icon=$(get_tmux_option "@theme_directory_icon" "")
  local color=$(get_tmux_option "@theme_directory_color" "$thm_mantle")
  local background=$(get_tmux_option "@theme_directory_bg" "$thm_pink")
  local text=$(get_tmux_option "@theme_directory_text" "#{b:pane_current_path}")

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
