require("pomo").setup({
  sessions = {
	usaco = {
		{ name = "USACO", duration = "4h" }
	},
	usaco_soft = {
      { name = "Problem 1", duration = "1h" },
	  { name = "Problem 2", duration = "1h" },
	  { name = "Problem 3", duration = "1h" },
	  { name = "Extra Time", duration = "1h" }
	},
    usaco_strict = {
      { name = "Problem 1 Thinking", duration = "30m" },
      { name = "Problem 1 Implementation", duration = "15m" },
      { name = "Problem 1 Testing", duration = "5m" },
	  { name = "Problem 1 Debugging", duration = "10m" },
	  { name = "Problem 2 Thinking", duration = "30m" },
	  { name = "Problem 2 Implementation", duration = "15m" },
	  { name = "Problem 2 Testing", duration = "5m" },
	  { name = "Problem 2 Debugging", duration = "10m" },
	  { name = "Problem 3 Thinking", duration = "30m" },
	  { name = "Problem 3 Implementation", duration = "15m" },
	  { name = "Problem 3 Testing", duration = "5m" },
	  { name = "Problem 3 Debugging", duration = "10m" }
    },
	default = {
	  { name = "Work", duration = "25m" },
	  { name = "Short Break", duration = "5m" },
	  { name = "Work", duration = "25m" },
	  { name = "Short Break", duration = "5m" },
	  { name = "Work", duration = "25m" },
	  { name = "Short Break", duration = "5m" },
	  { name = "Work", duration = "25m" },
	  { name = "Long Break", duration = "15m" },
  }},
  notifiers = {
	{name="Default", opts={sticky=false}}
  }
})
