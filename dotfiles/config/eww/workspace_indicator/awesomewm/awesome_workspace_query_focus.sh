#!/bin/bash

: '

Awesome workspace query focus
returns selected tag for each screen in json format

@author: nguyenston
https://github.com/nguyenston

'

lua_script='
local ret_str_focus = "["
for s in screen do
  selected_tag = s.selected_tag.index - 1
  ret_str_focus = ret_str_focus .. selected_tag .. ", "
end
return ret_str_focus:sub(1, -3) .. "]"
'
# query awsome-client for raw data
json_string=$(echo $lua_script | awesome-client)
json_string="${json_string:11:-1}"
eww update workspace_focus="${json_string}"

