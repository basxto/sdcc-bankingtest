SDCCBIN?=
SDCPP?=$(SDCCBIN)sdcpp
SDCC?=$(SDCCBIN)sdcc
SDASGB?=$(SDCCBIN)sdasgb
MAKEBIN?=$(SDCCBIN)makebin

.PHONY:
build: romgb.gb

romgb.gb: romihx.ihx
	$(MAKEBIN) -yt 0x03 -yo 4 -ya 1 -Z $^ $@

romihx.ihx: main.rel rom.rel rom2.rel rom3.rel ram.rel trampoline.rel
	$(SDCC) -mgbz80 --data-loc 0xc0a0  -o $@ $^

# does not work
ram.rel: ram.c
	$(SDCC) -mgbz80 -c -o $@ $^ -ba4

rom2.rel: rom2.c
	$(SDCC) -mgbz80 -c -o $@ $^ -bo2

%.rel: 	%.c
	$(SDCC) -mgbz80 -c -o $@ $^

%.rel: 	%.s
	$(SDASGB) -plosgff -o $@ $^

.PHONY:
clean:
	rm -f *.ihx *.lst *.rel *.sym *.asm *.lk *.map *.noi