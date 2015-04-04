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
nudgeAmt = "5%"
resizeAmt= "5%"
gap = "15"

# Positions
pos =
  centered:
    x: "#{sox}+#{ssx}/8"
    y: "#{soy}+#{ssy}/8"
    width: "#{ssx}/8*6"
    height: "#{ssy}/8*6"
  fullscreen:
    x: "#{sox}+#{gap}"
    y: "#{soy}+#{gap}"
    width: "#{ssx}-#{gap}*2"
    height: "#{ssy}-#{gap}*2"
  leftHalf:
    x: "#{sox}+#{gap}"
    y: "#{soy}+#{gap}"
    width: "#{ssx}/2-#{gap}/2"
    height: "#{ssy}-#{gap}*2"
  bottomHalf:
    x: "#{sox}+#{gap}"
    y: "#{soy}+#{ssy}/2+#{gap}/2"
    width: "#{ssx}-#{gap}*2"
    height: "#{ssy}/2-#{gap}/2"
  topHalf:
    x: "#{sox}+#{gap}"
    y: "#{soy}+#{gap}"
    width: "#{ssx}-#{gap}*2"
    height: "#{ssy}/2-#{gap}/2"
  rightHalf:
    x: "#{sox}+#{ssx}/2+#{gap}"
    y: "#{soy}+#{gap}"
    width: "#{ssx}/2-#{gap}*2"
    height: "#{ssy}-#{gap}*2"
  topLeftQuarter:
    x: sox
    y: soy
    width: "#{ssx}/2"
    height: "#{ssy}/2"
  topRightQuarter:
    x: "#{sox}+#{ssx}/2"
    y: soy
    width: "#{ssx}/2"
    height: "#{ssy}/2"
  bottomLeftQuarter:
    x: sox
    y: "#{soy}+#{ssy}/2"
    width: "#{ssx}/2"
    height: "#{ssy}/2"
  bottomRightQuarter:
    x: "#{sox}+#{ssx}/2"
    y: "#{soy}+#{ssy}/2"
    width: "#{ssx}/2"
    height: "#{ssy}/2"

# Nudge
nudge =
  left: S.op("nudge", { x: "-#{nudgeAmt}", y: "+0" })
  right: S.op("nudge", { x: "+#{nudgeAmt}", y: "+0" })
  up: S.op("nudge", { x: "+0", y: "-#{nudgeAmt}" })
  down: S.op("nudge", { x: "+0", y: "+#{nudgeAmt}" })

# Resize
resize =
  left: S.op("resize", { width: "-#{resizeAmt}", height: "+0" })
  right: S.op("resize", { width: "+#{resizeAmt}", height: "+0" })
  up: S.op("resize", { width: "+0", height: "-#{resizeAmt}" })
  down: S.op("resize", { width: "+0", height: "+#{resizeAmt}" })

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
      operations: [S.op("move", pos.leftHalf)]
    "Google Chrome":
      operations: [S.op("move", pos.rightHalf)]

  })

# Bindings
hyper = (k) -> "#{k}:ctrl,alt,cmd,shift"
mod1= (k) -> "#{k}:ctrl,shift"
mod2 = (k) -> "#{k}:ctrl,alt"

S.bind hyper("1"), S.op("layout", { name: "oneMonitor" })

S.bind hyper("r"), S.op("relaunch")
S.bind hyper("z"), S.op("undo")
S.bind hyper("w"), S.op("grid")
S.bind hyper("q"), S.op("hint", { characters: "QWERTYUIOP" })

S.bind hyper("g"), S.op("move", pos.centered)
S.bind hyper("o"), S.op("move", pos.fullscreen)
S.bind hyper("h"), S.op("move", pos.leftHalf)
S.bind hyper("j"), S.op("move", pos.bottomHalf)
S.bind hyper("k"), S.op("move", pos.topHalf)
S.bind hyper("l"), S.op("move", pos.rightHalf)
S.bind hyper("u"), S.op("move", pos.topLeftQuarter)
S.bind hyper("i"), S.op("move", pos.topRightQuarter)
S.bind hyper("n"), S.op("move", pos.bottomLeftQuarter)
S.bind hyper("m"), S.op("move", pos.bottomRightQuarter)

S.bind mod1("left"), nudge.left
S.bind mod1("right"), nudge.right
S.bind mod1("up"), nudge.up
S.bind mod1("down"), nudge.down

S.bind mod2("left"), resize.left
S.bind mod2("right"), resize.right
S.bind mod2("up"), resize.up
S.bind mod2("down"), resize.down
