[![MIT licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[简体中文](README.md)
-----------
# Description
Three CPU projects that increase in difficulty and their test programs. If you want to test them, please run test.v and wave.do in ModelSim.

## Single-cycle cpu
The first project is a simple one. It supports the instruction set below.

*MIPS-1＝{addu,subu,ori,lw,sw,beq,lui,addi,addiu,lb,slt,jal,jr}*

## Multi-cycle cpu
This project has a completely refactoried controller to support a multi-cycle cpu.

There are five stages in the controller to control the whole pipeline: if(instruction fetch), dcd/rf(decoding/registers fetch), exe(execution), mem(memory access), wb(write back).

The control signals will come into effect only in the specific stage.

Added some data delayers for the use of some instructions.

Added a PC control module, PC changes only when permitted.

Added a instruction reading module, read instructions only when permitted.

It supports the instruction set below.

*MIPS-2＝{addu,subu,slt,jr,addi,addiu,ori,lw,lb,sw,sb,beq,lui,j,jal,bgezal}*

## Microsystem
A simple microsystem implements data exchange between CPU and I/O devices.This whole project simulates a small function: every few clocks(10 as setted up), there will be an exception interrupt on CPU and jump to exception handler, the output device will save the data from input device, and if it equals with previous data, the data will increase by one every time exception happens. 

Added a system bridge to exchange data between CPU and I/O devices.

Added a coprocessor CP0(Considring that only the SR,CAUSE,EPC,PrID take effect in this, I just complete these four registers).

Added a input simulator.

Added a output simulator.

Added a timer, sends a pulse every setted(data in PRESET register) clocks. It supports two mode:

mode 0: when countdown to 0, timer stops until PRESET is changed again. Often used to send out a time exception.

mode 1(not used or tested): when countdown to 0, restart the timer immediately. Often used to send out cyclicity signals.

It supports the instruction set below.

*MIPS-3＝{addu,subu,slt,jr,addi,addiu,ori,lw,lb,sw,sb,beq,lui,j,jal,bgezal,ERET,MFC0,MTC0}*
