--if true then return {} end
return {
    "folke/snacks.nvim",
    priority = 2000,
    lazy = false,
    opts = {
        picker = {
            layout = {
                preset = "ivy",
                layout = { position = "bottom" }
            }
        },
        indent = {},
    },
    keys = {
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        --{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>fG", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },

    },
}
