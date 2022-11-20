local colors = require('kyotonight')

local kyotonight = {}

kyotonight.normal = {
  a = { bg = colors.blue0[0], fg = colors.black1[0] },
  b = { bg = colors.black1[0], fg = colors.blue0[0] },
  c = { bg = colors.black0[0], fg = colors.cream[0] },
}

kyotonight.insert = {
  a = { bg = colors.green[0], fg = colors.black1[0] },
  b = { bg = colors.black1[0], fg = colors.green[0] },
}

kyotonight.command = {
  a = { bg = colors.yellow[0], fg = colors.black1[0]},
  b = { bg = colors.black1[0], fg = colors.yellow[0] },
}

kyotonight.visual = {
  a = { bg = colors.magenta[0], fg = colors.black1[0] },
  b = { bg = colors.black1[0], fg = colors.magenta[0] },
}

kyotonight.replace = {
  a = { bg = colors.red[0], fg = colors.black1[0]},
  b = { bg = colors.black1[0], fg = colors.red[0] },
}

kyotonight.terminal = {
  a = {bg = colors.teal[0], fg = colors.black1[0]},
  b = {bg = colors.black1[0], fg=colors.teal[0] },
}

kyotonight.inactive = {
  a = { bg = colors.black0[0], fg = colors.blue0[0] },
  b = { bg = colors.black0[0], fg = colors.black1[0], gui = "bold" },
  c = { bg = colors.black0[0], fg = colors.black1[0] },
}

if vim.g.kyotonight_lualine_bold then
  for _, mode in pairs(kyotonight) do
    mode.a.gui = "bold"
  end
end

return kyotonight
