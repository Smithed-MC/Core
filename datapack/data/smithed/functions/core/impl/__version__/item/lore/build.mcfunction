#> smithed:core/impl/v0_0_3/item/lore/build
#> input: smithed:core item
#> output: smithed:core item

execute if data storage smithed:core item.tag.display.Lore[] unless data storage smithed:core item.tag.smithed.lore run data modify storage smithed:core item.tag.smithed.lore set from storage smithed:core item.tag.display.Lore
data remove storage smithed:core item.tag.display.Lore



#resolve custom lore
function smithed:core/impl/v0_0_3/item/lore/custom/start

#resolve attributes

#resolve durability
execute if data storage smithed:core item.tag.smithed.durability.dur run function smithed:core/impl/v0_0_3/item/lore/durability