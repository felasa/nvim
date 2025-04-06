--if true then return {}
local lisp_dialects = { "clojure", "scheme", "lisp", "racket", "hy",
    "fennel", "janet", "carp", "wast", "yuck" }
return {
    -- dont really need a whole plugin for this
    --{
    --    "TreyBastian/nvim-jack-in",
    --    opts = {
    --        location = "tab",
    --        clj_dependencies = {
    --            { name = "nrepl/nrepl", version = "RELEASE"},
    --            { name = "cider/cider-nrepl", version = "RELEASE"},
    --            { name = "refactor-nrepl/refactor-nrepl", version = "RELEASE"},
    --            { name = "criterium/criterium", version = "RELEASE"},
    --        },
    --        clj_middleware = {
    --            "cider.nrepl/cider-middleware",
    --            "refactor-nrepl.middleware/wrap-refactor"
    --        },
    --    },
    --},
    {
        "dundalek/parpar.nvim",
        dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
        filetypes = lisp_dialects,
        opts = {}
    },
    -- Is this redundant with parpar? why does practicalli have both
    --{"PaterJason/nvim-treesitter-sexp"},
    {
        "Olical/conjure",
        -- load plugin on filetypes
        filetypes = { "clojure", "fennel", },
        ft = { "clojure", "fennel" },
        lazy = true,
        init = function()
            -- Disable diagnostics in log
            vim.g["conjure#log#disable_diagnostics"] = true
            -- Width of HUD as percentage of the editor width between 0.0 and 1.0. Default: `0.42`
            vim.g["conjure#log#hud#width"] = 0.42
            --from 1
            -- Display HUD (REPL log). Default: `true`
            vim.g["conjure#log#hud#enabled"] = true
            -- HUD corner position (over-ridden by HUD cursor detection). Default: `"NE"`
            -- Example: Set to `"SE"` and HUD width to `1.0` for full width HUD at bottom of screen
            vim.g["conjure#log#hud#anchor"] = "NE" --from SE
            -- Open log at bottom or far right of editor, using full width or height. Default: `false`
            vim.g["conjure#log#botright"] = true
            -- Lines from top of file to check for `ns` form, to sett evaluation context Default: `24`
            -- `b:conjure#context` to override a specific buffer that isn't finding the context
            vim.g["conjure#extract#context_header_lines"] = 100
            vim.g["conjure#eval#comment_prefix"] = ";; "
            -- Start "auto-repl" process when nREPL connection not found, e.g. babashka. ;; Default: `true`
            vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
            -- Hide auto-repl buffer when triggered. Default: `false`
            vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
            -- Command to start the auto-repl. Default: `"bb nrepl-server localhost:8794"`
            vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
            -- Ensure namespace required after REPL connection. Default: `true`
            vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
            -- suppress `; (out)` prefix in log evaluation results
            vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
            -- test runner "clojure" (clojure.test) "clojurescript" (cljs.test) "kaocha"
            vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
            -- ft, filetype, filetypes not picking up this might have done the trick
            vim.g["conjure#filetypes"] = { "clojure", "fennel" }
        end,
    }
}
