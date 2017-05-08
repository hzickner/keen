# Makefile for kdreams.exe

CC = bcc
CFLAGS = -IC:\BC2\INCLUDE -c -mm

LD = bcc
LDFLAGS = -LC:\BC2\LIB -mm

AS = tasm
ASFLAGS = /mx /o

OBJS = kd_main.obj kd_demo.obj kd_play.obj kd_keen.obj kd_act1.obj kd_act2.obj \
 gelib.obj jam_io.obj soft.obj lzhuf.obj id_mm.obj id_ca.obj id_vw.obj id_vw_a.obj \
 id_rf.obj id_rf_a.obj id_in.obj id_sd.obj id_us.obj id_us_a.obj kdredict.obj \
 kdrehead.obj kdrmdict.obj kdrmhead.obj kdradict.obj kdrahead.obj context.obj\
 gametext.obj story.obj

all: kdreams.exe

clean:
	del *.exe
	del *.obj

kdreams.exe: $(OBJS)
	$(LD) @&&!
$(LDFLAGS) -ekdreams.exe $(OBJS)
!

makeobj.exe: static/makeobj.c
	$(CC) static/makeobj.c

kdredict.obj: makeobj.exe static/EGADICT.KDR
	makeobj c static\EGADICT.KDR kdredict.obj _EGAdict
	
kdrehead.obj: makeobj.exe static/EGAHEAD.KDR
	makeobj f static\EGAHEAD.KDR kdrehead.obj EGA_grafixheader _EGAhead

kdrmdict.obj: makeobj.exe static/MAPDICT.KDR
	makeobj c static\MAPDICT.KDR kdrmdict.obj _mapdict
	
kdrmhead.obj: makeobj.exe static/MAPHEAD.KDR
	makeobj f static\MAPHEAD.KDR kdrmhead.obj MapHeader _maphead
	
kdradict.obj: makeobj.exe static/AUDIODCT.KDR
	makeobj c static\AUDIODCT.KDR kdradict.obj _audiodict
	
kdrahead.obj: makeobj.exe static/AUDIOHHD.KDR
	makeobj f static\AUDIOHHD.KDR kdrahead.obj _AudioHeader _audiohead

context.obj: makeobj.exe static/CONTEXT.KDR
	makeobj f static\CONTEXT.KDR context.obj

gametext.obj: makeobj.exe static/GAMETEXT.KDR
	makeobj f static\GAMETEXT.KDR gametext.obj

story.obj: makeobj.exe static/STORY.KDR
	makeobj f static\STORY.KDR story.obj
	
.c.obj:
	$(CC) $(CFLAGS) $<
	
.asm.obj:
	del $*.obj
	$(AS) $(ASFLAGS) $<,$*.obj	
	
kd_main.obj: kd_main.c
kd_demo.obj: kd_demo.c
kd_play.obj: kd_play.c
kd_keen.obj: kd_keen.c
kd_act1.obj: kd_act1.c
kd_act2.obj: kd_act2.c
gelib.obj: gelib.c
jam_io.obj: jam_io.c
soft.obj: soft.c
lzhuf.obj: lzhuf.c
id_mm.obj: id_mm.c
id_ca.obj: id_ca.c
id_vw.obj: id_vw.c
id_vw_a.obj: id_vw_a.asm
id_rf.obj: id_rf.c
id_rf_a.obj: id_rf_a.asm
id_in.obj: id_in.c
id_sd.obj: id_sd.c
id_us.obj: id_us.c
id_us_a.obj: id_us_a.asm

