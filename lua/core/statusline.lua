local fn = vim.fn
local api = vim.api

local M = {}

-- possible values are 'arrow' | 'rounded' | 'blank'
local active_sep = "blank"

M.separators = {
	arrow = { "", "" },
	rounded = { "", "" },
	blank = { "", "" },
}

-- only using default highlight groups now
M.colors = {
	active = "%#StatusLine#",
	inactive = "%#StatusLineNC#",
}

M.trunc_width = setmetatable({
	mode = 80,
	git_status = 90,
	filename = 140,
	line_col = 60,
}, {
	__index = function()
		return 80
	end,
})

M.is_truncated = function(_, width)
	local current_width = api.nvim_win_get_width(0)
	return current_width < width
end

M.modes = setmetatable({
	["n"] = { "Normal", "N" },
	["no"] = { "N·Pending", "N·P" },
	["v"] = { "Visual", "V" },
	["V"] = { "V·Line", "V·L" },
	[""] = { "V·Block", "V·B" },
	["s"] = { "Select", "S" },
	["S"] = { "S·Line", "S·L" },
	[""] = { "S·Block", "S·B" },
	["i"] = { "Insert", "I" },
	["ic"] = { "Insert", "I" },
	["R"] = { "Replace", "R" },
	["Rv"] = { "V·Replace", "V·R" },
	["c"] = { "Command", "C" },
	["cv"] = { "Vim·Ex", "V·E" },
	["ce"] = { "Ex", "E" },
	["r"] = { "Prompt", "P" },
	["rm"] = { "More", "M" },
	["r?"] = { "Confirm", "C" },
	["!"] = { "Shell", "S" },
	["t"] = { "Terminal", "T" },
}, {
	__index = function()
		return { "Unknown", "U" }
	end,
})

M.get_current_mode = function(self)
	local current_mode = api.nvim_get_mode().mode
	if self:is_truncated(self.trunc_width.mode) then
		return string.format(" %s ", self.modes[current_mode][2]):upper()
	end
	return string.format(" %s ", self.modes[current_mode][1]):upper()
end

M.get_git_status = function(self)
	local signs = vim.b.gitsigns_status_dict or {}
	local head = signs.head or ""
	local added = signs.added or 0
	local changed = signs.changed or 0
	local removed = signs.removed or 0
	local is_head_empty = head ~= ""

	if self:is_truncated(self.trunc_width.git_status) then
		return is_head_empty and string.format("  %s ", head) or ""
	end

	return is_head_empty and string.format(" +%s ~%s -%s |  %s ", added, changed, removed, head) or ""
end

M.get_filename = function(self)
	if self:is_truncated(self.trunc_width.filename) then
		return " %<%f "
	end
	return " %<%F "
end

M.get_filetype = function()
	local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
	local icon = require("nvim-web-devicons").get_icon(file_name, file_ext, { default = true })
	local filetype = vim.bo.filetype
	if filetype == "" then
		return ""
	end
	return string.format(" %s %s ", icon, filetype):lower()
end

M.get_line_col = function(self)
	if self:is_truncated(self.trunc_width.line_col) then
		return " %l:%c "
	end
	return " Ln %l, Col %c "
end

M.set_active = function(self)
	local c = self.colors

	local mode = c.active .. self:get_current_mode()
	local git = c.active .. self:get_git_status()
	local filename = c.active .. self:get_filename()
	local filetype = c.active .. self:get_filetype()
	local line_col = c.active .. self:get_line_col()

	return table.concat({
		c.active,
		mode,
		git,
		"%=",
		filename,
		"%=",
		filetype,
		line_col,
	})
end

M.set_inactive = function(self)
	return self.colors.inactive .. "%= %F %="
end

M.set_explorer = function(self)
	return self.colors.active .. "   "
end

Statusline = setmetatable(M, {
	__call = function(statusline, mode)
		if mode == "active" then
			return statusline:set_active()
		end
		if mode == "inactive" then
			return statusline:set_inactive()
		end
		if mode == "explorer" then
			return statusline:set_explorer()
		end
	end,
})

-- set statusline
api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]],
	false
)

----[[
--  NOTE: I don't use this since the statusline already has
--  so much stuff going on. Feel free to use it!
--  credit: https://github.com/nvim-lua/lsp-status.nvim
--
--  I now use `tabline` to display these errors, go to `_bufferline.lua` if you
--  want to check that out
----]]
-- Statusline.get_lsp_diagnostic = function(self)
--   local result = {}
--   local levels = {
--     errors = 'Error',
--     warnings = 'Warning',
--     info = 'Information',
--     hints = 'Hint'
--   }

--   for k, level in pairs(levels) do
--     result[k] = vim.lsp.diagnostic.get_count(0, level)
--   end

--   if self:is_truncated(120) then
--     return ''
--   else
--     return string.format(
--       "| :%s :%s :%s :%s ",
--       result['errors'] or 0, result['warnings'] or 0,
--       result['info'] or 0, result['hints'] or 0
--     )
--   end
-- end
