execute if data entity @s Inventory[].tag.smithed.durability run function smithed:core/impl/__version__/item/durability/detect

execute if score @s smithed.coas matches 1.. run function smithed:core/impl/__version__/player/coas

execute unless score @s smithed.id matches -2147483648..2147483647 run function smithed:core/impl/__version__/player/set_id