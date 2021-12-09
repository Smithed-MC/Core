execute unless data storage smithed:core item.tag.smithed.durability.dur run function smithed:core/impl/__version__/item/durability/init

function smithed:core/impl/__version__/item/durability/calc_durability
execute if score $out smithed.data matches -1..0 run playsound minecraft:entity.item.break player @a[distance=..16]
execute if score $out smithed.data matches 0 run data modify storage smithed:core item set value "null"

