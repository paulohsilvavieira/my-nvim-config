local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
} 
return {
	
	"mfussenegger/nvim-dap",
	dependencies = { 
		{"rcarriga/nvim-dap-ui"},
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
			version = "1.*",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			config = function()
				---@diagnostic disable-next-line: missing-fields
				require("dap-vscode-js").setup({
					
					debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/src/vsDebugServer.js"),
			
				
					adapters = {
						"chrome",
						"pwa-node",
						"pwa-chrome",
						"pwa-msedge",
						"pwa-extensionHost",
						"node-terminal",
						"node"
					},
				})
			end,
		},
	},
	
	config = function()
		require("dapui").setup({
			controls = {
				enabled = true,
				element = "repl",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.30,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 1 },
					},
					size = 0.30,
					position = "bottom",
				},
			},
		})

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end



		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "node2",
					request = "attach",
					name = "Attach debugger to existing `node --inspect` process",
					processId = require 'dap.utils'.pick_process,
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**" },
					cwd = "${workspaceFolder}/src",
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},

				{
					name = "----- ↓ launch.json configs ↓ -----",
					type = "",
					request = "launch",
				},
			}
		end

		vim.keymap.set("n", "<leader>do", ":lua require('dapui').open()<CR>", {silent = true})
		vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>", {silent = true})

	end,
	
	keys = {
		{
			"<F9>",
			function()
				require('dap').toggle_breakpoint()
			end
		},
		{
			"<F5>",
			function()
				if vim.fn.filereadable(".vscode/launch.json") then
					local dap_vscode = require("dap.ext.vscode")
					dap_vscode.load_launchjs(nil, {
						["pwa-node"] = js_based_languages,
						["chrome"] = js_based_languages,
						["node2"] = js_based_languages,
						["pwa-chrome"] = js_based_languages,
					})
				end
				require("dap").continue()
			end,
			desc = "Run with Args",
		},
		{
			"<S-F5>",
			function()
				require('dap').terminate()
			end
		},
		{
			"<F10>",
			function()

				require('dap').step_over()
			end
		},
		{
			"<F11>",
			function()

				require('dap').step_in()
			end
		},
		{
			"<S-F11>",
			function()
				require('dap').step_out()
			end
		},
		{
			"<C-S-F5>",
			function()	
				require('dap').run_last()
			end
		}
	},
			

}
