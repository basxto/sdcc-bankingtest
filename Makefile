SDCPP?=sdcpp
SDCC?=sdcc
SDASGB?=sdasgb
MAKEBIN?=makebin

.PHONY:
build: main.gb

%.gb: %.ihx
	$(MAKEBIN) -Z $^ $@

main.ihx: main.rel
	$(SDCC) -mgbz80 --data-loc 0xc0a0 -o $@ $^

%.rel: 	%.c
	$(SDCC) -mgbz80 -c $^

.PHONY:
clean:
	rm -f *.ihx *.lst *.rel *.sym *.asm *.s *.lk *.map