GAME=diskmag
ZIP_NAME=FDS-Diskmag
ASSEMBLER=ca65
LINKER=ld65

CAFLAGS = -g

DEBUG=0 # Will be overriden by variable set in `make` command line
ifeq ($(DEBUG),1)
CAFLAGS += -D DEBUG=1
endif

OBJ_FILES=$(GAME).o

all: $(GAME).fds

$(GAME).fds: $(OBJ_FILES) fds.cfg
	$(LINKER) -o $(GAME).fds -C fds.cfg $(OBJ_FILES) -m $(GAME).map.txt -Ln $(GAME).labels.txt --dbgfile $(GAME).dbg

dist: zip
zip: $(ZIP_NAME).zip
$(ZIP_NAME).zip: zip.in
	zip -9 -u $@ -@ < $<

zip.in: $(GAME).fds
	echo $(GAME).fds > $@
	echo README.md >> $@

.PHONY: clean dist zip

clean:
	$(RM) *.o *.fds *.dbg *.nl *.map.txt *.labels.txt *.zip Screens/dte

$(GAME).o: $(wildcard *.asm) $(wildcard Articles/*.asm) $(wildcard Music/*.asm) $(wildcard SabreFiles/*.asm) Jroatch-chr-sheet.chr Screens/intro.nam.out Screens/scroller.dte

%.o:%.asm
	$(ASSEMBLER) $(CAFLAGS) $< -o $@

Screens/dte: Screens/dte.c
	gcc -O2 Screens/dte.c -o Screens/dte

Screens/intro.nam.out: Screens/intro.nam
	go run Screens/vramstruct.go Screens/intro.nam 2000

Screens/scroller.dte: Screens/scroller.txt Screens/dte
	Screens/dte -r 0x80-0xff -e 0x00-0x1f -f Screens/scroller.txt Screens/scroller.dte Screens/scroller.dtdict


