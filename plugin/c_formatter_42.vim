" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    c_formatter_42.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cacharle <me@cacharle.xyz>                 +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/10/04 16:53:57 by cacharle          #+#    #+#              "
"    Updated: 2020/10/04 17:29:53 by cacharle         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

let s:formatter_path = expand('<sfile>:h:h') . '/c_formatter_42/c_formatter_42'

function! s:CFormatter42()
    normal! mq
    let s:equalprg_tmp = &equalprg
    let &equalprg = s:formatter_path
    normal! gg=G
    let &equalprg = s:equalprg_tmp
    normal! `q
    normal! zz
endfunction

command! CFormatter42 call s:CFormatter42()
nnoremap <F3> :CFormatter42<CR>
