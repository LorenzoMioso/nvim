" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['d'] = [ ':bd'                        , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['q'] = [ ':q!'                        , 'hard quit']

" Group mappings

let g:which_key_map.c = {
      \ 'name' : '+code' ,
      \ 'c' : ['<Plug>Commentary'                    , 'comment'],
      \ 'f' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ }

let g:which_key_map.l = {
      \ 'name' : '+latex' ,
      \ 'c' : [':CocCommand latex.Build'             , 'compile'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
