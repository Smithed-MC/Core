data modify storage smd:core item set from entity @s Inventory[{Slot:103b}]

function smithed:core/item/durability/damage/force

execute unless data storage smd:core {item:"null"} unless score $out smd.data matches -1 run item modify entity @s armor.head smithed:core/update_nbt
execute if data storage smd:core {item:"null"} run item replace entity @s armor.head with air