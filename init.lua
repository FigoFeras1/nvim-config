vim.o.termguicolors=true
vim.g.t_Co='256'
-- vim.g['doom_one_terminal_colors'] = true
vim.o.cursorline=true
vim.o.syntax='on'
vim.o.number=true
vim.o.relativenumber=true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.tabstop=4
vim.o.smarttab=true
vim.o.expandtab=true
vim.o.ruler=true
vim.o.wildmenu=true
vim.o.virtualedit='onemore'
vim.o.autoindent=true
vim.o.wrap=false
vim.o.incsearch=true
vim.bo.filetype='on'
vim.opt.formatoptions:remove('o')
vim.o.smartcase=true
vim.o.ignorecase=true
vim.o.encoding='UTF-8'
vim.o.wildmenu=true
vim.opt.mouse:append('a')
vim.opt.completeopt = {'menu'}
vim.opt.shortmess:append('c')
vim.o.spell=true
vim.o.omnifunc='syntaxcomplete#Complete'

vim.o.lazyredraw=true
vim.o.title=true

vim.g.c_syntax_for_h = 1
--vim.g.cursorhold_updatetime = 100
vim.g.autoformat_autoindent = 1


--vim.api.nvim_command([[ highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=red ]])
vim.api.nvim_command([[ highlight SneakLabel guifg=blue guibg=white ctermfg=blue ctermbg=white ]])

vim.api.nvim_command([[ highlight PounceGap cterm=bold ctermfg=0 gui=bold guifg=#555555 guibg=#98be65]])
vim.api.nvim_command([[ highlight PounceMatch cterm=bold ctermfg=0 gui=bold guifg=#555555 guibg=#98be65]])

vim.api.nvim_command([[ nmap <Leader>s :Pounce<CR> ]])

vim.api.nvim_command([[
    function! SuperTab()
        let l:tab_characters = [')', ']', "'", '"', '}']
        let l:char = strpart(getline('.'),col('.')-1,1)

        return (index(l:tab_characters, l:char) != -1) ? "\<Right>" : "\<Tab>"

        endif
    endfunction

    imap <silent> <Tab> <C-R>=SuperTab()<CR>
    let g:sneak#label=1

]])

vim.o.pumheight=7
vim.o.pumwidth=10

vim.g.window_height=15
vim.g.window_width=10

vim.g.mapleader=' '


vim.api.nvim_set_keymap('n', '<Leader>src', ':w<CR>:source<CR>:nohlsearch<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>rc', ':tabe $MYVIMRC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>nh', ':noh<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<M-Right>', '<C-W>>', {noremap = false})
vim.api.nvim_set_keymap('n', '<M-Left>', '<C-W><', {noremap = false})
vim.api.nvim_set_keymap('n', '<M-Down>', ':resize +1<CR>', {noremap = false})
vim.api.nvim_set_keymap('n', '<M-Up>', ':resize +1<CR>', {noremap = false})

vim.api.nvim_set_keymap('n', 'gh', '<C-W><C-H>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gj', '<C-W><C-J>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gk', '<C-W><C-K>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gl', '<C-W><C-L>', {noremap = true})

vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>o', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', { noremap = true, silent = true })

-- Autocmds

vim.api.nvim_command([[ autocmd BufEnter * :set fo-=o ]])
--vim.api.nvim_command([[ autocmd BufWrite * :Autoformat ]])

vim.api.nvim_set_keymap('n', '<Leader>fmt', ':!clang-format -i -style="{ BasedOnStyle: google, IndentWidth: 4, Cpp11BracedListStyle: false }" %:t<CR><CR>', { noremap = true, silent = true })
vim.api.nvim_command([[ autocmd BufWrite *.py :!autopep8 -i %:t ]])
vim.api.nvim_command([[ au FileType python setlocal formatprg=autopep8\ - ]])



-- Neovide Settings
vim.g.neovide_cursor_animation_length=0
vim.g.neovide_cursor_trail_length=0
vim.g.neovide_remember_window_size=true
