;	.page
;	.subttl 'declare 06/05/84'
dclver	=$0809		;************keep current mmdd
revnum	=$05		;*********** keep current revision number

;  assignments

addprc	=1
lenfor	=18		;length of a 'for' entry in the run-time stack
lengos	=5		;length of a 'gosub'....
buflen	=89		;ted input buffer size
bufpag	=2
stkend	=507
clmwid	=10		;print window 10 chars
pi	=255
numlev	=23
strsiz	=3
sperr	=$10
maxchr	=80
nwrap	=2 		;max # of physical lines per logical line
;	.page
;  i/o devices
;

acia	=$fd00		;6551 acia

xport	=$fd10		;6529 port

bnksel	=$fdd0		;switch paragraph for banking cartridges

ted	=$ff00

timr1l	=ted+0		;timer 1 is used to write to tape
timr1h	=ted+1
timr2l	=ted+2		;timer 2 used by serial(timeout)
timr2h	=ted+3		;dipole hunter
timr3l	=ted+4		;timer 3 used to read data bits
timr3h	=ted+5
tedvcr	=ted+6		;ted's video control register
keybrd	=ted+8
tedirq	=ted+9
tedicr	=ted+10
tedcrh	=ted+12		;high byte of ted cursor register
tedcrl	=ted+13		;low byte of ted cursor register
tedmlo	=ted+14		;start of ls bytes of sound freq. values
tedmhi	=ted+16		;start of ms 2 bits of sound freq. values
tedvoi	=ted+17		;ls nybble is vol, ms nybble is voice on/off bits
tedcbr	=ted+19		;character base
romon	=ted+62
romoff	=ted+63
cbrlsb	=$04		;lsb of character base in char. base reg


;  screen editor constants
;
llen	=40		;single line 40 columns
nlines	=25		;25 rows on screen
cr	=$0d  		;carriage return
lf	=$0a		;line feed
;	.page
;  basic zp storage
;

	.segment "s0" : zeropage

pdir	.res 1		;6510 port data dir reg
port	.res 1		;6510 internal i/o port
srchtk	.res 1		;token 'search' looks for (run-time stack)
zpvec1	.res 2		;temp (renumber)
zpvec2	.res 2		;temp (renumber)
integr
charac	.res 1
endchr	.res 1
trmpos	.res 1
verck	.res 1
count	.res 1
dimflg	.res 1
valtyp	.res 1
intflg	.res 1
garbfl
dores	.res 1
subflg	.res 1
inpflg	.res 1
domask
tansgn	.res 1
channl	.res 1
poker
linnum	.res 2
temppt	.res 1
lastpt	.res 2
tempst	.res 9
index
index1	.res 2
index2	.res 2
resho	.res 1
resmoh	.res 1
addend
resmo	.res 1
reslo	.res 1
	.res 1
txttab	.res 2
vartab	.res 2
arytab	.res 2
strend	.res 2
fretop	.res 2
frespc	.res 2
memsiz	.res 2
curlin	.res 2
txtptr	.res 2		;pointer to basic text used by chrget,etc.
form			;used by print using
fndpnt	.res 2		;pointer to item found by search
datlin	.res 2
datptr	.res 2
inpptr	.res 2
varnam	.res 2
fdecpt
varpnt	.res 2
lstpnt
andmsk
forpnt	.res 2
eormsk	=forpnt+1
vartxt
opptr	.res 2
opmask	.res 1
grbpnt
tempf3
defpnt	.res 2
dscpnt	.res 2
	.res 1
helper	.res 1		;flags 'help' or 'list'
jmper	.res 1
size	.res 1
oldov	.res 1

tempf1	.res 1
ptarg1	=tempf1		;multiply defined for instr
ptarg2	=tempf1+2
str1	=tempf1+4
str2	=tempf1+7
positn	=tempf1+10
match	=tempf1+11

temp	=tempf1		;multiply defined for graphic subs

arypnt
highds	.res 2
hightr	.res 2
tempf2
	.res 1
