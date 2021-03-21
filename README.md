[![MIT licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[English](README_zh_en.md)
-----------
# 描述
三个难度递增的Verilog CPU项目及其测试程序,请在ModelSim中运行test.v以及wave.do进行相关测试.

## 单周期cpu
第一个单周期项目比较简单,它支持以下指令集.

*MIPS-1＝{addu,subu,ori,lw,sw,beq,lui,addi,addiu,lb,slt,jal,jr}*

## 多周期cpu
该项目对controller模块进行了完全的重构,以实现多周期的执行过程.

在controller模块中共有5个周期用来控制整个运行时:if(instruction fetch), dcd/rf(decoding/registers fetch), exe(execution), mem(memory access), wb(write back).

相关的控制信号只有在指定的周期才会生效.

增加了一些数据延迟器,用于某些特殊的指令.

增加了一个PC控制模块,仅当被允许时PC才能改变.

增加了一个指令读取模块,仅当被允许时才能读取指令.

它支持以下指令集.

*MIPS-2＝{addu,subu,slt,jr,addi,addiu,ori,lw,lb,sw,sb,beq,lui,j,jal,bgezal}*

## 微系统
该项目实现了一个简单的微系统,模拟了CPU和I/O设备间的数据交换.整个项目在运行时产生如下的效果:每隔一定时钟周期(预设为10),CPU将发生一次中断并由中断子程序执行I/O操作,中断子程序不断读取新的输入设备内容,一旦发现与之前的32位输入值不同,则更新32位输出设备显示为当前新值,否则将输出设备显示内容加1.

提供了系统桥以供CPU和I/O设备间进行数据交换.

增加了协处理器CP0(由于仅SR,CAUSE,EPC,PrID四个寄存器在该项目中生效,简化了该实现,只实现了这四个寄存器)以支持异常和中断.

增加了输入和输出模拟模块.

增加了一个定时器,每隔一个设定的(在PRESET寄存器中存储)时钟周期,会发送一个脉冲信号.它支持以下两种模式:

模式0:当计数器减为0后停止计数,直到PRESET寄存器再次被外部写入.通常用于产生定时中断.

模式1(未使用):当计数器减为0后,立即读取PRESET寄存器的值并再次计数.通常用于产生周期性脉冲.

它支持以下指令集.

*MIPS-3＝{addu,subu,slt,jr,addi,addiu,ori,lw,lb,sw,sb,beq,lui,j,jal,bgezal,ERET,MFC0,MTC0}*
