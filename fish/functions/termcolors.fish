function termcolors --description "Switch iTerm color presets from the command line"
  switch $argv[1]
    case "light"
      set key "!"
    case "dark"
      set key "@"
    case "srcery"
      set key "#"
    case "challenger-deep"
      set key "\$"
    case "apprentice"
      set key "%"
    case "jellybeans"
      set key "^"
    case "default"
      set key ")"
  end

  osascript -e "tell application \"System Events\" to keystroke \"$key\" using {command down, option down, shift down}"
end
