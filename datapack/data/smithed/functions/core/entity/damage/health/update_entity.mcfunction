execute store result score $temp smd.damage run data get entity @s Health 100

scoreboard players operation @s smd.damage *= 100 smd.const
scoreboard players operation $temp smd.damage -= @s smd.damage

execute store result entity @s Health float 0.01 run scoreboard players get $temp smd.damage

effect give @s[type=#smithed:core/undead] instant_health 1 127 true
effect give @s[type=!#smithed:core/undead] instant_damage 1 127 true