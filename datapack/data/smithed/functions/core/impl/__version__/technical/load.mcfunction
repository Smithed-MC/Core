scoreboard objectives add smithed.data dummy
scoreboard objectives add smithed.damage dummy

scoreboard objectives add smithed.id dummy

scoreboard objectives add smithed.logLevel dummy
scoreboard objectives add smithed.const dummy

scoreboard objectives add smithed.takeDamage minecraft.custom:minecraft.damage_taken
scoreboard objectives add smithed.dealDamage minecraft.custom:minecraft.damage_dealt

scoreboard objectives add smithed.coas minecraft.used:minecraft.carrot_on_a_stick

<<<<<<< HEAD:datapack/data/smithed/functions/core/impl/v0_0_3/technical/load.mcfunction
scoreboard objectives add smithed.xp xp
scoreboard objectives add smithed.prev_xp dummy

forceload remove -30000000 1600
forceload add -30000000 1600

execute unless block -30000000 0 1602 minecraft:yellow_shulker_box run setblock -30000000 0 1602 minecraft:yellow_shulker_box
execute unless block -30000000 0 1603 minecraft:oak_wall_sign run setblock -30000000 0 1603 minecraft:oak_wall_sign[facing=south]
fill -30000000 1 1600 -30000000 1 1615 minecraft:bedrock

function smithed:core/impl/v0_0_3/technical/def_const
=======
function smithed:core/impl/__version__/technical/def_const
>>>>>>> f22724c00473e5cc9cdee79f78332fbbf92a535e:datapack/data/smithed/functions/core/impl/__version__/technical/load.mcfunction

function smithed:core/impl/__version__/technical/tick