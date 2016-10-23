" vim-qf - Tame the quickfix window
" Maintainer:	romainl <romainlafourcade@gmail.com>
" Version:	0.1.0
" License:	MIT
" Location:	autoload/statusline.vim
" Website:	https://github.com/romainl/vim-qf
"
" See :help qf for help.
"
" If this doesn't work and you installed vim-qf manually, use the following
" command to index vim-qf's documentation:
"
" :helptags ~/.vim/doc
"
" If you use a runtimepath/plugin manager, read its documentation.

let s:save_cpo = &cpo
set cpo&vim

" used to inject the current title into the current status line
function! qf#statusline#SetStatusline()
    if exists("b:isLoc")
        if b:isLoc == 1
            let titles = getwinvar(winnr("#"), "qf_location_titles")

            if len(titles) > 0
                return titles[-1]
            else
                if exists("w:quickfix_title")
                    return w:quickfix_title
                else
                    return ""
                endif
            endif
        else
            if exists("g:qf_quickfix_titles")
                if len(g:qf_quickfix_titles) > 0
                    return g:qf_quickfix_titles[-1]
                else
                    if exists("w:quickfix_title")
                        return w:quickfix_title
                    else
                        return ""
                    endif
                endif
            else
                if exists("w:quickfix_title")
                    return w:quickfix_title
                else
                    return ""
                endif
            endif
        endif
    endif
endfunction

let &cpo = s:save_cpo

finish

" template
function qf#statusline#FunctionName(argument)
    if exists("b:isLoc")
        if b:isLoc == 1
            " do something if we are in a location list
        else
            " do something else if we are in a quickfix list
        endif
    endif
endfunction