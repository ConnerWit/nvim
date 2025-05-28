local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local dashboard_header_1 = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠀⠀⠀⢠⣾⣧⣤⡖⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠋⠀⠉⠀⢄⣸⣿⣿⣿⣿⣿⣥⡤⢶⣿⣦⣀⡀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡆⠀⠀⠀⣙⣛⣿⣿⣿⣿⡏⠀⠀⣀⣿⣿⣿⡟",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠷⣦⣤⣤⣬⣽⣿⣿⣿⣿⣿⣿⣿⣟⠛⠿⠋⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡆⠀⠀",
  "⠀⠀⠀⠀⣠⣶⣶⣶⣿⣦⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠈⢹⡏⠁⠀⠀",
  "⠀⠀⠀⢀⣿⡏⠉⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⡇⠀⠀⠀",
  "⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡘⣿⣿⣃⠀⠀⠀",
  "⣴⣷⣀⣸⣿⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠹⣿⣯⣤⣾⠏⠉⠉⠉⠙⠢⠀",
  "⠈⠙⢿⣿⡟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣄⠛⠉⢩⣷⣴⡆⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣀⡠⠋⠈⢿⣇⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

local dashboard_header_2 = {
  "                    .                    ",
  "    ##############..... ##############   ",
  "    ##############......##############   ",
  "      ##########..........##########     ",
  "      ##########........##########       ",
  "      ##########.......##########        ",
  "      ##########.....##########..        ",
  "      ##########....##########.....      ",
  "    ..##########..##########.........    ",
  "  ....##########.#########.............  ",
  "    ..################JJJ............    ",
  "      ################.............      ",
  "      ##############.JJJ.JJJJJJJJJJ      ",
  "      ############...JJ...JJ..JJ  JJ     ",
  "      ##########....JJ...JJ..JJ  JJ      ",
  "      ########......JJJ..JJJ JJJ JJJ     ",
  "      ######    .........                ",
  "                  .....                  ",
  "                    .                    ",
}

dashboard.section.header.val = dashboard_header_2

dashboard.section.buttons.val = {
--  dashboard.button("n", " New File", ":ene<CR>"),
--  dashboard.button("f", "󰮗 Fuzzy Find", ":Telescope find_files<CR>"),
--  dashboard.button("t", " Live Grep", ":Telescope live_grep<CR>"),
--  dashboard.button("r", " Recent Files", ":Telescope oldfiles<CR>"),
--  dashboard.button("o", " File Tree", ":Oil<CR>"),
--  dashboard.button("g", " Open LazyGit", ":LazyGit<CR>"),
--  dashboard.button("q", "󰗼 Quit NeoVim", ":q<CR>"),

  dashboard.button("n", "[1] new file", ":ene<CR>"),
  dashboard.button("f", "[2] fuzzy find", ":Telescope find_files<CR>"),
  dashboard.button("g", "[3] grep text", ":Telescope live_grep<CR>"),
  dashboard.button("r", "[4] recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("b", "[5] find buffers", "Telescope buffers<CR>"),
  dashboard.button("t", "[6] file tree", ":Oil<CR>"),
  dashboard.button("G", "[7] lazygit", ":LazyGit<CR>"),
  dashboard.button("L", "[8] lazy dashboard", ":Lazy<CR>"),
  dashboard.button("T", "[9] terminal", ":ToggleTerm direction=float<CR>"),
  dashboard.button("q", "[10] quit", ":q<CR>"),
}

local function get_plugin_count()
  local lazy = require("lazy")
  local stats = lazy.stats()
  return string.format("󰏖 %d/%d plugins loaded", stats.loaded, stats.count)
end

dashboard.section.footer.val = get_plugin_count()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"


dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

