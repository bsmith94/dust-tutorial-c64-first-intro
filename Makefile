#
#
# Build the dust tutorial.
#
#

# copy make.defs.sample to make.defs and edit the paths
include make.defs

CLEAN=rm -rf
MKDIR=mkdir -p

BUILD=hello_world
PROG_PRG=$(BUILD).prg
PROG_CBM=$(BUILD).cbm

BUILDPATH=build
SOURCE=index.asm
INCLUDEPATH=code
INCLUDES= \
	$(INCLUDEPATH)/data_colorwash.asm \
	$(INCLUDEPATH)/data_static_text.asm \
	$(INCLUDEPATH)/init_clear_screen.asm \
	$(INCLUDEPATH)/init_static_text.asm \
	$(INCLUDEPATH)/load_resources.asm \
	$(INCLUDEPATH)/main.asm \
	$(INCLUDEPATH)/setup_symbols.asm \
	$(INCLUDEPATH)/sub_colorwash.asm \
	$(INCLUDEPATH)/sub_music.asm

RESOURCESPATH=resources
RESOURCES=$(RESOURCESPATH)/jeff_donald.sid

all:: dirs compile crunch

dirs: $(BUILDPATH)

$(BUILDPATH):
	$(MKDIR) $@

clean:
	$(CLEAN) $(BUILDPATH)

compile: $(BUILDPATH)/$(PROG_CBM)

$(BUILDPATH)/$(PROG_CBM): $(SOURCE) $(INCLUDES) $(RESOURCES)
	$(ACMEPATH)/acme \
		-r $(BUILDPATH)/buildreport \
		--vicelabels $(BUILDPATH)/labels \
		--msvc \
		--color \
		--format cbm \
		-v3 \
		--outfile $@ \
		$<

crunch: $(BUILDPATH)/$(PROG_PRG)

$(BUILDPATH)/$(PROG_PRG): $(BUILDPATH)/$(PROG_CBM)
	$(CRUNCHERPATH)/pucrunch \
		-x0x0801 \
		-c64 \
		-g55 \
		-fshort $< \
		$@

run: $(BUILDPATH)/$(PROG_PRG)
	$(EMULATORPATH)/x64 $(EMULATORARGS) $<
