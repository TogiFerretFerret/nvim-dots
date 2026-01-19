set number
ca nto NvimTreeToggle
ca fixai %s/ //g
set foldmethod=indent
wincmd p
filetype plugin on
syntax on
hi Normal guibg=NONE ctermbg=NONE
hi! link NvimTreeNormalNC NormalNC
au ColorScheme * hi! link NvimTreeNormalNC NormalNC
