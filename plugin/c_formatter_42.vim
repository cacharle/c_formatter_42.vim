"echo matchlist('acd', '\(a\)\?\(b\)\?\(c\)\?\(.*\)') **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    c_formatter_42.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cacharle <me@cacharle.xyz>                 +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/10/04 16:53:57 by cacharle          #+#    #+#              "
"    Updated: 2020/10/05 11:17:41 by cacharle         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

let s:formatter_path = expand('<sfile>:h:h') . '/c_formatter_42/c_formatter_42'

function! s:CFormatter42()
    normal! mq
    let l:equalprg_tmp = &equalprg
    let &equalprg = s:formatter_path
    silent normal! gg=G
    let &equalprg = l:equalprg_tmp
    normal! `q
    normal! zz
endfunction

if !exists('g:c_formatter_42_set_equalprg')
    let g:c_formatter_42_set_equalprg=0
endif

if !exists('g:c_formatter_42_format_on_save')
    let g:c_formatter_42_format_on_save=1
endif

if g:c_formatter_42_set_equalprg
    let &l:equalprg = s:formatter_path
endif

if g:c_formatter_42_format_on_save
    autocmd BufWritePre *.c,*.h :call s:CFormatter42()
endif

autocmd FileType c,cpp command! CFormatter42 call s:CFormatter42()
autocmd FileType c,cpp nnoremap <F2> :CFormatter42<CR>
