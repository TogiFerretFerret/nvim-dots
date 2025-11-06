"echo "Read main.vim successfully" 
" Make it look pretttty by making it slower
" sleep 100ms
"echo "Setting up basic settings"
" sleep 100ms
set number
ca nto NvimTreeOpen
ca fixai %s/ //g
set foldmethod=indent
" sleep 100ms
wincmd p
"echo "Swapped to previous window"
" sleep 100ms
filetype plugin on
"echo "Filetype plugin enabled"
" sleep 100ms
syntax on
"echo "Syntax highlighting enabled"
" sleep 100ms
"echo "Setting up statusline"
" sleep 100ms
function! DisableST()
  return " "
endfunction
" sleep 100ms
" Set statusline to empty string
"echo "Setting statusline to empty string"
" sleep 100ms
au BufEnter NvimTree setlocal statusline=%!DisableST()
" sleep 100ms
"echo "Setting up NvimTree"
" sleep 100ms
hi Normal guibg=NONE ctermbg=NONE
" sleep 100ms
hi! link NvimTreeNormalNC NormalNC
" sleep 100ms
" Autocommand on colorscheme change
"echo "Setting NvimTreeNormalNC to NormalNC"
" sleep 100ms
au ColorScheme * hi! link NvimTreeNormalNC NormalNC
"echo "NvimTreeNormalNC linked to NormalNC"
" sleep 100ms
"echo "Setting up Magma"
" sleep 100ms
" sleep 100ms
"echo "Successfully loaded main.vim"
