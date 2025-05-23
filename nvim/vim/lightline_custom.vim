" =============================================================================
" Filename: vim/lightline_custom.vim
" Original Filename: https://github.com/itchyny/lightline.vim/blob/master/autoload/lightline/colorscheme/OldHope.vim
" Author: Kaitachi
" License: MIT License
" Last Change: 2025/04/12 12:27:34.
" =============================================================================

let s:yellow = [ '#e5cd52' , 221 ]
let s:blue = [ '#4fb4d8' , 39 ]
let s:red = [ '#f92672' , 161 ]
let s:green = [ '#78bd65' , 41 ]
let s:orange = [ '#ef7c2a' , 202 ]
let s:white = [ '#ffffff' , 15 ]
let s:black = [ '#000000' , 232 ]
let s:lightGray = [ '#848794' , 245 ]
let s:gray = [ '#686b78' , 242 ]
let s:darkGray = [ '#45474f' , 238 ]
let s:veryDarkGray = [ '#1c1d21' , 234 ]
let s:errorBg = [ '#55393d' , 52 ]
let s:errorFg = [ '#ec7279' , 203 ]
let s:warningBg = [ '#4e432f' , 3 ]
let s:warningFg = [ '#deb974' , 15 ]
let s:mediumCyan = [ '#87dfff', 117 ]
let s:darkestCyan = [ '#005f5f', 23 ]
let s:darkBlue = [ '#0087af', 31 ]
let s:darkestBlue = [ '#005f87', 24 ]
let s:mediumGreen = [ '#5faf00', 70 ]
let s:darkGreen = [ '#008700', 28 ]
let s:darkestGreen = [ '#005f00', 22 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}, 'command': {}}

let s:p.normal.left = [ [ s:white, s:blue ], [ s:white, s:gray ] ]
let s:p.insert.left = [ [ s:white, s:green ], [ s:white, s:gray ] ]
let s:p.visual.left = [ [ s:white, s:orange ], [ s:white, s:gray ] ]
let s:p.replace.left = [ [ s:white, s:red ], [ s:white, s:gray ] ]
let s:p.terminal.left = [ [ s:darkestGreen, s:white, 'bold' ], [ s:white, s:darkGreen ] ]
let s:p.command.left = [ [ s:darkestCyan, s:white, 'bold' ], [ s:white, s:darkBlue ] ]

let s:p.inactive.right = [ [ s:darkGray, s:gray ], [ s:darkGray, s:gray ] ]
let s:p.inactive.left = [ [ s:lightGray, s:darkGray ], [ s:white, s:darkGray ] ]
let s:p.inactive.middle = [ [ s:white, s:darkGray ] ]

let s:p.normal.middle = [ [ s:white, s:darkGray ] ]
let s:p.normal.error = [ [ s:errorFg, s:errorBg ] ]
let s:p.normal.warning = [ [ s:warningFg, s:warningBg ] ]

let s:p.tabline.left = [ [ s:lightGray, s:darkGray ] ]
let s:p.tabline.tabsel = [ [ s:darkGray, s:yellow ] ]
let s:p.tabline.middle = [ [ s:yellow, s:veryDarkGray ] ]

let s:p.terminal.middle = [ [ s:mediumGreen, s:darkestGreen ] ]
let s:p.command.middle = [ [ s:mediumCyan, s:darkestBlue ] ]

let s:p.normal.right = copy(s:p.normal.left)
let s:p.insert.right = copy(s:p.insert.left)
let s:p.visual.right = copy(s:p.visual.left)
let s:p.replace.right = copy(s:p.replace.left)
let s:p.terminal.right = [ [ s:darkestGreen, s:mediumGreen ], [ s:mediumGreen, s:darkGreen ], [ s:mediumGreen, s:darkestGreen ] ]
let s:p.command.right = [ [ s:darkestCyan, s:mediumCyan ], [ s:mediumCyan, s:darkBlue ], [ s:mediumCyan, s:darkestBlue ] ]
let s:p.tabline.right = copy(s:p.tabline.left)

let g:lightline#colorscheme#custom#palette = lightline#colorscheme#flatten(s:p)
