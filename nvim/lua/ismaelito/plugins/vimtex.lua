-- My configuration of the VimTeX plugin

-- Only load this plugin it has not yet been loaded for this buffer
vim.cmd([[ 
if exists("b:did_myvimtexsettings")
  finish
endif
let b:did_myvimtexsettings = 1
]])

-- PDF Viewer (Skim):
vim.g.vimtex_view_method = "skim"

-- PDF Viewer (Skim) for viewing a citation .pdf file
vim.g.vimtex_context_pdf_viewer = "skim"

-- Do not auto open quickfix on compile erros
vim.g.vimtex_quickfix_mode = 0

-- Ignore mappings
vim.g.vimtex_mappings_enabled = 1

-- Auto Indent
vim.g.vimtex_indent_enabled = 1

-- Syntax highlighting
vim.g.vimtex_syntax_enabled = 1

-- Ignorar en el .log los siguientes avisos (warnings):
vim.g.vimtex_log_ignore = {
	"Underfull",
	"Overfull",
	"specifier changed to",
	"Token not allowed in a PDF string",
}

-- Disable syntax conceal
vim.g.vimtex_syntax_conceal_disable = 1

-- Default is 500 lines and gave me lags on missed key presses
vim.g.vimtex_delim_stopline = 50

-- Don't open quickfix for warning messages if no errors are present
vim.g.vimtex_quickfix_open_on_warning = 0

-- Automatically open PDF viewer after first compilation
vim.g.vimtex_view_automatic = 1

vim.g.vimtex_compiler_latexmk = {
	aux_dir = "_aux-files",
	callback = 1,
	continuous = 1,
	executable = "latexmk",
	hooks = {},
	options = {
		"-shell-escape",
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}

vim.g.vimtex_compiler_latexmk_engine = {
	_ = "-lualatex",
}

-- Toggles shell escape on an off when using minted package
---------------------------------------------
-- Toggles shell escape compilation on and off
vim.cmd([[function! s:TexToggleShellEscape() abort
  if g:vimtex_compiler_latexmk.options[0] ==# "-shell-escape"
    " Disable shell escape
    call remove(g:vimtex_compiler_latexmk.options, 0)
  else
    " Enable shell escape
    call insert(g:vimtex_compiler_latexmk.options, "-shell-escape", 0)
  endif
  VimtexReload
  VimtexClean
endfunction

nmap <leader>te <Plug>TexToggleShellEscape
nnoremap <script> <Plug>TexToggleShellEscape <SID>TexToggleShellEscape
nnoremap <SID>TexToggleShellEscape :call <SID>TexToggleShellEscape()<CR>
]])

-- When loading new buffers, search for references to minted package in the
-- document preamble and enable shell escape if minted is detected.
vim.cmd([[silent execute "!head -n 20 " . expand("%") . ' | grep "minted" > /dev/null'
if ! v:shell_error  " 'minted' found in preamble
  call insert(g:vimtex_compiler_latexmk.options, "-shell-escape", 0)
endif
]])
---------------------------------------------

-- Close viewers when VimTeX buffers are closed (see :help vimtex-events)
vim.cmd([[ function! CloseViewers()
  if executable("xdotool")
        \ && exists("b:vimtex.viewer.xwin_id")
        \ && b:vimtex.viewer.xwin_id > 0
    call system("xdotool windowclose ". b:vimtex.viewer.xwin_id)
  endif
endfunction

augroup vimtex_event_close
  au!
  au User VimtexEventQuit call CloseViewers()
augroup END
]])
