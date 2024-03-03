# Requires https://github.com/xamut/tmux-weather.
show_weather() {
  local index=$1
  local icon="$(get_tmux_option "@theme_weather_icon" "")"
  local color="$(get_tmux_option "@theme_weather_color" "$thm_mantle")"
  local background="$(get_tmux_option "@theme_weather_bg" "$thm_yellow")"
  local text="$(get_tmux_option "@theme_weather_text" "#{weather}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$background" "$text" )

  echo "$module"
}
