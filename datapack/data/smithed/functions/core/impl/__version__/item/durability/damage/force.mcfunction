#> @public

execute store result score $temp smithed.data run data get storage smithed:core item.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl

execute if score $temp smithed.data matches 0 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 1 if predicate smithed:core/chance/50 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 2 if predicate smithed:core/chance/33 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 3 if predicate smithed:core/chance/25 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 4 if predicate smithed:core/chance/20 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 5 if predicate smithed:core/chance/16 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 6 if predicate smithed:core/chance/14 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 7 if predicate smithed:core/chance/12 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 8 if predicate smithed:core/chance/11 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 9 if predicate smithed:core/chance/10 run function smithed:core/impl/__version__/item/durability/damage/force/sub
execute if score $temp smithed.data matches 10.. if predicate smithed:core/chance/9 run function smithed:core/impl/__version__/item/durability/damage/force/sub