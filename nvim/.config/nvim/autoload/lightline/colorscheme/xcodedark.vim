if &background == 'dark'
  let s:shade0 = "#292a30"
  let s:shade1 = "#292a30"
  let s:shade2 = "#434449"
  let s:shade3 = "#434449"
  let s:shade4 = "#919195"
  let s:shade5 = "#c5c5c7"
  let s:shade6 = "#c5c5c7"
  let s:shade7 = "#dfdfe0"
  let s:accent0 = "#ff8170"
  let s:accent1 = "#ffa14f"
  let s:accent2 = "#d9c97c"
  let s:accent3 = "#84b360"
  let s:accent4 = "#78c2b3"
  let s:accent5 = "#4eb0cc"
  let s:accent6 = "#b281eb"
  let s:accent7 = "#ff7ab2"
endif

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:shade1, s:accent5 ], [ s:shade7, s:shade2 ] ]
let s:p.normal.right = [ [ s:shade1, s:shade4 ], [ s:shade5, s:shade2 ] ]
let s:p.inactive.right = [ [ s:shade1, s:shade3 ], [ s:shade3, s:shade1 ] ]
let s:p.inactive.left =  [ [ s:shade4, s:shade1 ], [ s:shade3, s:shade0 ] ]
let s:p.insert.left = [ [ s:shade1, s:accent3 ], [ s:shade7, s:shade2 ] ]
let s:p.replace.left = [ [ s:shade1, s:accent1 ], [ s:shade7, s:shade2 ] ]
let s:p.visual.left = [ [ s:shade1, s:accent6 ], [ s:shade7, s:shade2 ] ]
let s:p.normal.middle = [ [ s:shade5, s:shade1 ] ]
let s:p.inactive.middle = [ [ s:shade4, s:shade1 ] ]
let s:p.tabline.left = [ [ s:shade6, s:shade2 ] ]
let s:p.tabline.tabsel = [ [ s:shade6, s:shade0 ] ]
let s:p.tabline.middle = [ [ s:shade2, s:shade4 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:accent0, s:shade0 ] ]
let s:p.normal.warning = [ [ s:accent2, s:shade1 ] ]

let g:lightline#colorscheme#xcodedark#palette = lightline#colorscheme#fill(s:p)
