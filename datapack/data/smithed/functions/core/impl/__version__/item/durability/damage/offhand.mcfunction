#> @public

data modify storage smithed:core item set from entity @s Inventory[{Slot:-106b}]

function smithed:core/impl/__version__/item/durability/damage/force

execute unless data storage smithed:core {item:"null"} unless score $out smithed.data matches -1 run item modify entity @s weapon.offhand smithed:core/update_nbt
execute if data storage smithed:core {item:"null"} run item replace entity @s weapon.offhand with air