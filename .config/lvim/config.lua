--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
-- vim.g.copilot_no_tab_map = true
lvim.log.level = "warn"
-- lvim.format_on_save = true
lvim.format_on_save = {
    ---@usage pattern string pattern used for the autocommand (Default: '*')
    pattern = "*.lua",
    ---@usage timeout number timeout in ms for the format request (Default: 1000)
    timeout = 1000,
    ---@usage filter func to select client
    filter = require("lvim.lsp.handlers").format_filter,
}
lvim.colorscheme = "everforest"
-- lvim.colorscheme = "kanagawa"
vim.opt.background = "dark"
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_cursor = 'orange'
-- vim.g.everforest_transparent_background = 0
vim.g.everforest_ui_contrast = 'high'
vim.g.everforest_diagnostic_line_highlight = 1
-- vim.g.material_style = "palenight"
-- vim.g.tokyonight_style = "storm"
-- vim.g.edge_better_performance = 1
-- vim.g.edge_style = 'aura'

-- lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<cr>")
vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float(0,{scope='line'})<CR>", opts)
-- place this in one of your configuration file(s)
vim.keymap.set('', 's',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
    , {})
vim.keymap.set('', 'S',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
    , {})
vim.keymap.set('', 'w',
    "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
vim.keymap.set('', 'W',
    "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
vim.keymap.set('', 'e', "<cmd>lua require'hop'.hint_patterns()<cr>", {})

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--     ["<C-j>"] = actions.move_selection_next,
--   i = {
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["z"] = { "<cmd>StripWhitespace<cr>", "Clear Trailing Spaces" }
-- lvim.builtin.which_key.mappings["a"] = {
--     name = "+Copilot",
--     s = { "<cmd>vertical Copilot<cr>", "Synthesize solutions" },
--     S = { "<cmd>Copilot status<cr>", "Status" },

--     d = { function()
--         vim.cmd("Copilot disable")
--         lvim.builtin.cmp.experimental.ghost_text = true
--         require("cmp").setup(lvim.builtin.cmp) -- WARNING due to the overloading implementation of LunarVim over nvim-cmp
--     end, "Disable Copilot" },

--     e = { function()
--         vim.cmd("Copilot enable")
--         lvim.builtin.cmp.experimental.ghost_text = false
--         require("cmp").setup(lvim.builtin.cmp)
--     end, "Enable Copilot" },
-- }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }
lvim.builtin.which_key.mappings["v"] = {
    name = "+Vista",
    c = { "<cmd>Vista ctags<CR>", "Ctags" },
    l = { "<cmd>Vista nvim_lsp<CR>", "LSP" },
}
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
    l = { "<cmd>Trouble loclist<cr>", "Location List" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    t = { "<cmd>Trouble lsp_type_definitions<cr>", "Type Definitions" },
}
lvim.builtin.which_key.mappings["D"] = {
    name = "+Diffview",
    o = { "<cmd>DiffviewOpen<cr>", "Open" },
    c = { "<cmd>DiffviewClose<cr>", "Close" },
    h = { "<cmd>DiffviewFileHistory<cr>", "File History" },
    f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files" },
    l = { "<cmd>DiffviewLog<cr>", "Log" },
    r = { "<cmd>DiffviewRefresh<cr>", "Refresh" },
    t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files" },
}
lvim.builtin.which_key.mappings["S"] = {
    name = "+Spectre",
    o = { "<cmd>lua require('spectre').open()<cr>", "Open" },
    c = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Current word" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current file" },
}
lvim.builtin.which_key.mappings["R"] = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" }
lvim.builtin.which_key.mappings["N"] = { "<cmd>Neogit<cr>", "Neogit" }
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.nvim_tree_show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
}


-- generic LSP settings
lvim.lsp.diagnostics.virtual_text = false

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     { command = "autopep8", filetypes = { "python" } },
-- { command = "isort", filetypes = { "python" } },
-- {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
-- },
-- }

-- -- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--     { command = "flake8", filetypes = { "python" } },
--     {
--         -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--         command = "shellcheck",
--         ---@usage arguments to pass to the formatter
--         -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--         extra_args = { "--severity", "warning" },
--     },
--     {
--         command = "codespell",
--         ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--         filetypes = { "javascript", "python" },
--     },
-- }

