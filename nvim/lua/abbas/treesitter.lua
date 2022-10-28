local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {
    "comment",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing (if you wanted to disable synax highlighting for some languages)
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },

  -- enabling the rainbow, pluging that makes paranthesis and brackets colorful, so we could know which is for which.
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  -- make commentstring plugin enable.
  contenxt_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
}
