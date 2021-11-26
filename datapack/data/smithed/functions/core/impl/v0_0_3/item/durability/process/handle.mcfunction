execute store result score $temp smithed.data run data get storage smithed:core item.tag.Damage
execute store result score $temp1 smithed.data run data get storage smithed:core item.tag.smithed.durability.damage

execute if score $temp smithed.data = $temp1 smithed.data run scoreboard players set $out smithed.data -1
execute unless score $temp smithed.data = $temp1 smithed.data run function smithed:core/impl/v0_0_3/item/durability/damage