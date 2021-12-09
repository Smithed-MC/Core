data modify block -30000000 0 1603 Text1 set from storage smithed:core lore.temp[-1] 
data remove storage smithed:core lore.temp[-1]
scoreboard players remove $iter smithed.data 1

data modify storage smithed:core item.tag.display.Lore append from block -30000000 0 1603 Text1

execute if score $iter smithed.data matches 1.. run function smithed:core/impl/__version__/item/lore/custom/iter


