data modify storage smd:core blockApi.id set from block ~ ~ ~ Items[0].tag.smithed.block.id 

data modify storage smd:core blockApi.__data set from block ~ ~ ~
function #smithed:core/place_block

execute if block ~ ~ ~ #smithed:core/placeable run function smithed:core/block/api/place_block/block_unchanged
