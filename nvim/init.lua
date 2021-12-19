require('plugins')

vim.g.mapleader = " "

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- set relative numbers
vim.opt.relativenumber = true
vim.opt.nu = true

-- fix tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- highlight current line
vim.opt.cursorline = true


vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.hidden = true


-- remove trailing whitespaces
vim.api.nvim_set_keymap("n", "<Leader>rw", ":%s/\\s\\+$//e", {noremap = true})

-- launch netrw
vim.api.nvim_set_keymap("n", "<Leader>n", ":Explore<CR>", {noremap = true})

-- hide search results
vim.api.nvim_set_keymap("n", "<Leader>ch", ":noh<CR>", {noremap = true})

-- indent blankline
require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
         "help",
         "terminal",
         "dashboard",
         "lspinfo",
         "TelescopePrompt",
         "TelescopeResults",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
}

-- telescope
require('telescope').setup {
    extensions = {
        fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('fzf')
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", {noremap = true})

-- treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
    },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- lualine
local function breadcrumbs()
    return require("nvim-treesitter").statusline({
        indicator_size = 50,
        type_patterns = {'class', 'function', 'method'},
        transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
        separator = ' -> '
    })
end

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = {'│', '│'},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename', breadcrumbs},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

vim.cmd [[
    filetype plugin indent on

    syntax enable

    set mouse=a

    set noshowmode

    set signcolumn=yes
    set colorcolumn=80

    let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

    let g:NERDCreateDefaultMappings = 0
    map <leader>cc <plug>NERDCommenterToggle
    map <leader>/ <plug>NERDCommenterToggle

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
    colorscheme one
]]
