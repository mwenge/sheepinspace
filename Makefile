.PHONY: all clean run

D64_IMAGE = "bin/sheepinspace.d64"
D64_ORIG_IMAGE = "orig/sheepinspace.d64"
X64 = x64
X64SC = x64sc
C1541 = c1541

all: clean d64 run
original: clean d64_orig run_orig

sheepinspace.prg: src/sheepinspace.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/sheepinspace.prg -L bin/list-co1.txt -l bin/labels.txt src/sheepinspace.asm
	md5sum bin/sheepinspace.prg orig/sheepinspace.prg

d64: sheepinspace.prg
	$(C1541) -format "sheepinspace,rq" d64 $(D64_IMAGE)
	$(C1541) $(D64_IMAGE) -write bin/sheepinspace.prg "sheepinspace"
	$(C1541) $(D64_IMAGE) -list

d64_orig:
	$(C1541) -format "sheepinspace,rq" d64 $(D64_ORIG_IMAGE)
	$(C1541) $(D64_ORIG_IMAGE) -write orig/sheepinspace.prg "sheepinspace"
	$(C1541) $(D64_ORIG_IMAGE) -list

run: d64
	$(X64) -verbose $(D64_IMAGE)

run_orig:
	$(X64) -verbose -moncommands bin/labels.txt $(D64_ORIG_IMAGE)

run: d64

clean:
	-rm $(D64_IMAGE) $(D64_ORIG_IMAGE) $(D64_HOKUTO_IMAGE)
	-rm bin/sheepinspace.prg
	-rm bin/*.txt
