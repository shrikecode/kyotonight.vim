local colors = require('kyotonight.colors')

local kyotonight = {}

kyotonight.normal = {
  a = { bg = colors.blue0[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.blue0[1] },
  c = { bg = colors.black0[1], fg = colors.fg[1] },
  x = { bg = colors.black0[1], fg = colors.blue0[1] },
}

kyotonight.insert = {
  a = { bg = colors.green[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.green[1] },
  x = { bg = colors.black0[1], fg = colors.green[1] },
}

kyotonight.command = {
  a = { bg = colors.yellow[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.yellow[1] },
  x = { bg = colors.black0[1], fg = colors.yellow[1] },
}

kyotonight.visual = {
  a = { bg = colors.magenta[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.magenta[1] },
  x = { bg = colors.black0[1], fg = colors.magenta[1] },
}

kyotonight.replace = {
  a = { bg = colors.red[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.red[1] },
  x = { bg = colors.black0[1], fg = colors.red[1] },
}

kyotonight.terminal = {
  a = { bg = colors.teal[1], fg = colors.black1[1] },
  b = { bg = colors.black1[1], fg = colors.teal[1] },
  x = { bg = colors.black0[1], fg = colors.teal[1] },
}

kyotonight.inactive = {
  a = { bg = colors.black0[1], fg = colors.blue0[1] },
  b = { bg = colors.black0[1], fg = colors.black1[1], gui = "bold" },
  c = { bg = colors.black0[1], fg = colors.black1[1] },
  x = { bg = colors.black0[1], fg = colors.black1[1] },
}

if vim.g.kyotonight_lualine_bold then
  for _, mode in pairs(kyotonight) do
    mode.a.gui = "bold"
  end
end

return kyotonight

