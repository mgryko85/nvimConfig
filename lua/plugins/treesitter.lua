return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- nvim-treesitter nie wspiera lazy-loading
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- katalog instalacji parserów (zgodnie z nowym README)
      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- odpowiednik starego ensure_installed
      ts.install({
        "lua",
        "go",
        "javascript",
        "kotlin",
      })

      -- FileType pattern tylko dla Twoich języków
      local patterns = { "lua", "go", "javascript", "kotlin" }

      -- Tree-sitter highlight (odpowiednik highlight = { enable = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = patterns,
        desc = "Enable Tree-sitter highlighting",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Tree-sitter indent (odpowiednik indent = { enable = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = patterns,
        desc = "Enable Tree-sitter indentation",
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
