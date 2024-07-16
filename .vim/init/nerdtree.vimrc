" file explorer
let NERDTreeMapActivateNode='<space>'
let NERDTreeMinimalUI=1

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview()), <bang>0)
