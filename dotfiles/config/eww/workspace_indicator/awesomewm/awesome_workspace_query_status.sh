#!/bin/bash

: '

Awesome workspace query status
returns status of each tag of each screen in json format
status being "empty" or "occupied"

@author: nguyenston
https://github.com/nguyenston

'

lua_script='
local ret_str_status = "["
for s in screen do
  local tag_status_str = "["
  for i, t in ipairs(s.tags) do
    if next(t:clients()) == nil then
      tag_status_str = tag_status_str .. "0, "
    else
      tag_status_str = tag_status_str .. "1, "
    end
  end
  tag_status_str = tag_status_str:sub(1, -3) .. "], "
  ret_str_status = ret_str_status .. tag_status_str
end
return ret_str_status:sub(1, -3) .. "]"
'
# query awsome-client for raw data
json_string=$(echo $lua_script | awesome-client)
json_string="${json_string:11:-1}"
eww update workspace_focus="${json_string}"

