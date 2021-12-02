execute if predicate smithed:core/player/coas/offhand run function smithed:core/impl/__version__/player/coas/offhand
execute if predicate smithed:core/player/coas/mainhand run function smithed:core/impl/__version__/player/coas/mainhand

function #smithed:core/events/player/use_coas
scoreboard players reset @s smithed.coas