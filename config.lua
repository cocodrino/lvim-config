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
--lvim.colorscheme = "oceanic_material"
lvim.colorscheme = "oceanic_material"
lvim.transparent_window = true
vim.g.material_style = "deep ocean"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = "<Esc> :w<cr>hi"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
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
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
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
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black" },
--   {
--     exe = "prettier",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "black" },
--   {
--     exe = "eslint_d",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "javascriptreact" },
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

 lvim.lang.python.formatters = {
  {
    exe = "black"
  }
}

vim.cmd[[
  let @q='ctrl + r ctrl + r q'
]]

vim.cmd[[
  map K <Plug>(expand_region_expand)
  map J <Plug>(expand_region_shrink)
]]

lvim.lsp.diagnostics.virtual_text = false

require("lsp-config.tailwindcss")

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


