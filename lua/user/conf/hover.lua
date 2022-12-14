local status_hover_ok, hover = pcall(require, "hover")
if not status_hover_ok then
    vim.notify("hover not found!")
    return
end

hover.setup{
    init = function()
        -- Require providers
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.jira')
        -- require('hover.providers.man')
        require('hover.providers.dictionary')
    end,
    preview_opts = {
        border = nil
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true
}
