-- Configure Buffer Line
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'

-- Use custom symbols
vim.g["airline_left_sep"] = '\u{e0b0}' -- 
vim.g["airline_right_sep"] = '\u{e0b2}' -- 

-- TODO: Convert these to non-cmd assignments
vim.cmd("let g:airline_symbols.branch = '\u{f126}'") -- 
--vim.g["airline_symbols"]["branch"] = '\u{f126}' -- 

-- Custom sections
vim.g["airline_section_z"] = '%l:%v | %p%%/%L%{g:airline_symbols.maxlinenr}'

