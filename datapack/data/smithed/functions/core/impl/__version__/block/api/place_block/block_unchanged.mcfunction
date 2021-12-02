
execute store success score $temp smithed.data run data modify storage smithed:core blockApi.__data set from block ~ ~ ~

execute if score $temp smithed.data matches 0 run function smithed:core/impl/__version__/block/api/place_block/throw_warning

