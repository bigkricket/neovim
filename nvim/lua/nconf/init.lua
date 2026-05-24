-- ~/.config/nvim/lua/nconf/init.lua

vim.g.mapleader = " "

require("nconf.lazy_init")
require("nconf.remap")
require("nconf.theme")
require("nconf.treesitter")
require("nconf.set")
vim.lsp.enable("rust_analyzer")
