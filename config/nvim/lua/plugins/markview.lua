-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('markview').setup({
            experimental = {
                check_rtp = false
            }
        })
    end

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
