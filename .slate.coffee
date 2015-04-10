#Thanks to:
# - https://github.com/dmac/dotfiles/blob/master/.slate

# Aliases
sox = "screenOriginX"
soy = "screenOriginY"
ssx = "screenSizeX"
ssy = "screenSizeY"

# Config
S.config("gridRoundedCornerSize", 2)
S.config("gridCellRoundedCornerSize", 2)
nudge_amt = "3%"
resize_amt= "3%"
gap = "14"

# Presets
pos =
  origin_x: "#{sox}+#{gap}"
  origin_y: "#{soy}+#{gap}"
  middle_x: "#{sox}+#{ssx}/2+#{gap}/2"
  middle_y: "#{soy}+#{ssy}/2+#{gap}/2"
size =
  full_width: "#{ssx}-#{gap}*2"
  full_height: "#{ssy}-#{gap}*2"
  half_width: "#{ssx}/2-#{gap}-#{gap}/2"
  half_height: "#{ssy}/2-#{gap}-#{gap}/2"

presets =
  fullscreen:
    x: pos.origin_x
    y: pos.origin_y
    width: size.full_width
    height: size.full_height
  top_half:
    x: pos.origin_x
    y: pos.origin_y
    width: size.full_width
    height: size.half_height
  bottom_half:
    x: pos.origin_x
    y: pos.middle_y
    width: size.full_width
    height: size.half_height
  left_half:
    x: pos.origin_x
    y: pos.origin_y
    width: size.half_width
    height: size.full_height
  right_half:
    x: pos.middle_x
    y: pos.origin_y
    width: size.half_width
    height: size.full_height
  top_left_quarter:
    x: pos.origin_x
    y: pos.origin_y
    width: size.half_width
    height: size.half_height
  top_right_quarter:
    x: pos.middle_x
    y: pos.origin_y
    width: size.half_width
    height: size.half_height
  bottom_left_quarter:
    x: pos.origin_x
    y: pos.middle_y
    width: size.half_width
    height: size.half_height
  bottom_right_quarter:
    x: pos.middle_x
    y: pos.middle_y
    width: size.half_width
    height: size.half_height

# Nudge
nudge =
  left: S.op("nudge", { x: "-#{nudge_amt}", y: "+0" })
  right: S.op("nudge", { x: "+#{nudge_amt}", y: "+0" })
  up: S.op("nudge", { x: "+0", y: "-#{nudge_amt}" })
  down: S.op("nudge", { x: "+0", y: "+#{nudge_amt}" })

# Resize
resize =
  left: S.op("resize", { width: "-#{resize_amt}", height: "+0" })
  right: S.op("resize", { width: "+#{resize_amt}", height: "+0" })
  up: S.op("resize", { width: "+0", height: "-#{resize_amt}" })
  down: S.op("resize", { width: "+0", height: "+#{resize_amt}" })

# Layouts
layouts =
  oneMonitor: slate.layout("oneMonitor", {
    _before_:
      operations: [
        S.op("hide", { app: "Spotify" })
        S.op("hide", { app: "Sublime Text" })
      ]
    _after_:
      operations:
        S.op("focus", { app: "iTerm2" })
    "iTerm2":
      operations: [S.op("move", presets.left_half)]
    "Google Chrome":
      operations: [S.op("move", presets.right_half)]

  })

# Bindings
hyper = (k) -> "#{k}:ctrl,alt,cmd,shift"
mod1 = (k) -> "#{k}:ctrl,shift"
mod2 = (k) -> "#{k}:ctrl,alt"
mod3 = (k) -> "#{k}:ctrl,cmd"

S.bind hyper("1"), S.op("layout", { name: "oneMonitor" })

S.bind hyper("r"), S.op("relaunch")
S.bind hyper("z"), S.op("undo")
S.bind hyper("w"), S.op("grid")
S.bind hyper("q"), S.op("hint", { characters: "QWERTYUIOP" })

S.bind hyper("o"), S.op("move", presets.fullscreen)
S.bind hyper("h"), S.op("move", presets.left_half)
S.bind hyper("j"), S.op("move", presets.bottom_half)
S.bind hyper("k"), S.op("move", presets.top_half)
S.bind hyper("l"), S.op("move", presets.right_half)
S.bind hyper("u"), S.op("move", presets.top_left_quarter)
S.bind hyper("i"), S.op("move", presets.top_right_quarter)
S.bind hyper("n"), S.op("move", presets.bottom_left_quarter)
S.bind hyper("m"), S.op("move", presets.bottom_right_quarter)

S.bind mod1("left"), nudge.left
S.bind mod1("right"), nudge.right
S.bind mod1("up"), nudge.up
S.bind mod1("down"), nudge.down

S.bind mod2("left"), resize.left
S.bind mod2("right"), resize.right
S.bind mod2("up"), resize.up
S.bind mod2("down"), resize.down

S.bind mod3("left"), S.op("throw", { screen: "0" })
S.bind mod3("right"), S.op("throw", { screen: "1" })
