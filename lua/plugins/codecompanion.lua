return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opt = {
    language = "Chinese",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        siliconflow_r1 = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "siliconflow_r1",
            url = "https://api.siliconflow.cn/v1/chat/completions",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_KEY_S")
              end,
            },
            schema = {
              model = {
                default = "deepseek-ai/DeepSeek-R1",
                choices = {
                  ["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                  "deepseek-ai/DeepSeek-V3",
                },
              },
            },
          })
        end,

        aliyun_deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "aliyun_deepseek",
            url = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_ALIYUN")
              end,
            },
            schema = {
              model = {
                default = "deepseek-r1",
                choices = {
                  ["deepseek-r1"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,
      },
      schema = {
        model = {
          default = "deepseek-r1"
        }
      },
      strategies = {
        chat = { adapter = "siliconflow_r1", },
        inline = { adapter = "siliconflow_r1" },
      },
    })
  end
}
