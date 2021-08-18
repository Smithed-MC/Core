data merge storage smd:log {message:'{"nbt":"item.tag.smithed.durability.damage","storage":"smd:core"}'}
function smithed:core/technical/tools/log

execute store result score $temp smd.data run data get storage smd:core item.tag.smithed.durability.damage
scoreboard players remove $temp smd.data 1
execute store result storage smd:core item.tag.smithed.durability.damage int 1 run scoreboard players get $temp smd.data

data merge storage smd:log {message:'{"nbt":"item.tag.smithed.durability.damage","storage":"smd:core"}'}
function smithed:core/technical/tools/log

function smithed:core/item/durability/process/handle