deccnt
lowds	.res 2
grbtop
dptflg
lowtr	.res 1
expsgn	.res 1
tenexp	=lowds+1
dsctmp
fac
facexp	.res 1
facho	.res 1
facmoh	.res 1
indice
facmo	.res 1
faclo	.res 1
facsgn	.res 1
degree
sgnflg	.res 1
bits	.res 1
argexp	.res 1
argho	.res 1
argmoh	.res 1
argmo	.res 1
arglo	.res 1
argsgn	.res 1
strng1
arisgn	.res 1
facov	.res 1

strng2
polypt
curtol
fbufpt	.res 2

autinc	.res 2		;inc. val for auto (0=off)
mvdflg	.res 1		;flag if 10k hires allocated

noze			;using's leading zero counter
keynum	.res 1

hulp			;counter
keysiz	.res 1

syntmp	.res 1		;used as temp for indirect loads
dsdesc	.res 3		;descriptor for ds$
tos	.res 2		;top of run time stack
tmpton	.res 2		;temps used by music (tone & vol)
voicno	.res 1
runmod	.res 1		;flags run/direct mode

parsts			;dos parser status word
point	.res 1		;using's pointer to dec.pt



;  graphic zp storage

graphm	.res 1		;current graphic mode
colsel	.res 1		;current color selected
mc1	.res 1		;multicolor1
fg	.res 1		;foreground color
scxmax	.res 1		;maximum # of columns
scymax	.res 1		;maximum # of rows
ltflag	.res 1		;paint-left flag
rtflag	.res 1		;paint-right flag
stopnb	.res 1		;stop paint if not background/not same color
grapnt	.res 2
vtemp1	.res 1
vtemp2	.res 1



;  kernal zp storage
;
	.segment "s90" : zeropage
status	.res 1		;i/o operation status byte
stkey	.res 1		;stop key flag
spverr	.res 1		;temporary
verfck	.res 1		;load or verify flag
c3p0	.res 1		;ieee buffered char flag
bsour	.res 1		;char buffer for ieee
xsav	.res 1		;temp for basin
ldtnd	.res 1		;index to logical file
dfltn	.res 1		;default input device #
dflto	.res 1		;default output device #
msgflg	.res 1		;os message flag
sal	.res 1
sah	.res 1
eal	.res 1
eah	.res 1
t1	.res 2		;temporary 1
t2	.res 2		;temporary 2
time	.res 3		;24 hour clock in 1/60th seconds
r2d2	.res 1		;serial bus usage
tpbyte	.res 1		;byte to be written/read on/off tape
bsour1	.res 1		;temp used by serial routine
sedeal			;temp. for scrolling
fpverr	.res 1
dcount	.res 1
fnlen	.res 1		;length current file n str
la	.res 1		;current file logical addr
sa	.res 1		;current file 2nd addr
fa	.res 1		;current file primary addr
fnadr	.res 2		;addr current file name str
errsum	.res 1
tmp0
stal	.res 1
stah	.res 1
memuss	.res 2		;load ram base
tapebs	.res 2		;base pointer to cass buffer
tmp2	.res 2
wrbase	.res 2		;pointer to data for tape writes
imparm	.res 2		;pointer to immediate string for primm
fetptr	.res 2		;pointer to byte to be fetched in banking fetchl routine

;  variables for screen editor
;
sedsal	.res 2		;temp. for scrolling
rvs	.res 1		;rvs field on flag
indx	.res 1
lsxp	.res 1		;x pos at start
lstp	.res 1
sfdx	.res 1		;shift mode on print
crsw	.res 1		;input vs get flag
pnt	.res 2		;pointer to row
pntr	.res 1		;pointer to column
qtsw	.res 1		;quote switch
sedt1	.res 1		;editor temp. use
tblx	.res 1
datax	.res 1
insrt	.res 1		;insert mode flag

	.res 25		;area for use by banking software
