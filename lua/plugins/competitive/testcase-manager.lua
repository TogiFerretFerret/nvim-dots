return {
	'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	cmd = { "CompetiTest" },
	ft = { "cpp", "python" },
	config = function() require('competitest').setup {
		compile_command = {
			cpp = { exec = "g++", args = {"-std=c++17","-O2","-DLOCAL_JUDGE","-lm","$(FNAME)","-o","compiled/$(FNOEXT)"}}
		},
		run_command = {
			cpp = { exec = "./compiled/$(FNOEXT)" },
			python = { exec = "python3", args = {"$(FNAME)"} }
		},
		maximum_time=2000,
		testcases_directory="./testcases",
		testcases_input_file_format = "$(FNOEXT)_$(TCNUM).in",
		testcases_output_file_format = "$(FNOEXT)_$(TCNUM).out",
		template_file = "~/USACO/template/USACO.cpp",
		evaluate_template_modifiers = true
	} end,
}
