--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
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
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

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
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
{"glepnir/oceanic-material"},
    {"AndrewRadev/tagalong.vim"},
    {"tpope/vim-surround"},
    {"Olical/conjure"},
    {"vim-test/vim-test"},
    {"jmcantrell/vim-virtualenv"},
    -- {"beeender/Comrade"},
    {
      "p00f/nvim-ts-rainbow",
    },

  --   {"wfxr/minimap.vim",
  --     run = "cargo install --locked code-minimap",
  -- -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
  --     config = function ()
  --       vim.cmd ("let g:minimap_width = 10")
  --       vim.cmd ("let g:minimap_auto_start = 1")
  --       vim.cmd ("let g:minimap_auto_start_win_enter = 1")
  --     end,
  -- },

    {"ggandor/lightspeed.nvim"},

    
    {'phaazon/hop.nvim',
     config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
     end
    },
  

    {"kana/vim-arpeggio"},
    {"alvan/vim-closetag"},
    {"terryma/vim-expand-region"},
    {"mattn/emmet-vim"},
    {"guns/vim-sexp"},
    {"tpope/vim-sexp-mappings-for-regular-people"},
    {"marko-cerovac/material.nvim"},
    {"cuducos/yaml.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },

    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require "lsp_signature".on_attach()
      end
    },
    {
      "kosayoda/nvim-lightbulb",
      config = function()
        vim.api.nvim_command("highlight LightBulbVirtualText guifg=red")
      end
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },


    {
      "rmagatti/goto-preview",
      config = function()
      require('goto-preview').setup {
            width = 120; -- Width of the floating window
            height = 25; -- Height of the floating window
            default_mappings = false; -- Bind default mappings
            debug = false; -- Print debug information
            opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
            post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
            -- You can use "default_mappings = true" setup option
            -- Or explicitly set keybindings
            -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
            -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
            -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        }
      end
    },


    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
          require("nvim-lastplace").setup({
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            lastplace_ignore_filetype = {
              "gitcommit", "gitrebase", "svn", "hgcommit",
            },
            lastplace_open_folds = true,
          })
        end,
      },

    {

      "xiyaowong/nvim-transparent",
      config = function()
          require("transparent").setup({
            enable = true, -- boolean: enable transparent
            extra_groups = { -- table/string: additional groups that should be cleared
              -- In particular, when you set it to 'all', that means all available groups

              -- example of akinsho/nvim-bufferline.lua
              "BufferLineTabClose",
              "BufferlineBufferSelected",
              "BufferLineFill",
              "BufferLineBackground",
              "BufferLineSeparator",
              "BufferLineIndicatorSelected",
            },
            exclude = {}, -- table: groups you don't want to clear
          })

      end
    },



}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

--Arpeggio inoremap jk <Esc>
--Arpeggio inoremap kl <Esc>v
--Arpeggio nnoremap jk a
--Arpeggio nnoremap kl v

--Arpeggio vnoremap jk <Esc>
--Arpeggio vnoremap kl <Esc>i
vim.cmd[[
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i','',0,'kl', '<Esc>v')
call arpeggio#map('v','',0,'jk','<Esc>')
]]

-- call arpeggio#map('n','',0,'jk','a')
-- call arpeggio#map('n','',0,'kl','v')
 -- lvim.lang.python.linters = {
 --   {exe = "flake8"}
 -- }


vim.cmd[[
  let @q='ctrl + r ctrl + r q'
]]

vim.cmd[[
  map K <Plug>(expand_region_expand)
  map J <Plug>(expand_region_shrink)
]]

lvim.lsp.diagnostics.virtual_text = false

-- require("lsp-config.tailwindcss")

vim.cmd[[
nmap <silent> t<C-n> :TestNearest --verbose<CR>
nmap <silent> t<C-f> :TestFile --format documentation<CR>
nmap <silent> t<C-s> :TestSuite --fail-fast<CR>
nmap <silent> t<C-l> :TestLast --backtrace<CR>
nmap <silent> t<C-g> :TestVisit<CR>
]]

lvim.builtin.terminal.direction = "horizontal"

vim.g.material_style = 'darker'

vim.g.closetag_filenames = "*.html"
vim.g.closetag_xhtml_filenames = "*.jsx,*.svelte"
vim.g.closetag_shortcut = '>'

vim.cmd[[
let g:user_emmet_leader_key='>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
]]

vim.cmd[[
  let g:expand_region_text_objects = {
        \ 'iw'  :0,
        \ 'iW'  :0,
        \ 'i"'  :0,
        \ 'i''' :0,
        \ 'i]'  :1,
        \ 'ib'  :1,
        \ 'iB'  :1,
        \ 'il'  :1,
        \ 'ip'  :1,
        \ 'ie'  :0,
        \ }
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)
]]

vim.cmd[[
set background=dark
colorscheme oceanic_material
]]

vim.g.oceanic_material_transparent_background = true
vim.g.oceanic_material_allow_bold = true
vim.g.oceanic_material_allow_underline = true
vim.g.oceanic_material_allow_undercurl= true

--:hi normal guibg=00000



vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})


-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})


-- normal mode (sneak-like)
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- visual mode (sneak-like)
vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

vim.api.nvim_set_option("clipboard","unnamed")

vim.cmd[[
  noremap <C-c> "+y
  noremap <C-v> "+p
]]
