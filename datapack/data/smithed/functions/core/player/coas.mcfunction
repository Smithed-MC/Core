data modify storage smd:core item set from entity @s[nbt={Items:[{Slot:-106b,id:"minecraft:carrot_on_a_stick"}]}] Items[{Slot:-106b}]
data modify storage smd:core item set from entity @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] SelectedItem

function #smithed:core/player/use_coas
scoreboard players reset @s smd.coas