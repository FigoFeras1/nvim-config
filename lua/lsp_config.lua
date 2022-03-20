vim.api.nvim_command [[ hi def link LspReferenceText  CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead  CursorLine ]]
-- Change diagnostic symbols in the gutter
local signs = { Error = "", Warn = "⚠", Hint = "", Info = "ⓘ"}
--local signs = { Error = " ", Warn = "⚠ ", Hint = " ", Info = "ⓘ"}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
-- vim.cmd [[
--   highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
--   highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
--   highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#FFFFFF gui=bold
--   highlight DiagnosticLineNrHint guibg=#1E205D guifg=#FFFFFF gui=bold
--
--   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]]

vim.o.updatetime = 750
vim.cmd [[autocmd Cursorhold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {}

--[[local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)]]




local nvim_lsp = require('lspconfig')
local util = require("util")

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
   on_attach = util.on_attach,
   capabilities = util.capabilities,
   update_in_insert = true,
   }
end


