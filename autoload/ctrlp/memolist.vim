if exists('g:loaded_ctrlp_memolist') && g:loaded_ctrlp_memolist
  finish
endif
let g:loaded_ctrlp_memolist = 1

let s:memolist_var = {
\  'init':   'ctrlp#memolist#init()',
\  'accept': 'ctrlp#memolist#accept',
\  'lname':  'memolist',
\  'sname':  'memolist',
\  'enter':  'ctrlp#memolist#enter()',
\  'exit':   'ctrlp#memolist#exit()',
\  'type':   'memolist',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:memolist_var)
else
  let g:ctrlp_ext_vars = [s:memolist_var]
endif

function! ctrlp#memolist#init()
  return s:list
endfunc

function! ctrlp#memolist#accept(mode, str)
  call ctrlp#exit()
  exe "edit ".g:memolist_path."/".a:str
endfunction

function! ctrlp#memolist#enter()
  let s:list = map(split(globpath(g:memolist_path, "*"), "\n"), 'fnamemodify(v:val, ":t")')
endfunction

function! ctrlp#memolist#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#memolist#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
