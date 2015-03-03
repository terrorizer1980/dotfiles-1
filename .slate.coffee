# Aliases
sox = 'screenOriginX'
soy = 'screenOriginY'
ssx = 'screenSizeX'
ssy = 'screenSizeY'

# Config
S.config('gridRoundedCornerSize', 2)
S.config('gridCellRoundedCornerSize', 2)
nudgeAmt = '5%'
resizeAmt= '5%'

# Nudge
nudge =
  left: S.op('nudge', { x: "-#{nudgeAmt}", y: '+0' })
  right: S.op('nudge', { x: "+#{nudgeAmt}", y: '+0' })
  up: S.op('nudge', { x: '+0', y: "-#{nudgeAmt}" })
  down: S.op('nudge', { x: '+0', y: "+#{nudgeAmt}" })

# Resize
resize =
  left: S.op('resize', { width: "-#{resizeAmt}", height: '+0' })
  right: S.op('resize', { width: "+#{resizeAmt}", height: '+0' })
  up: S.op('resize', { width: '+0', height: "-#{resizeAmt}" })
  down: S.op('resize', { width: '+0', height: "+#{resizeAmt}" })

# Bindings
hyper = 'ctrl,alt,cmd,shift'

S.bind "r:#{hyper}", S.op('relaunch')
S.bind "u:#{hyper}", S.op('undo')
S.bind "g:#{hyper}", S.op('grid')
S.bind "q:#{hyper}", S.op('hint', { characters: 'QWERTYUIOP' })

S.bind 'left:ctrl,shift', nudge.left
S.bind 'right:ctrl,shift', nudge.right
S.bind 'up:ctrl,shift', nudge.up
S.bind 'down:ctrl,shift', nudge.down

S.bind 'left:alt,shift', resize.left
S.bind 'right:alt,shift', resize.right
S.bind 'up:alt,shift', resize.up
S.bind 'down:alt,shift', resize.down
