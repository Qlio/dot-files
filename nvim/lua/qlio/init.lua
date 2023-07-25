require("qlio.set")
require("qlio.remap")
require("qlio.lualine")
require("qlio.lsp")

vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_instal_global = 0

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    desc = "Remove trailing spaces",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.tf",
    desc = "Custom terraform folding",
    callback = function()
        vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local" })
        vim.api.nvim_set_option_value("foldtext", "v:lua.TerraformFoldText()", { scope = "local" })
        vim.api.nvim_set_option_value("foldexpr", "getline(v:lnum+1)=~'^\\l'?'<1':1", { scope = "local" })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.ts",
    desc = "Custom typescript folding",
    callback = function()
        vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local" })
        vim.api.nvim_set_option_value("foldtext", "v:lua.TypeScriptFoldText()", { scope = "local" })
        vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", { scope = "local" })
    end,
})

function TerraformFoldText()
    local words = {}
    for substring in vim.fn.getline(vim.v.foldstart):gmatch("[a-z_\"-]+") do
        table.insert(words, substring)
    end
    return table.concat(words, ' ')
end

function TypeScriptFoldText()
    local line = vim.fn.getline(vim.v.foldstart)
    print(line:sub(-1))

    if line:sub(-9) == "= () => {" or line:sub(-9) == "= () => (" then
        return line:sub(0, -10)
    end
    if line:sub(-10) == "= () => ({" then
        return line:sub(0, -11)
    end
    if line:sub(-3) == "= {" or line:sub(-3) == "= (" then
        return line:sub(0, -4)
    end
    if line:sub(-1) == "(" or line:sub(-1) == "{" then
        return line:sub(0, -2)
    end
    return line
end
