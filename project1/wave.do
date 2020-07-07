onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/test/mips/clk
add wave -noupdate sim:/test/mips/rst
add wave -noupdate sim:/test/mips/alusrc
add wave -noupdate sim:/test/mips/ext_sel
add wave -noupdate sim:/test/mips/npc_sel
add wave -noupdate -radix hexadecimal sim:/test/mips/imout
add wave -noupdate -radix hexadecimal sim:/test/mips/data1
add wave -noupdate -radix hexadecimal sim:/test/mips/data2
add wave -noupdate -radix hexadecimal sim:/test/mips/alunum_b
add wave -noupdate -radix hexadecimal sim:/test/mips/pc
add wave -noupdate -radix hexadecimal sim:/test/mips/aluout
add wave -noupdate -radix hexadecimal sim:/test/mips/dout
add wave -noupdate -radix hexadecimal -childformat {{{/test/mips/extended[31]} -radix hexadecimal} {{/test/mips/extended[30]} -radix hexadecimal} {{/test/mips/extended[29]} -radix hexadecimal} {{/test/mips/extended[28]} -radix hexadecimal} {{/test/mips/extended[27]} -radix hexadecimal} {{/test/mips/extended[26]} -radix hexadecimal} {{/test/mips/extended[25]} -radix hexadecimal} {{/test/mips/extended[24]} -radix hexadecimal} {{/test/mips/extended[23]} -radix hexadecimal} {{/test/mips/extended[22]} -radix hexadecimal} {{/test/mips/extended[21]} -radix hexadecimal} {{/test/mips/extended[20]} -radix hexadecimal} {{/test/mips/extended[19]} -radix hexadecimal} {{/test/mips/extended[18]} -radix hexadecimal} {{/test/mips/extended[17]} -radix hexadecimal} {{/test/mips/extended[16]} -radix hexadecimal} {{/test/mips/extended[15]} -radix hexadecimal} {{/test/mips/extended[14]} -radix hexadecimal} {{/test/mips/extended[13]} -radix hexadecimal} {{/test/mips/extended[12]} -radix hexadecimal} {{/test/mips/extended[11]} -radix hexadecimal} {{/test/mips/extended[10]} -radix hexadecimal} {{/test/mips/extended[9]} -radix hexadecimal} {{/test/mips/extended[8]} -radix hexadecimal} {{/test/mips/extended[7]} -radix hexadecimal} {{/test/mips/extended[6]} -radix hexadecimal} {{/test/mips/extended[5]} -radix hexadecimal} {{/test/mips/extended[4]} -radix hexadecimal} {{/test/mips/extended[3]} -radix hexadecimal} {{/test/mips/extended[2]} -radix hexadecimal} {{/test/mips/extended[1]} -radix hexadecimal} {{/test/mips/extended[0]} -radix hexadecimal}} -subitemconfig {{/test/mips/extended[31]} {-height 15 -radix hexadecimal} {/test/mips/extended[30]} {-height 15 -radix hexadecimal} {/test/mips/extended[29]} {-height 15 -radix hexadecimal} {/test/mips/extended[28]} {-height 15 -radix hexadecimal} {/test/mips/extended[27]} {-height 15 -radix hexadecimal} {/test/mips/extended[26]} {-height 15 -radix hexadecimal} {/test/mips/extended[25]} {-height 15 -radix hexadecimal} {/test/mips/extended[24]} {-height 15 -radix hexadecimal} {/test/mips/extended[23]} {-height 15 -radix hexadecimal} {/test/mips/extended[22]} {-height 15 -radix hexadecimal} {/test/mips/extended[21]} {-height 15 -radix hexadecimal} {/test/mips/extended[20]} {-height 15 -radix hexadecimal} {/test/mips/extended[19]} {-height 15 -radix hexadecimal} {/test/mips/extended[18]} {-height 15 -radix hexadecimal} {/test/mips/extended[17]} {-height 15 -radix hexadecimal} {/test/mips/extended[16]} {-height 15 -radix hexadecimal} {/test/mips/extended[15]} {-height 15 -radix hexadecimal} {/test/mips/extended[14]} {-height 15 -radix hexadecimal} {/test/mips/extended[13]} {-height 15 -radix hexadecimal} {/test/mips/extended[12]} {-height 15 -radix hexadecimal} {/test/mips/extended[11]} {-height 15 -radix hexadecimal} {/test/mips/extended[10]} {-height 15 -radix hexadecimal} {/test/mips/extended[9]} {-height 15 -radix hexadecimal} {/test/mips/extended[8]} {-height 15 -radix hexadecimal} {/test/mips/extended[7]} {-height 15 -radix hexadecimal} {/test/mips/extended[6]} {-height 15 -radix hexadecimal} {/test/mips/extended[5]} {-height 15 -radix hexadecimal} {/test/mips/extended[4]} {-height 15 -radix hexadecimal} {/test/mips/extended[3]} {-height 15 -radix hexadecimal} {/test/mips/extended[2]} {-height 15 -radix hexadecimal} {/test/mips/extended[1]} {-height 15 -radix hexadecimal} {/test/mips/extended[0]} {-height 15 -radix hexadecimal}} sim:/test/mips/extended
add wave -noupdate sim:/test/mips/aluop
add wave -noupdate sim:/test/mips/wrreg
add wave -noupdate -radix hexadecimal sim:/test/mips/wrdata
add wave -noupdate sim:/test/mips/zero
add wave -noupdate sim:/test/mips/memwrite
add wave -noupdate sim:/test/mips/lb_flag
add wave -noupdate sim:/test/mips/oflow
add wave -noupdate sim:/test/mips/memtoreg
add wave -noupdate sim:/test/mips/regdst
add wave -noupdate sim:/test/mips/regwrite
add wave -noupdate sim:/test/mips/of_control
add wave -noupdate sim:/test/mips/GPR/rst
add wave -noupdate sim:/test/mips/alu/oflow
add wave -noupdate sim:/test/mips/alu/aluop
add wave -noupdate sim:/test/mips/alu/oflow_add
add wave -noupdate sim:/test/mips/GPR/read1
add wave -noupdate sim:/test/mips/GPR/read2
add wave -noupdate sim:/test/mips/GPR/data1
add wave -noupdate sim:/test/mips/GPR/data2
add wave -noupdate sim:/test/mips/GPR/regwrite
add wave -noupdate sim:/test/mips/GPR/wrreg
add wave -noupdate -radix hexadecimal sim:/test/mips/GPR/wrdata
add wave -noupdate -radix hexadecimal -childformat {{{/test/mips/GPR/memory[0]} -radix hexadecimal} {{/test/mips/GPR/memory[1]} -radix hexadecimal} {{/test/mips/GPR/memory[2]} -radix hexadecimal} {{/test/mips/GPR/memory[3]} -radix hexadecimal} {{/test/mips/GPR/memory[4]} -radix hexadecimal} {{/test/mips/GPR/memory[5]} -radix hexadecimal} {{/test/mips/GPR/memory[6]} -radix hexadecimal} {{/test/mips/GPR/memory[7]} -radix hexadecimal} {{/test/mips/GPR/memory[8]} -radix hexadecimal} {{/test/mips/GPR/memory[9]} -radix hexadecimal} {{/test/mips/GPR/memory[10]} -radix hexadecimal} {{/test/mips/GPR/memory[11]} -radix hexadecimal} {{/test/mips/GPR/memory[12]} -radix hexadecimal} {{/test/mips/GPR/memory[13]} -radix hexadecimal} {{/test/mips/GPR/memory[14]} -radix hexadecimal} {{/test/mips/GPR/memory[15]} -radix hexadecimal} {{/test/mips/GPR/memory[16]} -radix hexadecimal} {{/test/mips/GPR/memory[17]} -radix hexadecimal} {{/test/mips/GPR/memory[18]} -radix hexadecimal} {{/test/mips/GPR/memory[19]} -radix hexadecimal} {{/test/mips/GPR/memory[20]} -radix hexadecimal} {{/test/mips/GPR/memory[21]} -radix hexadecimal} {{/test/mips/GPR/memory[22]} -radix hexadecimal} {{/test/mips/GPR/memory[23]} -radix hexadecimal} {{/test/mips/GPR/memory[24]} -radix hexadecimal} {{/test/mips/GPR/memory[25]} -radix hexadecimal} {{/test/mips/GPR/memory[26]} -radix hexadecimal} {{/test/mips/GPR/memory[27]} -radix hexadecimal} {{/test/mips/GPR/memory[28]} -radix hexadecimal} {{/test/mips/GPR/memory[29]} -radix hexadecimal} {{/test/mips/GPR/memory[30]} -radix hexadecimal} {{/test/mips/GPR/memory[31]} -radix hexadecimal}} -expand -subitemconfig {{/test/mips/GPR/memory[0]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[1]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[2]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[3]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[4]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[5]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[6]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[7]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[8]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[9]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[10]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[11]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[12]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[13]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[14]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[15]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[16]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[17]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[18]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[19]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[20]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[21]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[22]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[23]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[24]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[25]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[26]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[27]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[28]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[29]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[30]} {-height 15 -radix hexadecimal} {/test/mips/GPR/memory[31]} {-height 15 -radix hexadecimal}} sim:/test/mips/GPR/memory
add wave -noupdate sim:/test/mips/GPR/of_wr_flag
add wave -noupdate sim:/test/mips/GPR/overflow_flag
add wave -noupdate sim:/test/mips/GPR/of_control
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1992 ns} 0}
configure wave -namecolwidth 223
configure wave -valuecolwidth 128
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
WaveRestoreZoom {1989 ns} {2001 ns}
