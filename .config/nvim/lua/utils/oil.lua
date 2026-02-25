local M = {}

M.yank_absolute_file_path = function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()

  if not entry then
    vim.notify("No entry under cursor", vim.log.levels.WARN, { title = "File Path" })
    return
  end

  local dir = oil.get_current_dir()
  if not dir then
    vim.notify("Could not determine current directory", vim.log.levels.WARN, { title = "File Path" })
    return
  end

  vim.fn.setreg("+", dir .. entry.name)
  vim.notify("Copied: " .. dir .. entry.name, vim.log.levels.INFO, { title = "File Path" })
end

return M
