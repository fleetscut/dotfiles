local M = {}

local keys = require 'fleetscut.keymaps'
local jdtls = require 'jdtls'

function M.start_jdt()
    local root_markers = {'gradlew', '.git', 'mvnw'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local config = {}
    config.settings = {
    java = {
      signatureHelp = { enabled = true };
      contentProvider = { preferred = 'fernflower' };
      completion = {
      };
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        };
      };
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      };
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk-amd64/",
          },
        }
      };
    };
  }
    config.cmd = {'java-lsp.sh', workspace_folder}
    config.on_attach = keys.on_attach
    jdtls.start_or_attach(config)
end

return M
