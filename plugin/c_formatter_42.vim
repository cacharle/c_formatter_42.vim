" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    c_formatter_42.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cacharle <me@cacharle.xyz>                 +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/10/04 16:53:57 by cacharle          #+#    #+#              "
"    Updated: 2021/02/24 09:50:01 by cacharle         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

let g:c_formatter_42_exec           = get(g:, 'c_formatter_42_exec', 'c_formatter_42')
let g:c_formatter_42_set_equalprg   = get(g:, 'c_formatter_42_set_equalprg', 0)
let g:c_formatter_42_format_on_save = get(g:, 'c_formatter_42_format_on_save', 0)

if !executable(g:c_formatter_42_exec)
    echom 'Installing c_formatter_42'
    !pip3 install --user c-formatter-42
endif

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

function! s:Norminette()
    let l:current_file = expand('%:p')

    " let l:saved_makeprg = &makeprg
    " let &makeprg = 'norminette'
    " execute 'make! ' . l:current_file

    belowright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'Norminette result for ' . l:current_file)
    call setline(2, '')
    call setline(3, repeat('-', 80))
    execute '$read !'. 'norminette ' . l:current_file
    setlocal nomodifiable
    let l:split_height = line('$')
    if l:split_height > 30
        let l:split_height = 30
    endif
    if l:split_height < 10
        let l:split_height = 10
    endif
    silent execute 'resize ' . l:split_height
    silent normal! gg
    silent nnoremap <nowait> <buffer> q :q<CR>

    " let &makeprg = l:saved_makeprg
endfunction

autocmd FileType c,cpp command! Norminette call s:Norminette()

