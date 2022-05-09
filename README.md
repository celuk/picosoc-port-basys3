# picosoc-port-basys3
Port of picosoc (picorv32) for BASYS3 FPGA BOARD

Use make_hex_mem.py on compiled riscv32im binaries for generating program memory. Then change progmem.v, run with symbiflow fpga compiler, upload bitstream file to basys3 fpga via openocd or openfpgaloader.