cirseg	.res 1		;degrees/circle-segment
user	.res 2		;screen editor color ip
keytab	.res 2		;keyscan table indirect
tmpkey	.res 1
ndx	.res 1		;index to keyboard q
stpflg	.res 1		;pause flag

;  monitor zp storage
;
t0	.res 2
chrptr	.res 1
bufend	.res 1



chksum	.res 1		;temp for checksum calc
length	.res 1
pass	.res 1		;which pass we're doing str
type	.res 1		;what type of block we're dealing with
usekdy	.res 1		;(b.7=1)=> use for wr, (b.6=1)=> use for rd
xstop	.res 1		;save x reg for quick stopkey test



curbnk	.res 1		;current bank configuration
xon	.res 1		;char to send for an x-on
xoff	.res 1		;char to send for an x-off
sedt2	.res 1		;editor temp. use



	.segment "sff"
lofbuf	.res 1
fbuffr	.res 16

savea	.res 1		;temp locations
savey	.res 1		;...for save & restore
savex	.res 1		;...for save & restore
colkey	.res 16		;default color/luminance table
sysstk			;bottom of system stack
;	.page
	.segment "s200"
buf	.res buflen	;basic/monitor buffer
oldlin	.res 2		;basic storage
oldtxt	.res 2		;basic storage

;  basic/dos interface vars
;
xcnt	.res 1		;dos loop counter

fnbufr	.res 16		;area for filename
dosf1l	.res 1		;dos filename 1 len
dosds1	.res 1		;dos disk drive 1
dosf1a	.res 2		;dos filename 1 addr

dosf2l	.res 1		;dos filename 2 len
dosds2	.res 1		;dos disk drive 2
dosf2a	.res 2		;dos filename 2 addr

dosla	.res 1		;dos logical addr
dosfa	.res 1		;dos phys addr
dossa	.res 1		;dos sec. addr

dosdid	.res 2		;dos dsk identif.
didchk	.res 1		;dos did flg

dosstr	.res 1		;dos output str. buf
dosspc	=*-fnbufr	;space used by dos rout.
	.res 48		;area to build dos string
;	.page
vwork			;graphics vars

xypos
xpos	.res 2		;current x position
ypos	.res 2		;current y position
dest
xdest	.res 2		;x-coordinate destination
ydest	.res 2		;y-coordinate destination

;  line drawing variables
;
xyabs
xabs	.res 2
yabs	.res 2
xysgn
xsgn	.res 2
ysgn	.res 2
fct
fct1	.res 2
fct2	.res 2
errval	.res 2
lesser	.res 1
greatr	.res 1

;  angle routine variables
;
angsgn	.res 1		;sign of angle
sinval	.res 2		;sine of value of angle
cosval	.res 2		;cosine of value of angle
angcnt	.res 2		;temps for angle distance routines
;	.page
;  the following 24 bytes are multiply defined, beginning on this
;  page, and continuing for the next 4 pages.

params	=*
	.res 1		;placeholder
bnr	.res 1		;pointer to begin. no.
enr	.res 1		;pointer to end no.
dolr	.res 1		;dollar flag
flag	.res 1		;comma flag
swe	.res 1		;counter
usgn	.res 1		;sign exponent
uexp	.res 1		;pointer to exponent
vn	.res 1		;# of digits before decimal point
chsn	.res 1		;justify flag
vf	.res 1		;# of pos before decimal point (field)
nf	.res 1		;# of pos after decimal point (field)
posp	.res 1		;+/- flag (field)
fesp	.res 1		;exponent flag (field)
etof	.res 1		;switch
cform	.res 1		;char counter (field)
sno	.res 1		;sign no
blfd	.res 1		;blank/star flag
begfd	.res 1		;pointer to begin of field
lfor	.res 1		;length of format
endfd	.res 1		;pointer to end of field
	.res 3		;placeholder
parend	=*
;	.page
;  general use parameters. (multiply defined with print using)

	.segment "params1"

