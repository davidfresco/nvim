vim.cmd([[
let w:zoomed = 0
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

silent! call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ofirgall/ofirkai.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'folke/neodev.nvim'
call plug#end()
]])

require("plugins/nvim-tree")
require("plugins/ofirkai")
require("plugins/nvim-cmp")
require("plugins/nvim-treesitter")
require("plugins/lualine")
require("plugins/nvim-lsp-manager")
require("plugins/nvim-lspconfig")

vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab
map <C-f> :NvimTreeToggle<CR>
map <C-t> :$tabnew<CR>
map <C-_> gc
map <C-d> :q<CR>
nmap { gT
nmap } gt
tnoremap <Esc> <C-\><C-n>
vmap <C-c> y :call system('xclip', @0)<CR>
set colorcolumn=80

hi TabLineFill guibg=#707070
hi TabLineSel guifg=#f1f1f1 guibg=#282923
hi Tabline guifg=#f1f1f1 guibg=#505050
hi LineNr guifg=#818181 guibg=#282923
hi CursorLineNr guifg=#f1f1f1 guibg=#36352a
hi ColorColumn guibg=#303030
]])

function dump_table (object)
    if type(object) == "table" then
        local table_contents = ""
        for key, value in pairs(object) do
            table_contents = table_contents .. '"' .. key .. '": ' .. dump_table(value) .. "\n"
        end
        table_contents = table_contents:gsub("\n$", "")
        table_contents = table_contents:gsub("^(.+)", "    %1")
        table_contents = table_contents:gsub("\n", "\n    ")
        return "{\n" .. table_contents .. "\n}"
    elseif type(object) == "string" then
        return '"' .. object .. '"'
    else
        return tostring(object)
    end
end

function get_diagnostics()
    local diags = vim.diagnostic.get(0)
    print(dump_table(diags))
end

