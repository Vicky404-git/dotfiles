-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if false then return {} end

return {
  -- 🌲 File explorer (left)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left",
        width = 30,
      },
    },
  },

  -- 🔥 Terminal (bottom)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
    },
  },
}
