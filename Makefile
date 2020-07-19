SDCPP?=sdcpp
SDCC?=sdcc
SDASGB?=sdasgb
MAKEBIN?=makebin

.PHONY:
build: romgb.gb

romgb.gb: romihx.ihx
	$(MAKEBIN) -Z $^ $@

romihx.ihx: main.rel rom.rel rom2.rel
	$(SDCC) -mgbz80 --data-loc 0xc0a0 -Wl-b_BANK1=0x14000 -Wl-b_BANK2=0x24000 -o $@ $^

%.rel: 	%.c
	$(SDCC) -mgbz80 -c -o $@ $^

.PHONY:
clean:
	rm -f *.ihx *.lst *.rel *.sym *.asm *.s *.lk *.map *.noi