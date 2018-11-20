local List = require 'pandoc.List'
local vars = {}

function get_vars (meta)
  for k, v in pairs(meta) do
    if v.t == 'MetaInlines' then
      vars['$' .. k .. '$'] = {table.unpack(v)}
    elseif type(v) == 'string' then
      vars['$' .. k .. '$'] = {pandoc.Str(v)}
    end
  end
end

function separate_variables (str)
  local s, last_end = str.text, 0
  local result = List:new()
  local var_start, var_end, prefix, var
  repeat
    var_start, var_end = s:find('%$%a+%$', last_end)
    if var_start then
      result:extend {
        pandoc.Str(s:sub(last_end + 1, var_start - 1)),
        pandoc.Str(s:sub(var_start, var_end))
      }
      last_end = var_end
    else
      table.insert(result, pandoc.Str(s:sub(last_end + 1, -1)))
    end
  until var_start == nil or last_end >= #s
  return result
end

function replace (el)
  return vars[el.text] or nil
end

return {{Meta = get_vars}, {Str = separate_variables}, {Str = replace}}
