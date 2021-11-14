local M = {}

M.setup_lsp = function(attach, capabilities)

    local lspconfig = require "lspconfig"

    -- lspservers with default config

    lspconfig.pyright.setup {
        on_attach = attach,
        capabilities = capabilities,
    }
end

return M
