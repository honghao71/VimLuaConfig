local M = {}
M.mapf_o = function ()
    local line = vim.fn.getline(".")
    local indent, number , text= string.match(line,"^(%s*)(%d)(%..*)$")
    if vim.o.filetype == "markdown" and number then
        local next_number = number+1
        local insert = indent .. next_number .. ". "
        local line_number = vim.fn.line(".")
        vim.cmd('startinsert')
        vim.fn.append(line_number,insert)
        vim.fn.cursor(line_number+1,vim.fn.col("$"))
        return
    end
    return 'o'
end
package.loaded.test = nil
local function tt()
    require('test').mapf_o()
end
-- vim.keymap.set("n","<leader>te",tt,{expr = true})
-- vim.api.nvim_set_keymap("n","<leader>u",":lua package.loaded.test =  nil<cr>")

return M

