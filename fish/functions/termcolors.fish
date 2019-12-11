function termcolors --description "Switch between a light and dark terminal colorscheme"
  switch $argv[1]
    case "light"
      set key "'"
    case "dark"
      set key ";"
    case "srcery"
      set key ">"
    case "challenger-deep"
      set key "|"
    case "default"
      set key "<"
  end

  osascript -e "tell application \"System Events\" to keystroke \"$key\" using {command down, shift down}"
end
