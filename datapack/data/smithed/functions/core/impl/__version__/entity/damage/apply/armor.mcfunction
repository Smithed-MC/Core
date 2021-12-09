# @public

# rx97
#  adapted from TCC

# get values (x100)
execute store result score #10armor smithed.damage run attribute @s minecraft:generic.armor get 10
execute store result score #10toughness smithed.damage run attribute @s minecraft:generic.armor_toughness get 10
scoreboard players operation #damage smithed.damage = @s smithed.damage

# tellraw @s ["armor: ", {"score": {"name": "#10armor", "objective": "smithed.damage"}, "color": "green"}]
# tellraw @s ["armor toughness: ", {"score": {"name": "#10toughness", "objective": "smithed.damage"}, "color": "red"}]
# tellraw @s ["damage: ", {"score": {"name": "#damage", "objective": "smithed.damage"}, "color": "green"}]

data modify storage smithed:core temp set from entity @s

# first armor and toughness
function smithed:core/impl/__version__/entity/damage/armor/toughness

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "smithed.damage"}, "color": "red"}]

# then protection
function smithed:core/impl/__version__/entity/damage/armor/protection

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "smithed.damage"}, "color": "green"}]

# finally resistance
function smithed:core/impl/__version__/entity/damage/armor/resistance

# tellraw @s ["damage: ", {"score": {"name": "@s", "objective": "smithed.damage"}, "color": "red"}]

# tellraw @s ""

# go back to same scale
scoreboard players operation @s smithed.damage /= 10 smithed.const

# apply new damage
execute if score @s smithed.damage matches 1.. run function smithed:core/impl/__version__/entity/damage/apply
