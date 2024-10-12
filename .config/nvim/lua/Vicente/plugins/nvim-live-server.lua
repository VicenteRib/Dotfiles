return{
    'barrett-ruth/live-server.nvim',
    config = function()
        require('live-server').setup({
            port = 5500,
            host = ""
        })
    end,
}
