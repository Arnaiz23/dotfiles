local status, alpha = pcall(require, "alpha")
if not status then
  return
end

local status_theme, alpha_theme = pcall(require, "alpha.themes.dashboard")
if not status_theme then
  return
end

alpha_theme.section.header.val = {
  [[      █████████                                   ███            ]],
  [[   ███░░░░░███                                 ░░░               ]],
  [[  ░███    ░███  ████████  ████████    ██████   ████   █████████  ]],
  [[  ░███████████ ░░███░░███░░███░░███  ░░░░░███ ░░███  ░█░░░░███   ]],
  [[  ░███░░░░░███  ░███ ░░░  ░███ ░███   ███████  ░███  ░   ███░    ]],
  [[  ░███    ░███  ░███      ░███ ░███  ███░░███  ░███    ███░   █  ]],
  [[  █████   █████ █████     ████ █████░░████████ █████  █████████  ]],
  [[ ░░░░░   ░░░░░ ░░░░░     ░░░░ ░░░░░  ░░░░░░░░ ░░░░░  ░░░░░░░░░   ]]
}

alpha_theme.section.buttons.val = {
  alpha_theme.button('i', '    New file', ':ene <BAR> startinsert<CR>'),
  alpha_theme.button('ff', '󰥨    Find file', ':Telescope find_files hidden=true<CR>'),
  alpha_theme.button('fw', '    Find words', ':Telescope live_grep<CR>'),
  alpha_theme.button('e', '    Oil', ':Oil --float<CR>'),
  alpha_theme.button('g', '    Lazygit', ':LazyGit<CR>'),
  alpha_theme.button('l', '    Lazy', ':Lazy<CR>'),
  alpha_theme.button('q', '    Quit neovim', ':qa<CR>'),
}

alpha.setup(
  alpha_theme.config
)
