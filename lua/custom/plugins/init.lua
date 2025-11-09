local plugin_modules = {
	'custom.plugins.colorscheme',
	'custom.plugins.formatter',
	'custom.plugins.hardtime',
	'custom.plugins.lsp',
	'custom.plugins.opencode',
	'custom.plugins.precognition',
	'custom.plugins.qol',
	'custom.plugins.telescope',
}

local plugins = {}

for _, module in ipairs(plugin_modules) do
	local ok, mod = pcall(require, module)
	if ok and mod then
		if type(mod) == 'table' and vim.islist(mod) then
			vim.list_extend(plugins, mod)
		else
			table.insert(plugins, mod)
		end
	else
		vim.notify(string.format('Failed loading %s: %s', module, mod), vim.log.levels.ERROR)
	end
end

return plugins
