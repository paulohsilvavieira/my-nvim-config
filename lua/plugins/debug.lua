local js_based_languages = {
	"typescript",
	"javascript",
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "suketa/nvim-dap-ruby" },
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "nvim-neotest/nvim-nio" },
		{ "rcarriga/nvim-dap-ui" },
		{
			"microsoft/vscode-js-debug",
			build = "npm i --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			config = function()
				require("dap-vscode-js").setup({
					node_path = "node",
					debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
					adapters = {
						"node",
						"pwa-node",
						-- "node2",
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
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			clear_on_continue = false,

			display_callback = function(variable, buf, stackframe, node, options)
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value
				else
					return variable.name .. " = " .. variable.value
				end
			end,
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})
		require("dapui").setup({
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
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
		local dapui = require("dapui")

		require("dap-ruby").setup()

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
		dap.adapters.ruby = {
			type = "server",
			port = "9229",
			command = vim.fn.expand("$HOME/.rbenv/versions/3.2.0/bin/rdbg"),
			args = { "--open", "--port", "9229", "--" },
			-- useBundler = true;
		}

		dap.adapters.ruby = function(callback, config)
			callback({
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = "bundle",
					args = {
						"exec",
						"rdbg",
						"-n",
						"--open",
						"--port",
						"${port}",
						"-c",
						"--",
						"bundle",
						"exec",
						config.command,
						config.script,
					},
				},
			})
		end
		--
		dap.configurations.ruby = {
			{
				type = "ruby",
				request = "launch",
				name = "ruby debug: start rails",
				command = "bin/rails s",
				useBundler = true,
			},
			{
				type = "ruby",
				name = "debug current file",
				request = "attach",
				localfs = true,
				command = "ruby",
				script = "${file}",
			},
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				-- {
				--     name = 'Attach to Process',
				--     type = 'node2',
				--     request = 'attach',
				--     processId = require 'dap.utils'.pick_process,
				-- },
				{
					type = "pwa-node",
					request = "attach",
					name = "Auto Attach",
					cwd = vim.fn.getcwd(),
					protocol = "inspector",
				},
				{
					name = "----- ↓ launch.json configs ↓ -----",
					type = "",
					request = "launch",
				},
			}
		end
	end,

	keys = {
		{
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<F5>",
			function()
				if vim.fn.filereadable(".vscode/launch.json") then
					local dap_vscode = require("dap.ext.vscode")
					dap_vscode.json_decode = require("json5").parse

					dap_vscode.load_launchjs(nil, {
						["node"] = js_based_languages,
						["pwa-node"] = js_based_languages,
					})
				end

				require("dap").continue()
			end,
		},
		{
			"<S-F5>",
			function()
				require("dap").terminate()
			end,
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F11>",
			function()
				require("dap").step_in()
			end,
		},
		{
			"<S-F11>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<C-S-F5>",
			function()
				require("dap").run_last()
			end,
		},
	},
}
