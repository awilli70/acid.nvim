-- lua/zellner_acid/theme.lua

local M = {}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "light"
	vim.g.colors_name = "zellner_acid"

	local palette = {
		bg = "#ffffff",
		fg = "#000000",
		cyan = "#00ccff",
		green = "#39ff14",
		yellow = "#ffde00",
		pink = "#ff0080",
		orange = "#ff6f00",
		red = "#ff0033",
		comment = "#999999",
	}

	local function hi(group, style)
		local gui = style.gui and "gui=" .. style.gui or "gui=NONE"
		local guifg = style.fg and "guifg=" .. style.fg or "guifg=NONE"
		local guibg = style.bg and "guibg=" .. style.bg or "guibg=NONE"
		local guisp = style.sp and "guisp=" .. style.sp or ""
		vim.cmd(string.format("highlight %s %s %s %s %s", group, gui, guifg, guibg, guisp))
	end

	hi("Normal", { fg = palette.fg, bg = palette.bg })
	hi("Comment", { fg = palette.red, gui = "italic" })
	hi("Constant", { fg = "Magenta" })
	hi("String", { fg = palette.red })
	hi("Identifier", { fg = "Blue" })
	hi("Statement", { fg = palette.orange })
	hi("PreProc", { fg = "Magenta" })
	hi("Type", { fg = palette.cyan })
	hi("Special", { fg = "Magenta" })
	hi("Underlined", { fg = palette.cyan, gui = "underline" })
	hi("Todo", { fg = palette.bg, bg = palette.yellow, gui = "bold" })
	hi("Error", { fg = palette.red, bg = palette.bg })
	hi("LineNr", { fg = palette.comment, bg = palette.bg })
	hi("CursorLineNr", { fg = palette.pink, bg = palette.bg, gui = "bold" })
	hi("Visual", { bg = palette.yellow, fg = "Magenta" })
	hi("Search", { fg = palette.fg, bg = palette.cyan })

	hi("StatusLine", { fg = palette.fg, bg = palette.green, gui = "bold" })
	hi("StatusLineNC", { fg = palette.bg, bg = palette.cyan })

	hi("DiffAdd", { fg = palette.green })
	hi("DiffChange", { fg = palette.yellow })
	hi("DiffDelete", { fg = palette.red })

	hi("DiagnosticError", { fg = palette.red })
	hi("DiagnosticWarn", { fg = palette.orange })
	hi("DiagnosticInfo", { fg = palette.cyan })
	hi("DiagnosticHint", { fg = palette.green })

	hi("Cursor", { fg = palette.bg, bg = palette.pink })

	hi("WinBar", { fg = palette.fg, bg = palette.bg, gui = "bold" })

	-- Treesitter
	hi("@variable", { fg = palette.fg })
	hi("@constant", { fg = "Magenta" })
	hi("@string", { fg = palette.red })
	hi("@function", { fg = "Blue" })
	hi("@keyword", { fg = "Magenta" })
	hi("@comment", { fg = palette.red, gui = "italic" })
end

return M
