"echo matchlist('acd', '\(a\)\?\(b\)\?\(c\)\?\(.*\)') **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    c_formatter_42.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cacharle <me@cacharle.xyz>                 +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/10/04 16:53:57 by cacharle          #+#    #+#              "
"    Updated: 2020/10/10 06:14:40 by cacharle         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

let g:c_formatter_42_exec           = get(g:, 'c_formatter_42_exec', 'c_formatter_42')
let g:c_formatter_42_set_equalprg   = get(g:, 'c_formatter_42_set_equalprg', 0)
let g:c_formatter_42_format_on_save = get(g:, 'c_formatter_42_format_on_save', 0)

function! s:CFormatter42()
    normal! mq
    let l:equalprg_tmp = &equalprg
    let &equalprg = g:c_formatter_42_exec
    silent normal! gg=G
    let &equalprg = l:equalprg_tmp
    normal! `q
    normal! zz
endfunction

if g:c_formatter_42_set_equalprg
    let &l:equalprg = s:formatter_path
endif

if g:c_formatter_42_format_on_save
    autocmd BufWritePre *.c,*.h :call s:CFormatter42()
endif

autocmd FileType c,cpp command! CFormatter42 call s:CFormatter42()
autocmd FileType c,cpp nnoremap <F2> :CFormatter42<CR>
