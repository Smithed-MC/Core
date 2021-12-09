execute as @a at @s run function smithed:core/impl/__version__/player/tick

execute as @e[type=#smithed:core/ticking] at @s run function smithed:core/impl/__version__/technical/entity_tick

schedule function smithed:core/impl/__version__/technical/tick 1t replace
