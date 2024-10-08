local jdtls_status, jdtls = pcall(require, "jdtls")
if not jdtls_status then
	return
end

local lsphandlers_status, lsphandlers = pcall(require, "fleetscut.lsp.handlers")
if not lsphandlers_status then
	return
end

local home = os.getenv("HOME")
local jdtls_dir = home .. "/.local/share/nvim/lsp/jdtls/"

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local on_attach = lsphandlers.on_attach
local capabilities = lsphandlers.capabilities

JAVA_DAP_ACTIVE = true

local bundles = {}

if JAVA_DAP_ACTIVE then
	vim.list_extend(bundles, vim.split(vim.fn.glob(jdtls_dir .. "/vscode-java-test/server/*.jar"), "\n"))
	vim.list_extend(
		bundles,
		vim.split(
			vim.fn.glob(
				jdtls_dir .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
			),
			"\n"
		)
	)
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"/usr/lib/jvm/java-17-openjdk-amd64/bin/java", -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		--"-javaagent:" .. home .. "/.local/share/nvim/lsp_servers/jdtls/lombok.jar", -- for adding lombok
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		vim.fn.glob(jdtls_dir .. "eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"),
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                                  ^^^^^^^^^^^^^^
		-- Must point to the                                                                Change this to
		-- eclipse.jdt.ls installation                                                      the actual version

		-- 💀
		"-configuration",
		vim.fn.glob(jdtls_dir .. "/eclipse.jdt.ls/config_linux"),
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                    ^^^^^^
		-- Must point to the                                  Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation                        Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		vim.fn.glob(home .. "/workspace/"),
	},

	on_attach = on_attach,
	capabilities = capabilities,

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			signatureHelp = { enabled = true },
			eclipse = { downloadSources = true },
			configuration = { updateBuildConfiguration = "interactive" },
			maven = { downloadSources = true },
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
			format = { enabled = false },
			configuration = {
				runtimes = {
					--{
					--    name = "JavaSE-1.8",
					--    path = "/usr/lib/jvm/java-8-openjdk",
					--},
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk-amd64/",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk-amd64/",
					},
				},
			},
		},
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},
	handlers = {
		["language/status"] = function(_, result)
			-- Print or whatever.
		end,
		["$/progress"] = function(_, result, ctx)
			-- disable progress updates.
		end,
	},

	flags = { allow_incremental_sync = true },

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = bundles,
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
)
vim.cmd(
	"command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
)
vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
vim.cmd("command! -buffer JdtJol lua require('jdtls').jol()")
vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
vim.cmd("command! -buffer JdtJshell lua require('jdtls').jshell()")

require("fleetscut.keymaps").java_keymap(bufnr)
