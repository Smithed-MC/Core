execute if data entity @s Inventory[].tag.smithed.durability run function smithed:core/impl/v0_0_3/item/durability/detect

execute if score @s smithed.coas matches 1.. run function smithed:core/impl/v0_0_3/player/coas

execute unless score @s smithed.id matches -2147483648..2147483647 run function smithed:core/impl/v0_0_3/player/set_id