local function get_config_path()
    local target = os.getenv('SQLS_TARGET') or 'postgres'
    return vim.fn.expand('~/.config/sqls/config.' .. target .. '.yaml')
end

---@type vim.lsp.Config
return {
    cmd = { 'sqls', '--config', get_config_path() },
    filetypes = { 'sql', 'mysql', 'plsql' },
}