xcentr	.res 2
ycentr	.res 2
xdist1	.res 2
ydist1	.res 2
xdist2	.res 2
ydist2	.res 2
disend
	.res 2  		;placeholder
colcnt	.res 1		;char's col. counter
rowcnt	.res 1
strcnt	.res 1


;  box drawing variables. (multiply defined with print using)

	.segment "params2"

xcord1	.res 2		;point 1 x-coord.
ycord1	.res 2		;point 1 y-coord.
boxang	.res 2		;rotation angle
xcount	.res 2
ycount	.res 2
bxleng	.res 2		;length of a side
xcord2	.res 2
ycord2	.res 2


;  circle drawing variables. (multiply defined with print using)

	.segment "params3"

xcircl	.res 2		;circle center, x coordinate
ycircl	.res 2		;circle center, y coordinate
xradus	.res 2		;x radius
yradus	.res 2		;y radius
rotang	.res 4		;rotation angle
angbeg	.res 2		;arc angle start
angend	.res 2		;arc angle end
xrcos	.res 2		;x radius * cos(rotation angle)
yrsin	.res 2		;y radius * sin(rotation angle)
xrsin	.res 2		;x radius * sin(rotation angle)
yrcos	.res 2		;y radius * cos(rotation angle)
;	.page
;  shape and move-shape variables (multiply defined with print using)

	.segment "params4"

	.res 1		;placeholder
keylen	.res 1
keynxt	.res 1
strsz	.res 1		;string len
gettyp	.res 1		;replace shape mode
strptr	.res 1		;string pos'n counter
oldbyt	.res 1		;old bit map byte
newbyt	.res 1		;new string or bit map byte
	.res 1  		;placeholder
xsize	.res 2		;shape column length
ysize	.res 2		;shape row length
xsave	.res 2		;temp for column length
stradr	.res 2		;save shape string descriptor
bitidx	.res 1		;bit index into byte
savsiz	.res 4		;temp work locations


	.segment "parend"

;  graphic variables
;
chrpag	.res 1		;high byte of address of char rom for 'char' command
bitcnt	.res 1		;temp for gshape
scalem	.res 1		;scale mode flag
width	.res 1		;double width flag
filflg	.res 1		;box fill flag
bitmsk	.res 1		;temp for bit mask
numcnt	.res 1
trcflg	.res 1		;flags trace mode


t3	.res 1
t4	.res 2
vtemp3	.res 1		;graphic temp storage
vtemp4	.res 1
vtemp5	.res 1


adray1	.res 2		;ptr to routine:  convert float -> integer
adray2	.res 2		;ptr to routine:  convert integer -> float
;	.page
	.segment "s2fe"

bnkvec	.res 2		;vector for function cart. users
ierror	.res 2		;indirect error (output error in .x)
imain	.res 2		;indirect main (system direct loop)
icrnch	.res 2		;indirect crunch (tokenization routine)
iqplop	.res 2		;indirect list (char list)
igone	.res 2		;indirect gone (char dispatch)
ieval	.res 2		;indirect eval (symbol evaluation)
iesclk	.res 2		;escape token crunch,
iescpr	.res 2		;..list,
iescex	.res 2		;..and execute
itime	.res 2		;60 hz interrupt vector (before jiffy)
cinv	.res 2		;irq ram vector
cbinv	.res 2		;brk instr ram vector
iopen	.res 2		;indirects for code
iclose	.res 2		;conforms to kernal spec 8/19/80
ichkin	.res 2
ickout	.res 2
iclrch	.res 2
ibasin	.res 2
ibsout	.res 2
istop	.res 2
igetin	.res 2
iclall	.res 2
usrcmd	.res 2
iload	.res 2
isave	.res 2		;savesp

	.res 1		;*******************************************available


tapbuf	.res 192		;cassette tape buffer
wrlen	.res 2		;length in 2's compl. of data to be written to cassette
rdcnt	.res 2		;length in 2's compl. of data to be read  from cassette

inpqln	=64		;length of rs232 input queue
inpque	.res inpqln
hiwatr	=$38		;x-off trip point
lowatr	=$08		;x-on trip point

