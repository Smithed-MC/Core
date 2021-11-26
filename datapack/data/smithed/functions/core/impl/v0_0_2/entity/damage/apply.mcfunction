execute if entity @s[type=player] run function smithed:core/impl/v0_0_2/entity/damage/health/calculate_modifier
execute if entity @s[type=!player] run function smithed:core/impl/v0_0_2/entity/damage/health/get_entity_health

execute if score @s smd.damage >= $maximumHealth smd.damage run function smithed:core/impl/v0_0_2/entity/damage/on_death
execute if score @s smd.damage < $maximumHealth smd.damage run function smithed:core/impl/v0_0_2/entity/damage/health/update
scoreboard players reset @s smd.damage
