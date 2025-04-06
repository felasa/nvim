return {
   {
     'nvim-treesitter/nvim-treesitter',
     config = function()
	   local ts = require('nvim-treesitter.configs')
	   ts.setup {
		   ensure_installed = {'c', 'lua', 'r', 'clojure', 'python', 'scala'},
		   sync_install = true,
		   auto_install = true,
		   highlight = {
			   enable = true,
			   additional_vim_regex_highlighting = false,
		   }
	   }
   end
   }
}

