onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/system/mips/dm/dm
add wave -noupdate -childformat {{{/test/system/mips/GPR/memory[0]} -radix hexadecimal} {{/test/system/mips/GPR/memory[1]} -radix hexadecimal} {{/test/system/mips/GPR/memory[2]} -radix hexadecimal} {{/test/system/mips/GPR/memory[3]} -radix hexadecimal} {{/test/system/mips/GPR/memory[4]} -radix hexadecimal} {{/test/system/mips/GPR/memory[5]} -radix hexadecimal} {{/test/system/mips/GPR/memory[6]} -radix hexadecimal} {{/test/system/mips/GPR/memory[7]} -radix hexadecimal} {{/test/system/mips/GPR/memory[8]} -radix hexadecimal} {{/test/system/mips/GPR/memory[9]} -radix hexadecimal} {{/test/system/mips/GPR/memory[10]} -radix hexadecimal} {{/test/system/mips/GPR/memory[11]} -radix hexadecimal} {{/test/system/mips/GPR/memory[12]} -radix hexadecimal} {{/test/system/mips/GPR/memory[13]} -radix hexadecimal} {{/test/system/mips/GPR/memory[14]} -radix hexadecimal} {{/test/system/mips/GPR/memory[15]} -radix hexadecimal} {{/test/system/mips/GPR/memory[16]} -radix hexadecimal} {{/test/system/mips/GPR/memory[17]} -radix hexadecimal} {{/test/system/mips/GPR/memory[18]} -radix hexadecimal} {{/test/system/mips/GPR/memory[19]} -radix hexadecimal} {{/test/system/mips/GPR/memory[20]} -radix hexadecimal} {{/test/system/mips/GPR/memory[21]} -radix hexadecimal} {{/test/system/mips/GPR/memory[22]} -radix hexadecimal} {{/test/system/mips/GPR/memory[23]} -radix hexadecimal} {{/test/system/mips/GPR/memory[24]} -radix hexadecimal} {{/test/system/mips/GPR/memory[25]} -radix hexadecimal} {{/test/system/mips/GPR/memory[26]} -radix hexadecimal} {{/test/system/mips/GPR/memory[27]} -radix hexadecimal} {{/test/system/mips/GPR/memory[28]} -radix hexadecimal} {{/test/system/mips/GPR/memory[29]} -radix hexadecimal} {{/test/system/mips/GPR/memory[30]} -radix hexadecimal} {{/test/system/mips/GPR/memory[31]} -radix hexadecimal}} -expand -subitemconfig {{/test/system/mips/GPR/memory[0]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[1]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[2]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[3]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[4]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[5]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[6]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[7]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[8]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[9]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[10]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[11]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[12]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[13]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[14]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[15]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[16]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[17]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[18]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[19]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[20]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[21]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[22]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[23]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[24]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[25]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[26]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[27]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[28]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[29]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[30]} {-height 15 -radix hexadecimal} {/test/system/mips/GPR/memory[31]} {-height 15 -radix hexadecimal}} /test/system/mips/GPR/memory
add wave -noupdate -radix hexadecimal /test/system/mips/pc
add wave -noupdate -radix hexadecimal /test/system/mips/imout
add wave -noupdate /test/system/outputsim/clk
add wave -noupdate /test/system/mips/Wen
add wave -noupdate /test/system/bridge/wen
add wave -noupdate /test/system/mips/controller/state
add wave -noupdate -radix hexadecimal /test/system/outputsim/temp1
add wave -noupdate -radix hexadecimal /test/system/outputsim/temp2
add wave -noupdate /test/system/outputsim/wen
add wave -noupdate /test/system/outputsim/addr
add wave -noupdate /test/system/outputsim/addr
add wave -noupdate -radix hexadecimal /test/system/outputsim/din
add wave -noupdate -radix hexadecimal /test/system/inputsim/dout
add wave -noupdate -radix hexadecimal /test/system/inputsim/dout
add wave -noupdate -radix hexadecimal -childformat {{{/test/system/bridge/rd1[31]} -radix hexadecimal} {{/test/system/bridge/rd1[30]} -radix hexadecimal} {{/test/system/bridge/rd1[29]} -radix hexadecimal} {{/test/system/bridge/rd1[28]} -radix hexadecimal} {{/test/system/bridge/rd1[27]} -radix hexadecimal} {{/test/system/bridge/rd1[26]} -radix hexadecimal} {{/test/system/bridge/rd1[25]} -radix hexadecimal} {{/test/system/bridge/rd1[24]} -radix hexadecimal} {{/test/system/bridge/rd1[23]} -radix hexadecimal} {{/test/system/bridge/rd1[22]} -radix hexadecimal} {{/test/system/bridge/rd1[21]} -radix hexadecimal} {{/test/system/bridge/rd1[20]} -radix hexadecimal} {{/test/system/bridge/rd1[19]} -radix hexadecimal} {{/test/system/bridge/rd1[18]} -radix hexadecimal} {{/test/system/bridge/rd1[17]} -radix hexadecimal} {{/test/system/bridge/rd1[16]} -radix hexadecimal} {{/test/system/bridge/rd1[15]} -radix hexadecimal} {{/test/system/bridge/rd1[14]} -radix hexadecimal} {{/test/system/bridge/rd1[13]} -radix hexadecimal} {{/test/system/bridge/rd1[12]} -radix hexadecimal} {{/test/system/bridge/rd1[11]} -radix hexadecimal} {{/test/system/bridge/rd1[10]} -radix hexadecimal} {{/test/system/bridge/rd1[9]} -radix hexadecimal} {{/test/system/bridge/rd1[8]} -radix hexadecimal} {{/test/system/bridge/rd1[7]} -radix hexadecimal} {{/test/system/bridge/rd1[6]} -radix hexadecimal} {{/test/system/bridge/rd1[5]} -radix hexadecimal} {{/test/system/bridge/rd1[4]} -radix hexadecimal} {{/test/system/bridge/rd1[3]} -radix hexadecimal} {{/test/system/bridge/rd1[2]} -radix hexadecimal} {{/test/system/bridge/rd1[1]} -radix hexadecimal} {{/test/system/bridge/rd1[0]} -radix hexadecimal}} -subitemconfig {{/test/system/bridge/rd1[31]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[30]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[29]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[28]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[27]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[26]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[25]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[24]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[23]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[22]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[21]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[20]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[19]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[18]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[17]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[16]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[15]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[14]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[13]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[12]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[11]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[10]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[9]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[8]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[7]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[6]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[5]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[4]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[3]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[2]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[1]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd1[0]} {-height 15 -radix hexadecimal}} /test/system/bridge/rd1
add wave -noupdate -radix hexadecimal /test/system/bridge/rd2
add wave -noupdate -radix hexadecimal -childformat {{{/test/system/bridge/rd3[31]} -radix hexadecimal} {{/test/system/bridge/rd3[30]} -radix hexadecimal} {{/test/system/bridge/rd3[29]} -radix hexadecimal} {{/test/system/bridge/rd3[28]} -radix hexadecimal} {{/test/system/bridge/rd3[27]} -radix hexadecimal} {{/test/system/bridge/rd3[26]} -radix hexadecimal} {{/test/system/bridge/rd3[25]} -radix hexadecimal} {{/test/system/bridge/rd3[24]} -radix hexadecimal} {{/test/system/bridge/rd3[23]} -radix hexadecimal} {{/test/system/bridge/rd3[22]} -radix hexadecimal} {{/test/system/bridge/rd3[21]} -radix hexadecimal} {{/test/system/bridge/rd3[20]} -radix hexadecimal} {{/test/system/bridge/rd3[19]} -radix hexadecimal} {{/test/system/bridge/rd3[18]} -radix hexadecimal} {{/test/system/bridge/rd3[17]} -radix hexadecimal} {{/test/system/bridge/rd3[16]} -radix hexadecimal} {{/test/system/bridge/rd3[15]} -radix hexadecimal} {{/test/system/bridge/rd3[14]} -radix hexadecimal} {{/test/system/bridge/rd3[13]} -radix hexadecimal} {{/test/system/bridge/rd3[12]} -radix hexadecimal} {{/test/system/bridge/rd3[11]} -radix hexadecimal} {{/test/system/bridge/rd3[10]} -radix hexadecimal} {{/test/system/bridge/rd3[9]} -radix hexadecimal} {{/test/system/bridge/rd3[8]} -radix hexadecimal} {{/test/system/bridge/rd3[7]} -radix hexadecimal} {{/test/system/bridge/rd3[6]} -radix hexadecimal} {{/test/system/bridge/rd3[5]} -radix hexadecimal} {{/test/system/bridge/rd3[4]} -radix hexadecimal} {{/test/system/bridge/rd3[3]} -radix hexadecimal} {{/test/system/bridge/rd3[2]} -radix hexadecimal} {{/test/system/bridge/rd3[1]} -radix hexadecimal} {{/test/system/bridge/rd3[0]} -radix hexadecimal}} -subitemconfig {{/test/system/bridge/rd3[31]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[30]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[29]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[28]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[27]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[26]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[25]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[24]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[23]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[22]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[21]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[20]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[19]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[18]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[17]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[16]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[15]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[14]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[13]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[12]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[11]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[10]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[9]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[8]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[7]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[6]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[5]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[4]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[3]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[2]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[1]} {-height 15 -radix hexadecimal} {/test/system/bridge/rd3[0]} {-height 15 -radix hexadecimal}} /test/system/bridge/rd3
add wave -noupdate /test/system/timer/ADD_I
add wave -noupdate /test/system/timer/WE_I
add wave -noupdate -radix hexadecimal /test/system/timer/DAT_I
add wave -noupdate -radix hexadecimal /test/system/timer/DAT_O
add wave -noupdate /test/system/timer/IRQ
add wave -noupdate -radix hexadecimal /test/system/timer/CTRL
add wave -noupdate -radix hexadecimal /test/system/timer/PRESET
add wave -noupdate -radix unsigned /test/system/timer/counter
add wave -noupdate -radix hexadecimal /test/system/mips/CP0/SR
add wave -noupdate -radix hexadecimal /test/system/mips/CP0/Cause
add wave -noupdate -radix hexadecimal /test/system/mips/CP0/EPC
add wave -noupdate -radix hexadecimal /test/system/mips/CP0/PrID
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9503 ns} 0}
configure wave -namecolwidth 258
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {5242 ns} {19942 ns}
