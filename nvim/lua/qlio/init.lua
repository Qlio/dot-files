require("qlio.set")
require("qlio.remap")
require("qlio.lualine")
require("qlio.lsp")

vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_instal_global = 0

function TerraformFoldText()
    local words = {}
    for substring in vim.fn.getline(vim.v.foldstart):gmatch("[a-z_\"]+") do
        table.insert(words, substring)
    end
    return words[1] .. ' ' .. words[2] .. ' ' .. words[3]
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.tf"},
    callback = function()
        local filetype = vim.bo.filetype
        if filetype == "terraform" then
            vim.wo.foldmethod = "expr"
            vim.wo.foldtext = "v:lua.TerraformFoldText()"
            vim.wo.foldexpr = "getline(v:lnum+1)=~'^\\l'?'<1':1"
        end
    end,
})
