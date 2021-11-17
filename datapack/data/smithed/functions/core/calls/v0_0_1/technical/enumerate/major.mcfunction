execute if score #smd.core.major load.status matches ..0 unless score #smd.core.major load.status matches 0 run function smithed:core/calls/v0_0_1/technical/enumerate/set_version
execute if score #smd.core.major load.status matches ..0 if score #smd.core.major load.status matches 0 unless score #smd.core.set load.status matches 1 run function smithed:core/calls/v0_0_1/technical/enumerate/minor