estksz	=30		;size of cassette error stack
estakl	.res estksz	;low addr
estakh	.res estksz	;high addr

chrget	.res 6
chrgot	.res 12
qnum	.res 15



;  indirect load subroutine area
;
indsub	.res 14		;shared rom fetch sub
zero	.res 3		;numeric constant for basic, downloaded from rom

indtxt	.res 11		;txtptr
indin1	.res 11		;index & index1
indin2	.res 11		;index2
indst1	.res 11		;strng1
indlow	.res 11		;lowtr
indfmo	.res 11		;facmo



;  declarations for print using
;
puchrs
pufill	.res 1		;print using fill symbol
pucoma	.res 1		;print using comma symbol
pudot	.res 1		;print using d.p. symbol
pumony	.res 1		;print using monetary symbol

tmpdes	.res 4		;temp for instr

errnum	.res 1		;used by error trapping routine-last error number
errlin	.res 2		;line # of last error - ffff if no error
trapno	.res 2		;line to go to on error.. ffxx if none set
tmptrp	.res 1		;hold trap # tempor.
errtxt	.res 2
oldstk	.res 1

tmptxt	.res 2		;used by do-loop. could be mult. assigned
tmplin	.res 2

mtimlo	.res 2		;table of pending jiffies till turnoff (in 2's comp)
mtimhi	.res 2
usrpok	.res 3
rndx	.res 5

dejavu	.res 1		;'cold' or 'warm' reset status (must be in page 5!)



;  tables for open files
;
lat	.res 10		;logical file numbers
fat	.res 10		;primary device numbers
sat	.res 10		;secondary addresses


;  system storage
;
keyd	.res 10		;irq keyboard buffer
memstr	.res 2		;start of memory
msiz	.res 2		;top of memory
timout	.res 1		;ieee timeout flag


;  cassette declarations...
;
filend	.res 1		;filend reached::=1, 0 otherwise
ctally	.res 1		;#of chars left in buffer (for r&w)
cbufva	.res 1		;#of total valid chars in buffer (for r.o.)
tptr	.res 1		;pointer to next chr in buffer (for r&w)
fltype	.res 1		;contains type of current cass file
bufmax	=191		;size of the buffer for data entries (excluding type)
;
;  tape block types
;
eot	=5  		;end of tape
blf	=1  		;basic load file
bdf	=2  		;basic data file
plf	=3  		;fixed program type
bdfh	=4 		;basic data file header



;  screen editor storage
;
color	.res 1		;active attribute byte
flash	.res 1		;character flash flag
	.res 1		;*******************************************available
hibase	.res 1		;base location of screen (top)
xmax	.res 1
rptflg	.res 1		;key repeat flag
kount	.res 1
delay	.res 1
shflag	.res 1		;shift flag byte
lstshf	.res 1		;last shift pattern
keylog	.res 2		;indirect for keyboard table setup
mode	.res 1
autodn	.res 1		;auto scroll down flag(=0 on,<>0 off)
lintmp	.res 1
rolflg	.res 1



;  monitor non-zp storage
;
format	.res 1
msal	.res 3
wrap	.res 1
tmpc	.res 1
diff	.res 1
pch	.res 1
pcl	.res 1
flgs	.res 1
acc	.res 1
xr	.res 1
yr	.res 1
sp	.res 1
invl	.res 1
invh	.res 1
cmpflg	.res 1		;used by various monitor routines
bad	.res 1

kyndx	.res 1		;used for programmable keys
keyidx	.res 1
keybuf	.res 8		;table of p.f. lengths
maxkys	=128
pkybuf	.res maxkys	;p.f. key storage area


;  kennedy interface variables...
;
kdata	.res 1		;temp for data write to kennedy
kdycmd	.res 1		;select for kennedy rd or wr
kdynum	.res 1		;kennedy's dev#
kdyprs	.res 1		;kennedy present::=$ff, else::=$00
kdytyp	.res 1		;temp stor. for type of open for kdy
;
;  and constants...
;
tedrva	=$fef0
tedrvb	=$fef1
tedrvc	=$fef2
drva2	=$fef3
drvb2	=$fef4
drvc2	=$fef5

italk	=$40		;ieee talk
ilstn	=$20		;listen
iutalk	=$5f		;untalk
iulstn	=$3f		;unlisten

kcmd1	=$81		;state change
kcmd2	=$82		;sec. addr
kcmd3	=$83		;dout
kcmd4	=$84		;din



savram	.res 256		;1 page used by banking routines
pat	=savram		;physical address table for banking
lngjmp	=savram+4	;long jump address for banking 'long' routine
fetarg	=savram+6	;storage for long jumps
fetxrg	=savram+7
fetsrg	=savram+8

stktop	.res 196		;basic run-time stack
stkbot	=*


;  cassette primitive r&w variables
;
typenb			;doubly defined
wrout	.res 1		;byte to be written on tape

parity	.res 1		;temp for parity calc
tt1	.res 1		;temp for write-header
tt2	.res 1		;temp for write-header
	.res 1		;*************************************available
rdbits	.res 1		;local index for readbyte routine
errsp	.res 1		;pointer to the current entry in the error stack
fperrs	.res 1		;number of first pass errors
;
; *** don't ever re-order the following 3 variables !!! ***
;
dsamp1	.res 2		;time constant for x cell sample
dsamp2	.res 2		;time constant for y cell sample
zcell	.res 2		;time constant for z cell verify

srecov	.res 1		;stack marker for stopkey recover
drecov	.res 1		;stack marker for dropout recover
trsave	.res 4		;parmeters passed to rdblok
rdetmp	.res 1		;temp stat save for rdblok
ldrscn	.res 1		;#consec. shorts to find in leader
cderrm	.res 1		;#errors fatal in rd countdown
vsave	.res 1		;temp for verify command
t1pipe	.res 4		;pipe temp for t1
enext	.res 1		;read error propagate



;  for rs-232...
;
uoutq	.res 1		;user char to send
uoutfg	.res 1		;0::=empty, 1::=full
soutq	.res 1		;system char to send
soutfg	.res 1		;0::=empty, 1::=full
inqfpt	.res 1		;ptr to front of input queue
inqrpt	.res 1		;ptr to rear of input queue
inqcnt	.res 1		;# of chars in input queue
astat	.res 1		;temp ststus word for the acia
aintmp	.res 1		;temp for input routine
alstop	.res 1		;flg to indicate if we're paused locally
arstop	.res 1		;flg to indicate if remote is paused
apres	.res 1		;flg to indicate if acia in system



;  indirect routine downloaded here...
;
kludes	.res 12
sinner	=kludes+6


scbot	.res 1
sctop	.res 1
sclf	.res 1
scrt	.res 1
scrdis	.res 1
insflg	.res 1
lstchr	.res 1
logscr	.res 1
tcolor	.res 1
bitabl	.res 4


sareg	.res 1		;reg's for sys command
sxreg	.res 1
syreg	.res 1
spreg	.res 1

lstx	.res 1		;key scan index
stpdsb	.res 1		;flag to disable ctl-s pause
ramrom	.res 1		;msb flags monitor fetches from ram (0) or rom (1)
colsw	.res 1		;msb flags color/lum. table in ram (0) or rom (1)
ffrmsk	.res 1		;rom mask (split screen)
vmbmsk	.res 1		;v.m. base mask (split screen)
lsem	.res 1		;motor lock semaphore for cassette (**02/08/84)
palcnt	.res 1		;pal tod (**02/17/84)


tedatr	=$0800		;ted attribute bytes
tedscn	=$0c00		;ted character pointers
basbgn	=$1000
grbase	=$2000		;graphic base is the same as basic beginning
bmcolr	=$1c00
bmlum	=$1800
chrbas	=$d000		;beginning of 'character rom'

;end
