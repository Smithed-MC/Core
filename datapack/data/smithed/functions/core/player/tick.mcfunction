execute if data entity @s Inventory[].tag.smithed.durability run function smithed:core/item/durability/detect

execute if score @s smd.coas matches 1.. run function smithed:core/player/coas

execute unless score @s smd.id matches -2147483648..2147483647 run function smithed:core/player/set_id