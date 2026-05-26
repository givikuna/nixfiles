vim.opt.guicursor = {
    "n-v-c-sm:block",
    "i-ci-ve:ver25",
    "r-cr-o:hor20",
}
vim.opt.guicursor:append "a:blinkwait0-blinkon0-blinkoff0"

vim.cmd [[
  highlight Cursor guifg=#282828 guibg=#fabd2f
  highlight CursorLine guibg=#3c3836
  highlight CursorLineNr guifg=#fabd2f
]]

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"

require("eyeliner").setup {
    highlight_on_key = true,
    dim = false,
    max_lines = 2,
}