-- Additional Plugins
lvim.plugins = {
    -- {
    --   "folke/trouble.nvim",
    --   cmd = "TroubleToggle",
    -- },

    { "EdenEast/nightfox.nvim",
        config = function()
            pcall(function()
                if lvim and lvim.colorscheme == "terafox" then
                    require("nightfox").setup()
                    lvim.builtin.lualine.options.theme = "terafox"
                end
            end)
        end,
    },
    {
        "sainnhe/gruvbox-material",
        "folke/tokyonight.nvim",
        "sainnhe/edge",
        "bluz71/vim-nightfly-guicolors",
        "sainnhe/everforest",
    },
    {
        "catppuccin/nvim",
        as = "catppuccin"
    },
    { -- Lua

        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-gps").setup()
        end,
    },
    -- {
    --     'sainnhe/sonokai',
    -- },
    {
        "sindrets/diffview.nvim",
        config = function()
            require('configs.diffview')
        end,
    },
    {
        'folke/trouble.nvim',
        config = function()
            require('configs.trouble')
        end,
    },

    {
        'tami5/lspsaga.nvim',
        config = function()
            require('configs.lspsaga')
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require('configs.blankline')
        end
    },
    {

        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                -- tabkey = '', -- key to trigger tabout, set to an empty string to disable
                -- backwards_tabkey = 'll', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
    },

    {
        "psliwka/vim-smoothie",
        -- 'ggandor/lightspeed.nvim',
        'mbbill/undotree',
        "liuchengxu/vista.vim",
    },
    {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    { "marko-cerovac/material.nvim" },
    {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
        },
        config = function()
            require('configs.neogit')
        end,
    },
    {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        after = "nvim-cmp",
        config = function()
            require('configs.cmp-tabnine')
        end,
    },

    -- {
    --     "github/copilot.vim",
    --     after = "nvim-cmp",
    --     config = function()
    --         require('configs.copilot')
    --     end,
    -- },
    { 'rebelot/kanagawa.nvim', },
    {
        "ntpeters/vim-better-whitespace", -- VimScript
    },
    {
        'rhysd/vim-clang-format',
    },
    {
        "BenGH28/neo-runner.nvim",
        ft = { "c", "cpp" },
        config = function()
            require('configs.runner')
        end,
    },
    { "nvim-pack/nvim-spectre", },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})


-- vim.cmd [[ au InsertEnter * imap <silent><script><expr> <C-J> copilot#Accept("\<CR>") ]]
vim.cmd([[
  command! DisableVirtualText lua vim.diagnostic.config({ virtual_text = false })
  command! Black 2TermExec cmd='black %'
  command! RunPython 2TermExec cmd='python %'
  command! RunC 2TermExec cmd='g++ -std=c++17 -Wshadow -Wall -Winvalid-pch -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG % -o %:p:h/%:t:r && ./%:r'
  command! CompileC 2TermExec cmd='g++ -std=c++17 -Wshadow -Wall -Winvalid-pch -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG % -o %:p:h/%:t:r'
  command! RunCO2 2TermExec cmd='g++ -std=c++17 -Wshadow -Wall -O2 % -o %:p:h/%:t:r && ./%:r'
  command! CompileCO2 2TermExec cmd='g++ -std=c++17 -Wshadow -Wall -O2 % -o %:p:h/%:t:r'
]])
vim.cmd [[ au BufEnter * DisableVirtualText ]]
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
vim.cmd [[ autocmd Filetype c,cpp autocmd BufWritePre <buffer> ClangFormat ]]
-- vim.cmd [[ autocmd Filetype python autocmd BufWritePre <buffer>  Black ]]
vim.cmd [[ autocmd BufNewFile *.cpp 0r ~/vim_template/skeleton.cpp ]]
vim.cmd [[ autocmd BufNewFile *.py 0r ~/vim_template/skeleton.py ]]

-- General options
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.go.cmdheight = 1
vim.go.termguicolors = true
vim.go.showmode = true
vim.go.laststatus = 3
vim.go.scrolloff = 4
vim.opt.shell = "/bin/sh"

-- clangd options


local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

local cmp_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup {
    capabilities = clangd_capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--cross-file-rename",
        "--completion-style=detailed",
    },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
    }
}
