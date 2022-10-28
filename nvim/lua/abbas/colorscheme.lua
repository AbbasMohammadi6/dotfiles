local colorscheme = "darkplus"

-- we are checking if setting the colorscheme causes an error (because it is not installed)
-- if there is an error, just notify the user, so they won't get a nasty error.
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- that underscore is the return value for the module, we don't care about it here.
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
