data modify storage smithed:core item set from entity @s SelectedItem
function smithed:core/impl/__version__/item/durability/process/handle

execute unless data storage smithed:core {item:"null"} unless score $out smithed.data matches -1 run item modify entity @s weapon.mainhand smithed:core/update_nbt
execute if data storage smithed:core {item:"null"} run item replace entity @s weapon.mainhand with air