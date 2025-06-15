return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,
                    },
                },
            },
        }
    end,
}
