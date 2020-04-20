--[[ github-math – convert math expressions into GitHub-rendered images
--
-- Copyright © 2020 Albert Krewinkel. Published under the MIT license.
-- See LICENSE file for for details.
--]]

--- Rendering service to use. The LaTeX math string must be appended as
-- an URL-encoded string.
local url = 'https://render.githubusercontent.com/render/math?math=%s&mode=%s'

--- Percent (URL) encode a character.
function percent_encode (c)
  return string.format('%%%X', utf8.codepoint(c))
end

--- Convert a math element into an image. GitHub's rendering service
-- creates a rendered version on the fly.
function Math (m)
  local math_param = m.text:gsub('[!#$%%&()*+,%\\/:;=?@[%]" ]', percent_encode)
  local mode = m.mathtype == 'DisplayMath' and 'display' or 'inline'
  local attr = pandoc.Attr('', {'math', 'math-' .. mode}, {})

  return pandoc.Image(m.text, url:format(math_param, mode), '', attr)
end
