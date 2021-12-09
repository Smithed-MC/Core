data modify storage smithed:core lore.temp set from storage smithed:core item.tag.smithed.lore
execute store result score $iter smithed.data if data storage smithed:core lore.temp[]

function smithed:core/impl/__version__/item/lore/custom/iter