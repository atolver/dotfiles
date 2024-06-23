return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      -- stylua: ignore
      config = function()
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.load_launchjs()
      end,
    },
  },
}
