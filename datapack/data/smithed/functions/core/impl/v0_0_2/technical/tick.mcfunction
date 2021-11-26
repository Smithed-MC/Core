execute as @a at @s run function smithed:core/impl/v0_0_2/player/tick

execute as @e[type=#smithed:core/ticking] at @s run function smithed:core/impl/v0_0_2/technical/entity_tick

schedule function smithed:core/impl/v0_0_2/technical/tick 1t replace