local js_based_languages = {
	"typescript",
	"javascript",
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
					-- Path of node executable. Defaults to $NODE_PATH, and then "node"
					-- node_path = "node",

					-- Path to vscode-js-debug installation.
					debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

				
					adapters = {
						"chrome",
						"pwa-node",
						"pwa-chrome",
						"pwa-msedge",
						"pwa-extensionHost",
						"node-terminal",
						"node2"
					},

				})
			end,
		},
		{
			"Joakker/lua-json5",
			build = "./install.sh",
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
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 0.30,
					position = "bottom",
				},
			},
		})

		local dap = require("dap")
		local dapui= require("dapui")

		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
		}

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




		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					name = "----- ↓ Launch Json ↓ -----",
					type = "",
					request = "launch",
				},
				{
					name = 'Attach to process Node2',
					type = 'node2',
					request = 'attach',
					processId = require'dap.utils'.pick_process,
				},

			}
		end
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
						["node-terminal"] = js_based_languages,
						["node"] = js_based_languages,

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
