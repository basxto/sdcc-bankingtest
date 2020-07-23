SDCPP?=sdcpp
SDCC?=sdcc
SDASGB?=sdasgb
MAKEBIN?=makebin

.PHONY:
build: romgb.gb

romgb.gb: romihx.ihx
	$(MAKEBIN) -Z $^ $@

romihx.ihx: main.rel rom.rel rom2.rel rom3.rel ram.rel
	$(SDCC) -mgbz80 --data-loc 0xc0a0  -o $@ $^

# does not work
ram.rel: ram.c
	$(SDCC) -mgbz80 -c -o $@ $^ -ba4

rom2.rel: rom2.c
	$(SDCC) -mgbz80 -c -o $@ $^ -bo2

%.rel: 	%.c
	$(SDCC) -mgbz80 -c -o $@ $^

.PHONY:
clean:
	rm -f *.ihx *.lst *.rel *.sym *.asm *.s *.lk *.map *.noi