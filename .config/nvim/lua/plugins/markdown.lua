return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local obsidian = require("obsidian")
      obsidian.setup({
        workspaces = {
          {
            name = "mind-palace",
            path = "~/mind-palace",
            overrides = {
              templates = {
                folder = "templates",
                substitutions = {
                  ["date:YYYYMMDD"] = function()
                    return os.date("%Y%m%d")
                  end,
                  ["time:HHmm"] = function()
                    return os.date("%H%M")
                  end,
                },
              },
              disable_frontmatter = true,
            }
          },
          -- {
          --   name = "hjkl-vault",
          --   path = "~/work-station/bench/hjkl/vault",
          --   overrides = {
          --     templates = {
          --       folder = "templates",
          --       substitutions = {
          --         ["date:YYYYMMDD"] = function()
          --           return os.date("%Y%m%d")
          --         end,
          --         ["time:HHmm"] = function()
          --           return os.date("%H%M")
          --         end,
          --       },
          --     },
          --     disable_frontmatter = true,
          --   }
          -- },
          {
            name = "no-vault",
            path = function()
              return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
            end,
            overrides = {
              notes_subdir = vim.NIL,
              new_notes_location = "current_dir",
              templates = {
                folder = vim.NIL,
                substitutions = {
                  date = function()
                    return os.date("%Y%m%d")
                  end,
                  time = function()
                    return os.date("%H%M")
                  end,
                },
              },
              disable_frontmatter = true,
            },
          },
        },
        follow_url_func = function(url)
          vim.fn.jobstart({ "open", url })
        end,
        follow_img_func = function(img)
          vim.fn.jobstart { "qlmanage", "-p", img }
        end,
      })

      vim.opt.conceallevel = 2

      vim.keymap.set("n", "gf", function()
        if obsidian.util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true, desc = 'Follow link or go to file' })

      vim.keymap.set('n', '<leader>ot', '<CMD>ObsidianTemplate<CR>', { desc = '[O]bsidian [T]emplates' })
    end
  }
}
