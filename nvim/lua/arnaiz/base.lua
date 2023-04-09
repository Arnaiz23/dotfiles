-- Define variables
local opt = vim.opt


opt.number = true            -- set numbers
opt.relativenumber = true    -- set relatives numbers
opt.mouse = "a"              -- Enable the mouse
opt.numberwidth = 1          -- The width of the numbers
opt.clipboard = "unnamed"    -- That you copy in the visual mode, saved in the clipboard
opt.showcmd = true           -- show commands when I writted
opt.encoding = "utf-8"       -- codification
opt.showmatch = true         -- Show the start and the end of the parenthesis ...
opt.sw = 2                   -- Indent with 2 spaces
opt.laststatus = 2           -- Bottom menu visible

vim.cmd.syntaxenable('true') -- Active the syntax
