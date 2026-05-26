return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "rust_analyzer" },
    },
  },
  {
  "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.inlay_hint.enable(true)

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true,
            },
  
            check = {
              command = "clippy",
            },
  
            inlayHints = {
              typeHints = {
                enable = true,
              },
              parameterHints = {
                enable = true,
              },
              chainingHints = {
                enable = true,
              },
            },
          },
        },
      })
  
      vim.lsp.enable("rust_analyzer")
  
      local inlay_group = vim.api.nvim_create_augroup("nconf_lsp_inlay", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = inlay_group,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })
  
      -- keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
  
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
    end,
  },
}
