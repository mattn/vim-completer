" TODO
"tag
"tag_listfiles
"user
"custom,
"customlist,

function! completer#augroup()
  redir => result
  silent augroup
  redir END
  return split(join(split(result, '\n'), ' '), '\s\+')
endfunction

function! completer#buffer()
  return map(range(1, bufnr('$')), 'bufname(v:val)')
endfunction

function! completer#behave()
  return ['mswin', 'xterm']
endfunction

function! completer#color()
  return map(split(globpath(&rtp, 'colors/*.vim'), "\n"), 'fnamemodify(v:val, ":t:r")')
endfunction

function! completer#command()
  redir => result
  silent command
  redir END
  return map(split(result, '\n'), 'matchstr(v:val, "^\\s\\+\\zs\\S\\+\\ze")')
endfunction

function! completer#compiler()
  return map(split(globpath(&rtp, 'compiler/*.vim'), "\n"), 'fnamemodify(v:val, ":t:r")')
endfunction

function! completer#cscope()
  redir => result
  silent cscope
  redir END
  return filter(map(split(result, '\n'), 'matchstr(v:val, "^\\S\\+\\ze :")'), '!empty(v:val)')
endfunction

function! completer#dir()
  return filter(split(glob('*'), "\n"), 'isdirectory(v:val)')
endfunction

function! completer#environment()
  return map(split(system(has('win32') ? 'set' : 'env'), "\n"), 'matchstr(v:val, "^[^=]\\+")')
endfunction

function! completer#event()
  return ['BufNewFile', 'BufReadPre', 'BufRead', 'BufReadPost', 'BufReadCmd', 'FileReadPre', 'FileReadPost', 'FileReadCmd', 'FilterReadPre', 'FilterReadPost', 'StdinReadPre', 'StdinReadPost', 'BufWrite', 'BufWritePre', 'BufWritePost', 'BufWriteCmd', 'FileWritePre', 'FileWritePost', 'FileWriteCmd', 'FileAppendPre', 'FileAppendPost', 'FileAppendCmd', 'FilterWritePre', 'FilterWritePost', 'BufAdd', 'BufCreate', 'BufDelete', 'BufWipeout', 'BufFilePre', 'BufFilePost', 'BufEnter', 'BufLeave', 'BufWinEnter', 'BufWinLeave', 'BufUnload', 'BufHidden', 'BufNew', 'SwapExists', 'FileType', 'Syntax', 'EncodingChanged', 'TermChanged', 'OptionSet', 'VimEnter', 'GUIEnter', 'GUIFailed', 'TermResponse', 'QuitPre', 'VimLeavePre', 'VimLeave', 'FileChangedShell', 'FileChangedShellPost', 'FileChangedRO', 'ShellCmdPost', 'ShellFilterPost', 'CmdUndefined', 'FuncUndefined', 'SpellFileMissing', 'SourcePre', 'SourceCmd', 'VimResized', 'FocusGained', 'FocusLost', 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI', 'WinEnter', 'WinLeave', 'TabEnter', 'TabLeave', 'CmdwinEnter', 'CmdwinLeave', 'InsertEnter', 'InsertChange', 'InsertLeave', 'InsertCharPre', 'TextChanged', 'TextChangedI', 'ColorScheme', 'RemoteReply', 'QuickFixCmdPre', 'QuickFixCmdPost', 'SessionLoadPost', 'MenuPopup', 'CompleteDone', 'User']
endfunction

function! completer#expression()
  " TODO
  return completer#var() + completer#function() 
endfunction

function! completer#file()
  return filter(split(glob('*'), "\n"), 'isfilereadable(v:val)')
endfunction

function! completer#file_in_path()
  " TODO
  return globpath(&path, '*', 0, 1)
endfunction

function! completer#filetype()
  " TODO
  return map(split(globpath(&rtp, 'ftplugin/*.vim'), "\n"), 'fnamemodify(v:val, ":t:r")') + filter(split(globpath(&rtp, 'ftplugin/*'), "\n"), 'isdirectory(v:val)')
endfunction

function! completer#function()
  redir => result
  silent function
  redir END
  return filter(map(split(result, '\n'), 'matchstr(v:val, "^function \\zs[^(]\\+")'), '!empty(v:val)')
endfunction

function! completer#help()
  " TODO
  return []
endfunction

function! completer#highlight()
  redir => result
  silent highlight
  redir END
  return filter(map(split(result, '\n'), 'matchstr(v:val, "^\\S\\+\\ze\s")'), '!empty(v:val)')
endfunction

function! completer#history()
  return ['/', ':', '=', '>', '?', '@', 'all', 'cmd', 'debug', 'expr', 'input', 'search']
endfunction

function! completer#var()
  " TODO
  redir => result
  silent let
  redir END
  return filter(map(split(result, '\n'), 'matchstr(v:val, "^\\S\\+\\ze\s")'), '!empty(v:val)')
endfunction

function! completer#mapping()
  " TODO
  redir => result
  silent map
  redir END
  return map(split(result, '\n'), 'matchstr(v:val[3:], "^\\S\\+\\ze\s")')
endfunction

function! completer#locale()
  return map(split(globpath(&rtp, 'lang/menu_*.vim'), "\n"), 'fnamemodify(v:val, ":t:r")[5:]')
endfunction

function! completer#menu()
  redir => result
  silent menu
  redir END
  return filter(map(split(result, '\n'), 'escape(substitute(matchstr(v:val, "^\\s*[0-9]\\+\\s\\+\\zs.*"), "&", "", "g"), " ")'), '!empty(v:val)')
endfunction

function! completer#option()
  redir => result
  silent version
  redir END
  return map(split(join(filter(split(result, '\n'), 'v:val=~"^[+-]"'), " "), '\s\+'), 'v:val[1:]')
endfunction

function! completer#shellcmd()
  return map(globpath(tr($PATH, ';\', ',/'), '*', 0, 1), 'fnamemodify(v:val, ":t")')
endfunction

function! completer#sign()
  return ['define', 'jump', 'list', 'place', 'undefine', 'unplace']
endfunction
