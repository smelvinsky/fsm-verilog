#!/bin/bash

VERILOG_TB_FILE=fsm_2_tb.v
VERILOG_OUT_FILE=fsm_2
VERILOG_VCD_FILE=fsm_2_test.vcd

echo -e "Compiling $VERILOG_TB_FILE file with iverilog...\e[90m"
iverilog -o $VERILOG_OUT_FILE $VERILOG_TB_FILE
echo -e "\e[0mRunning $VERILOG_OUT_FILE...\e[90m"
./$VERILOG_OUT_FILE
echo -e "\e[0mRunning gtkwave...\e[90m"
gtkwave $VERILOG_VCD_FILE
echo -e "\e[0mDone..."