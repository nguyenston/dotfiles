#!/bin/bash

: '

Awesome set workspace
$1=<tag index>

@author: nguyenston
https://github.com/nguyenston

'

lua_script="
local awful = require('awful')
local screen = awful.screen.focused({ client = false, mouse = true })
local old_tag = screen.selected_tag
local tag = screen.tags[${1}]

if tag and old_tag ~= tag then
	_ = old_tag and old_tag:emit_signal('tag::unselect', old_tag)
	tag:view_only()
	tag:emit_signal('tag::select', tag)
end
"
echo $lua_script | awesome-client

