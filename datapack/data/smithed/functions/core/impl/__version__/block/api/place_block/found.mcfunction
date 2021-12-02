data modify storage smithed:core blockApi.id set from block ~ ~ ~ Items[0].tag.smithed.block.id 

data modify storage smithed:core blockApi.__data set from block ~ ~ ~
function #smithed:core/events/place_block

execute if block ~ ~ ~ #smithed:core/placeable run function smithed:core/impl/__version__/block/api/place_block/block_unchanged
