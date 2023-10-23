# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@wokwi.com>
# SPDX-License-Identifier: MIT

firmware.hex: firmware.bin
	echo "@100000" > firmware.hex
	hexdump -v -e '"" 32/1 "%02x " "\n"' firmware.bin >> firmware.hex

firmware.bin: firmware.elf
	riscv64-unknown-elf-objcopy -O binary --only-section=.text firmware.elf firmware.bin

firmware.elf: firmware.S
	riscv64-unknown-elf-gcc -g -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -nostartfiles -fno-pic -o firmware.elf -Tkianv.ld firmware.S

.PHONY: clean
clean:
	rm -rf firmware.bin firmware.elf firmware.hex
