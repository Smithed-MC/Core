function smithed:core/entity/damage/health/calculate_modifier
execute if score @s smd.damage >= $maximumHealth smd.damage run function smithed:core/entity/damage/on_death
execute if score @s smd.damage < $maximumHealth smd.damage run function smithed:core/entity/damage/health/update
scoreboard players reset @s smd.damage
