execute store result score $temp smd.data run gamerule showDeathMessages

execute if score $temp smd.data matches 1 run gamerule showDeathMessages false
execute if score $temp smd.data matches 1 run function #smithed:core/player/death_message
kill @s
execute if score $temp smd.data matches 1 run gamerule showDeathMessages true
