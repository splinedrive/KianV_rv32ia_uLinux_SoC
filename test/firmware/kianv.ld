/* Linker script for programs stored in SPI flash */
/* Inspired from picorv32/picosoc/sections.lds    */
/*                                                */
/* text sections are sent to BRAM                 */
/* rodata sections are sent to flash              */
/* bss sections are sent to BRAM                  */
/* data sections are sent to BRAM and have        */
/*  initialization data in flash.                 */
/* AT keyword specifies LMA (Load Memory Address) */
/*                                                */
/* If you got a lot of code that does not fit in  */
/* RAM, you may keep text sections in flash using */
/*   spiflash_icebreaker_run_from_flash.ld        */


MEMORY {
  FLASH      (rx)  : ORIGIN = 0x020100000, LENGTH = 0x10000000
}
