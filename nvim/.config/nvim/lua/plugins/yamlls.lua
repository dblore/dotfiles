return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!vault scalar",
              },
            },
          },
        },
      },
    },
  },
}
