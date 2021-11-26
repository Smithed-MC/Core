execute store result score $temp smithed.data run data get storage smithed:core item.tag.Damage
scoreboard players remove $temp smithed.data 1
execute store result storage smithed:core item.tag.smithed.durability.damage int 1 run scoreboard players get $temp smithed.data

function smithed:core/impl/v0_0_3/item/durability/process/handle