return function(on_attach)
    local lspconfig = require("lspconfig")

    local job = vim.loop.new_async(vim.schedule_wrap(function()
        local lscdir = "/usr/local/opt/elixir-ls/release"
        local stdout = vim.fn.system("elixir -v")
        local otpver = string.match(stdout, "OTP (%d+)")

        lspconfig.elixirls.setup({
            cmd = {lscdir .. "/1.11.2-otp-" .. otpver .. "/language_server.sh"},
            on_attach = on_attach,
            settings = {elixirLS = {fetchDeps = false}}
        })

        local ft = vim.bo.filetype
        if ft == "elixir" or ft == "eelixir" then
            lspconfig.elixirls.manager.try_add()
        end
    end))

    job:send()
end
