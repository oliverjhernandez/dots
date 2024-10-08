local k = vim.keymap
local opts = { noremap = true, silent = true }

k.set("n", "x", '"_x')

-- Increment/decrement
k.set("n", "+", "<C-a>")
k.set("n", "-", "<C-x>")

-- Delete a word backwards
k.set("n", "dw", 'vb"_d')

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
k.set("n", "<Leader>o", "o<Esc>^Da", opts)
k.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
k.set("n", "<C-m>", "<C-i>", opts)

-- New tab
k.set("n", "te", ":tabedit")
k.set("n", "<tab>", ":tabnext<Return>", opts)
k.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
k.set("n", "ss", ":split<Return>", opts)
k.set("n", "sv", ":vsplit<Return>", opts)

k.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
k.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>")
k.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>")
k.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>")
k.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>")
k.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>")

-- Toggle Terminal
k.set("n", "<C-\\>", ":ToggleTerm size=40 direction=float<cr>")
-- keymap.set("n", "<leader>tv", ":ToggleTerm size=100 direction=vertical<cr>")
-- keymap.set("n", "<leader>th", ":ToggleTerm size=100 direction=horizontal<cr>")
k.set("t", "<C-\\>", "<C-\\><C-n><C-w>l")

-- Diagnostics
k.set("n", "<leader>j", function()
  vim.diagnostic.goto_next()
end, opts)

k.set("n", "<leader>k", function()
  vim.diagnostic.goto_prev()
end)

-- Neogen
k.set("n", "<leader>cc", function()
  require("neogen").generate({})
end)

-- Inc Rename
k.set("n", "<leader>rn", ":IncRename ")

-- Kulala
k.set("n", "<leader>tr", function() -- Run test
  require("kulala").run()
end)
k.set("n", "<leader>ta", function()
  require("kulala")
end)
k.set("n", "<leader>tt", function() -- Replay last test
  require("kulala").replay()
end)
k.set("n", "<leader>tc", function() -- Copy test as curl command
  require("kulala").run()
end)
k.set("n", "<leader>tj", function() -- Go to next test
  require("kulala").jump_next()
end)
k.set("n", "<leader>tk", function() -- Go to previous test
  require("kulala").jump_prev()
end)

-- dial
k.set("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
k.set("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

-- telescope
local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- General search in the whole repo
k.set("n", "ff", function()
  builtin.find_files()
end)

-- "Searches for the string under your cursor or selection in your current working directory"
k.set("n", "fS", function()
  builtin.grep_string()
end)

-- "Lists available colorschemes and applies them on <cr>"
k.set("n", ";c", function()
  builtin.colorscheme()
end)

-- "Lists normal mode keymappings"
k.set("n", ";k", function()
  builtin.keymaps()
end)

-- "Lists open buffers",
k.set("n", "\\\\", function()
  builtin.buffers()
end)

-- "Resume the previous telescope picker",
k.set("n", ";;", function()
  builtin.resume()
end)

-- "Lists Diagnostics for all open buffers or a specific buffer",
k.set("n", "fd", function()
  builtin.diagnostics()
end)

-- "Lists Function names, variables, from Treesitter",
k.set("n", "fs", function()
  builtin.treesitter()
end)

-- "Lists all lsp symbols"
k.set("n", "ss", function()
  builtin.lsp_document_symbols()
end)

-- "Lists harpoon files"
k.set("n", "hl", "<cmd>Telescope harpoon marks<cr>")

-- "JsonFly"
k.set("n", "fj", "<cmd>Telescope jsonfly<cr>")

-- "Open File Browser with the path of the current buffer",
k.set("n", "-", function()
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end

  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
    layout_config = { height = 40, width = 160 },
  })
end)

-- Harpoon
local mark = require("harpoon.mark")
local term = require("harpoon.term")

-- Mark a file
k.set("n", "<leader>ha", function()
  mark.add_file()
end)

-- Mark a terminal
k.set("n", "<leader>h1", function()
  term.gotoTerminal(1)
end)

k.set("n", "<leader>h2", function()
  term.gotoTerminal(1)
end)

-- Multicursor
local mc = require("multicursor-nvim")

mc.setup()
-- Add cursors above/below the main cursor.
k.set({ "n", "v" }, "<up>", function()
  mc.addCursor("k")
end)
k.set({ "n", "v" }, "<down>", function()
  mc.addCursor("j")
end)
-- Add a cursor and jump to the next word under cursor.
k.set({ "n", "v" }, "<c-n>", function()
  mc.addCursor("*")
end)
-- Jump to the next word under cursor but do not add a cursor.
k.set({ "n", "v" }, "<c-s>", function()
  mc.skipCursor("*")
end)
-- Rotate the main cursor.
k.set({ "n", "v" }, "<left>", mc.nextCursor)
k.set({ "n", "v" }, "<right>", mc.prevCursor)

-- Delete the main cursor.
k.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

-- Add and remove cursors with control + left click.
k.set("n", "<c-leftmouse>", mc.handleMouse)

k.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

k.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Align cursor columns.
k.set("n", "<leader>a", mc.alignCursors)

-- Split visual selections by regex.
k.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
k.set("v", "I", mc.insertVisual)
k.set("v", "A", mc.appendVisual)

-- match new cursors within visual selections by regex.
k.set("v", "M", mc.matchCursors)

-- Rotate visual selection contents.
k.set("v", "<leader>t", function()
  mc.transposeCursors(1)
end)
k.set("v", "<leader>T", function()
  mc.transposeCursors(-1)
end)
