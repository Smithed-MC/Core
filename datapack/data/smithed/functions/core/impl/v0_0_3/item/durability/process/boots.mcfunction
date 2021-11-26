data modify storage smithed:core item set from entity @s Inventory[{Slot:100b}]
function smithed:core/impl/v0_0_3/item/durability/process/handle

execute unless data storage smithed:core {item:"null"} unless score $out smithed.data matches -1 run item modify entity @s armor.feet smithed:core/update_nbt
execute if data storage smithed:core {item:"null"} run item replace entity @s armor.feet with air