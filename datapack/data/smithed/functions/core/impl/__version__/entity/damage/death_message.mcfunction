execute store result score $temp smithed.data run gamerule showDeathMessages

execute if score $temp smithed.data matches 1 run gamerule showDeathMessages false
execute if score $temp smithed.data matches 1 run function #smithed:core/events/player/death_message
kill @s
execute if score $temp smithed.data matches 1 run gamerule showDeathMessages true
