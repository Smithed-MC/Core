#> @public
#> smithed:core/impl/__version__/technical/tools/log
#> Input: smithed:log {level: number, message: string-json, type: 'ERROR' | 'WARNING' | 'INFO'}

execute store result score $temp smithed.logLevel run data get storage smithed:log level
execute store result score $temp smithed.data run time query gametime


scoreboard players operation $seconds smithed.data = $temp smithed.data
scoreboard players operation $seconds smithed.data /= 20 smithed.const
scoreboard players operation $seconds smithed.data %= 60 smithed.const
execute if score $seconds smithed.data matches ..9 run data merge storage smithed:log {secPrefix:"0"}


scoreboard players operation $minutes smithed.data = $temp smithed.data
scoreboard players operation $minutes smithed.data /= 1200 smithed.const
scoreboard players operation $minutes smithed.data %= 60 smithed.const
execute if score $minutes smithed.data matches ..9 run data merge storage smithed:log {minPrefix:"0"}

scoreboard players operation $hours smithed.data = $temp smithed.data
scoreboard players operation $hours smithed.data /= 72000 smithed.const
scoreboard players operation $hours smithed.data %= 24 smithed.const
execute if score $hours smithed.data matches ..9 run data merge storage smithed:log {hourPrefix:"0"}

execute if data storage smithed:log {type:'ERROR'} run data merge storage smithed:log {typeLetter:"E"}
execute if data storage smithed:log {type:'WARNING'} run data merge storage smithed:log {typeLetter:"W"}
execute if data storage smithed:log {type:'INFO'} run data merge storage smithed:log {typeLetter:"I"}


data merge storage smithed:log {temp:'[{"text":"["},{"storage":"smithed:log","nbt":"hourPrefix"},{"score":{"name": "$hours","objective": "smithed.data"}},":",{"storage":"smithed:log","nbt":"minPrefix"},{"score":{"name": "$minutes","objective": "smithed.data"}},":",{"storage":"smithed:log","nbt":"secPrefix"},{"score":{"name": "$seconds","objective": "smithed.data"}},"] ",{"nbt":"typeLetter","storage":"smithed:log"}, ": ", {"nbt":"message","storage": "smithed:log","interpret": true, "color": "white"}]'}

execute as @a if score @s smithed.logLevel >= $temp smithed.logLevel run tag @s add smithed.sendMessage

execute if data storage smithed:log {type:'ERROR'} run tellraw @a[tag=smithed.sendMessage] {"nbt":"temp","storage": "smithed:log","interpret": true, "color": "red"}
execute if data storage smithed:log {type:'WARNING'} run tellraw @a[tag=smithed.sendMessage] {"nbt":"temp","storage": "smithed:log","interpret": true, "color": "yellow"}
execute if data storage smithed:log {type:'INFO'} run tellraw @a[tag=smithed.sendMessage] {"nbt":"temp","storage": "smithed:log","interpret": true, "color": "white"}
tag @a remove smithed.sendMessage

data merge storage smithed:log {level:1, message:'', type:'INFO'}
data remove storage smithed:log secPrefix
data remove storage smithed:log minPrefix
data remove storage smithed:log hourPrefix
data remove storage smithed:log temp
data remove storage smithed:log typeLetter