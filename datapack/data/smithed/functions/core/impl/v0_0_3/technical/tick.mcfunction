execute as @a at @s run function smithed:core/impl/v0_0_3/player/tick

execute as @e[type=#smithed:core/ticking] at @s run function smithed:core/impl/v0_0_3/technical/entity_tick

schedule function smithed:core/impl/v0_0_3/technical/tick 1t replace
