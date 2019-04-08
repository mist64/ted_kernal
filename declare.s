	.page
	.subttl 'declare 06/05/84'
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
	.page
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
	.page
;  basic zp storage
;

	*=0

pdir	*=*+1		;6510 port data dir reg
port	*=*+1		;6510 internal i/o port
srchtk	*=*+1		;token 'search' looks for (run-time stack)
zpvec1	*=*+2		;temp (renumber)
zpvec2	*=*+2		;temp (renumber)
integr
charac	*=*+1
endchr	*=*+1
trmpos	*=*+1
verck	*=*+1
count	*=*+1
dimflg	*=*+1
valtyp	*=*+1
intflg	*=*+1
garbfl
dores	*=*+1
subflg	*=*+1
inpflg	*=*+1
domask
tansgn	*=*+1
channl	*=*+1
poker
linnum	*=*+2
temppt	*=*+1
lastpt	*=*+2
tempst	*=*+9
index
index1	*=*+2
index2	*=*+2
resho	*=*+1
resmoh	*=*+1
addend
resmo	*=*+1
reslo	*=*+1
	*=*+1
txttab	*=*+2
vartab	*=*+2
arytab	*=*+2
strend	*=*+2
fretop	*=*+2
frespc	*=*+2
memsiz	*=*+2
curlin	*=*+2
txtptr	*=*+2		;pointer to basic text used by chrget,etc.
form			;used by print using
fndpnt	*=*+2		;pointer to item found by search
datlin	*=*+2
datptr	*=*+2
inpptr	*=*+2
varnam	*=*+2
fdecpt
varpnt	*=*+2
lstpnt
andmsk
forpnt	*=*+2
eormsk	=forpnt+1
vartxt
opptr	*=*+2
opmask	*=*+1
grbpnt
tempf3
defpnt	*=*+2
dscpnt	*=*+2
	*=*+1
helper	*=*+1		;flags 'help' or 'list'
jmper	*=*+1
size	*=*+1
oldov	*=*+1

tempf1	*=*+1
ptarg1	=tempf1		;multiply defined for instr
ptarg2	=tempf1+2
str1	=tempf1+4
str2	=tempf1+7
positn	=tempf1+10
match	=tempf1+11

temp	=tempf1		;multiply defined for graphic subs

arypnt
highds	*=*+2
hightr	*=*+2
tempf2
	*=*+1
deccnt
lowds	*=*+2
grbtop
dptflg
lowtr	*=*+1
expsgn	*=*+1
tenexp	=lowds+1
dsctmp
fac
facexp	*=*+1
facho	*=*+1
facmoh	*=*+1
indice
facmo	*=*+1
faclo	*=*+1
facsgn	*=*+1
degree
sgnflg	*=*+1
bits	*=*+1
argexp	*=*+1
argho	*=*+1
argmoh	*=*+1
argmo	*=*+1
arglo	*=*+1
argsgn	*=*+1
strng1
arisgn	*=*+1
facov	*=*+1

strng2
polypt
curtol
fbufpt	*=*+2

autinc	*=*+2		;inc. val for auto (0=off)
mvdflg	*=*+1		;flag if 10k hires allocated

noze			;using's leading zero counter
keynum	*=*+1

hulp			;counter
keysiz	*=*+1

syntmp	*=*+1		;used as temp for indirect loads
dsdesc	*=*+3		;descriptor for ds$
tos	*=*+2		;top of run time stack
tmpton	*=*+2		;temps used by music (tone & vol)
voicno	*=*+1
runmod	*=*+1		;flags run/direct mode

parsts			;dos parser status word
point	*=*+1		;using's pointer to dec.pt



;  graphic zp storage

graphm	*=*+1		;current graphic mode
colsel	*=*+1		;current color selected
mc1	*=*+1		;multicolor1
fg	*=*+1		;foreground color
scxmax	*=*+1		;maximum # of columns
scymax	*=*+1		;maximum # of rows
ltflag	*=*+1		;paint-left flag
rtflag	*=*+1		;paint-right flag
stopnb	*=*+1		;stop paint if not background/not same color
grapnt	*=*+2
vtemp1	*=*+1
vtemp2	*=*+1



;  kernal zp storage
;
	*=$90
status	*=*+1		;i/o operation status byte
stkey	*=*+1		;stop key flag
spverr	*=*+1		;temporary
verfck	*=*+1		;load or verify flag
c3p0	*=*+1		;ieee buffered char flag
bsour	*=*+1		;char buffer for ieee
xsav	*=*+1		;temp for basin
ldtnd	*=*+1		;index to logical file
dfltn	*=*+1		;default input device #
dflto	*=*+1		;default output device #
msgflg	*=*+1		;os message flag
sal	*=*+1
sah	*=*+1
eal	*=*+1
eah	*=*+1
t1	*=*+2		;temporary 1
t2	*=*+2		;temporary 2
time	*=*+3		;24 hour clock in 1/60th seconds
r2d2	*=*+1		;serial bus usage
tpbyte	*=*+1		;byte to be written/read on/off tape
bsour1	*=*+1		;temp used by serial routine
sedeal			;temp. for scrolling
fpverr	*=*+1
dcount	*=*+1
fnlen	*=*+1		;length current file n str
la	*=*+1		;current file logical addr
sa	*=*+1		;current file 2nd addr
fa	*=*+1		;current file primary addr
fnadr	*=*+2		;addr current file name str
errsum	*=*+1
tmp0
stal	*=*+1
stah	*=*+1
memuss	*=*+2		;load ram base
tapebs	*=*+2		;base pointer to cass buffer
tmp2	*=*+2
wrbase	*=*+2		;pointer to data for tape writes
imparm	*=*+2		;pointer to immediate string for primm
fetptr	*=*+2		;pointer to byte to be fetched in banking fetchl routine

;  variables for screen editor
;
sedsal	*=*+2		;temp. for scrolling
rvs	*=*+1		;rvs field on flag
indx	*=*+1
lsxp	*=*+1		;x pos at start
lstp	*=*+1
sfdx	*=*+1		;shift mode on print
crsw	*=*+1		;input vs get flag
pnt	*=*+2		;pointer to row
pntr	*=*+1		;pointer to column
qtsw	*=*+1		;quote switch
sedt1	*=*+1		;editor temp. use
tblx	*=*+1
datax	*=*+1
insrt	*=*+1		;insert mode flag

	*=*+25		;area for use by banking software
cirseg	*=*+1		;degrees/circle-segment
user	*=*+2		;screen editor color ip
keytab	*=*+2		;keyscan table indirect
tmpkey	*=*+1
ndx	*=*+1		;index to keyboard q
stpflg	*=*+1		;pause flag

;  monitor zp storage
;
t0	*=*+2
chrptr	*=*+1
bufend	*=*+1



chksum	*=*+1		;temp for checksum calc
length	*=*+1
pass	*=*+1		;which pass we're doing str
type	*=*+1		;what type of block we're dealing with
usekdy	*=*+1		;(b.7=1)=> use for wr, (b.6=1)=> use for rd
xstop	*=*+1		;save x reg for quick stopkey test



curbnk	*=*+1		;current bank configuration
xon	*=*+1		;char to send for an x-on
xoff	*=*+1		;char to send for an x-off
sedt2	*=*+1		;editor temp. use



	*=$ff
lofbuf	*=*+1
fbuffr	*=*+16

savea	*=*+1		;temp locations
savey	*=*+1		;...for save & restore
savex	*=*+1		;...for save & restore
colkey	*=*+16		;default color/luminance table
sysstk			;bottom of system stack
	.page
	*=$200
buf	*=*+buflen	;basic/monitor buffer
oldlin	*=*+2		;basic storage
oldtxt	*=*+2		;basic storage

;  basic/dos interface vars
;
xcnt	*=*+1		;dos loop counter

fnbufr	*=*+16		;area for filename
dosf1l	*=*+1		;dos filename 1 len
dosds1	*=*+1		;dos disk drive 1
dosf1a	*=*+2		;dos filename 1 addr

dosf2l	*=*+1		;dos filename 2 len
dosds2	*=*+1		;dos disk drive 2
dosf2a	*=*+2		;dos filename 2 addr

dosla	*=*+1		;dos logical addr
dosfa	*=*+1		;dos phys addr
dossa	*=*+1		;dos sec. addr

dosdid	*=*+2		;dos dsk identif.
didchk	*=*+1		;dos did flg

dosstr	*=*+1		;dos output str. buf
dosspc	=*-fnbufr	;space used by dos rout.
	*=*+48		;area to build dos string
	.page
vwork			;graphics vars

xypos
xpos	*=*+2		;current x position
ypos	*=*+2		;current y position
dest
xdest	*=*+2		;x-coordinate destination
ydest	*=*+2		;y-coordinate destination

;  line drawing variables
;
xyabs
xabs	*=*+2
yabs	*=*+2
xysgn
xsgn	*=*+2
ysgn	*=*+2
fct
fct1	*=*+2
fct2	*=*+2
errval	*=*+2
lesser	*=*+1
greatr	*=*+1

;  angle routine variables
;
angsgn	*=*+1		;sign of angle
sinval	*=*+2		;sine of value of angle
cosval	*=*+2		;cosine of value of angle
angcnt	*=*+2		;temps for angle distance routines
	.page
;  the following 24 bytes are multiply defined, beginning on this
;  page, and continuing for the next 4 pages.

params	=*
	*=*+1		;placeholder
bnr	*=*+1		;pointer to begin. no.
enr	*=*+1		;pointer to end no.
dolr	*=*+1		;dollar flag
flag	*=*+1		;comma flag
swe	*=*+1		;counter
usgn	*=*+1		;sign exponent
uexp	*=*+1		;pointer to exponent
vn	*=*+1		;# of digits before decimal point
chsn	*=*+1		;justify flag
vf	*=*+1		;# of pos before decimal point (field)
nf	*=*+1		;# of pos after decimal point (field)
posp	*=*+1		;+/- flag (field)
fesp	*=*+1		;exponent flag (field)
etof	*=*+1		;switch
cform	*=*+1		;char counter (field)
sno	*=*+1		;sign no
blfd	*=*+1		;blank/star flag
begfd	*=*+1		;pointer to begin of field
lfor	*=*+1		;length of format
endfd	*=*+1		;pointer to end of field
	*=*+3		;placeholder
parend	=*
	.page
;  general use parameters. (multiply defined with print using)

	*=params

xcentr	*=*+2
ycentr	*=*+2
xdist1	*=*+2
ydist1	*=*+2
xdist2	*=*+2
ydist2	*=*+2
disend
	*=*+2  		;placeholder
colcnt	*=*+1		;char's col. counter
rowcnt	*=*+1
strcnt	*=*+1


;  box drawing variables. (multiply defined with print using)

	*=params

xcord1	*=*+2		;point 1 x-coord.
ycord1	*=*+2		;point 1 y-coord.
boxang	*=*+2		;rotation angle
xcount	*=*+2
ycount	*=*+2
bxleng	*=*+2		;length of a side
xcord2	*=*+2
ycord2	*=*+2


;  circle drawing variables. (multiply defined with print using)

	*=params

xcircl	*=*+2		;circle center, x coordinate
ycircl	*=*+2		;circle center, y coordinate
xradus	*=*+2		;x radius
yradus	*=*+2		;y radius
rotang	*=*+4		;rotation angle
angbeg	*=*+2		;arc angle start
angend	*=*+2		;arc angle end
xrcos	*=*+2		;x radius * cos(rotation angle)
yrsin	*=*+2		;y radius * sin(rotation angle)
xrsin	*=*+2		;x radius * sin(rotation angle)
yrcos	*=*+2		;y radius * cos(rotation angle)
	.page
;  shape and move-shape variables (multiply defined with print using)

	*=params

	*=*+1		;placeholder
keylen	*=*+1
keynxt	*=*+1
strsz	*=*+1		;string len
gettyp	*=*+1		;replace shape mode
strptr	*=*+1		;string pos'n counter
oldbyt	*=*+1		;old bit map byte
newbyt	*=*+1		;new string or bit map byte
	*=*+1  		;placeholder
xsize	*=*+2		;shape column length
ysize	*=*+2		;shape row length
xsave	*=*+2		;temp for column length
stradr	*=*+2		;save shape string descriptor
bitidx	*=*+1		;bit index into byte
savsiz	*=*+4		;temp work locations


	*=parend

;  graphic variables
;
chrpag	*=*+1		;high byte of address of char rom for 'char' command
bitcnt	*=*+1		;temp for gshape
scalem	*=*+1		;scale mode flag
width	*=*+1		;double width flag
filflg	*=*+1		;box fill flag
bitmsk	*=*+1		;temp for bit mask
numcnt	*=*+1
trcflg	*=*+1		;flags trace mode


t3	*=*+1
t4	*=*+2
vtemp3	*=*+1		;graphic temp storage
vtemp4	*=*+1
vtemp5	*=*+1


adray1	*=*+2		;ptr to routine:  convert float -> integer
adray2	*=*+2		;ptr to routine:  convert integer -> float
	.page
	*=$2fe

bnkvec	*=*+2		;vector for function cart. users
ierror	*=*+2		;indirect error (output error in .x)
imain	*=*+2		;indirect main (system direct loop)
icrnch	*=*+2		;indirect crunch (tokenization routine)
iqplop	*=*+2		;indirect list (char list)
igone	*=*+2		;indirect gone (char dispatch)
ieval	*=*+2		;indirect eval (symbol evaluation)
iesclk	*=*+2		;escape token crunch,
iescpr	*=*+2		;..list,
iescex	*=*+2		;..and execute
itime	*=*+2		;60 hz interrupt vector (before jiffy)
cinv	*=*+2		;irq ram vector
cbinv	*=*+2		;brk instr ram vector
iopen	*=*+2		;indirects for code
iclose	*=*+2		;conforms to kernal spec 8/19/80
ichkin	*=*+2
ickout	*=*+2
iclrch	*=*+2
ibasin	*=*+2
ibsout	*=*+2
istop	*=*+2
igetin	*=*+2
iclall	*=*+2
usrcmd	*=*+2
iload	*=*+2
isave	*=*+2		;savesp

	*=*+1		;*******************************************available


tapbuf	*=*+192		;cassette tape buffer
wrlen	*=*+2		;length in 2's compl. of data to be written to cassette
rdcnt	*=*+2		;length in 2's compl. of data to be read  from cassette

inpqln	=64		;length of rs232 input queue
inpque	*=*+inpqln
hiwatr	=$38		;x-off trip point
lowatr	=$08		;x-on trip point

estksz	=30		;size of cassette error stack
estakl	*=*+estksz	;low addr
estakh	*=*+estksz	;high addr

chrget	*=*+6
chrgot	*=*+12
qnum	*=*+15



;  indirect load subroutine area
;
indsub	*=*+14		;shared rom fetch sub
zero	*=*+3		;numeric constant for basic, downloaded from rom

indtxt	*=*+11		;txtptr
indin1	*=*+11		;index & index1
indin2	*=*+11		;index2
indst1	*=*+11		;strng1
indlow	*=*+11		;lowtr
indfmo	*=*+11		;facmo



;  declarations for print using
;
puchrs
pufill	*=*+1		;print using fill symbol
pucoma	*=*+1		;print using comma symbol
pudot	*=*+1		;print using d.p. symbol
pumony	*=*+1		;print using monetary symbol

tmpdes	*=*+4		;temp for instr

errnum	*=*+1		;used by error trapping routine-last error number
errlin	*=*+2		;line # of last error - ffff if no error
trapno	*=*+2		;line to go to on error.. ffxx if none set
tmptrp	*=*+1		;hold trap # tempor.
errtxt	*=*+2
oldstk	*=*+1

tmptxt	*=*+2		;used by do-loop. could be mult. assigned
tmplin	*=*+2

mtimlo	*=*+2		;table of pending jiffies till turnoff (in 2's comp)
mtimhi	*=*+2
usrpok	*=*+3
rndx	*=*+5

dejavu	*=*+1		;'cold' or 'warm' reset status (must be in page 5!)



;  tables for open files
;
lat	*=*+10		;logical file numbers
fat	*=*+10		;primary device numbers
sat	*=*+10		;secondary addresses


;  system storage
;
keyd	*=*+10		;irq keyboard buffer
memstr	*=*+2		;start of memory
msiz	*=*+2		;top of memory
timout	*=*+1		;ieee timeout flag


;  cassette declarations...
;
filend	*=*+1		;filend reached::=1, 0 otherwise
ctally	*=*+1		;#of chars left in buffer (for r&w)
cbufva	*=*+1		;#of total valid chars in buffer (for r.o.)
tptr	*=*+1		;pointer to next chr in buffer (for r&w)
fltype	*=*+1		;contains type of current cass file
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
color	*=*+1		;active attribute byte
flash	*=*+1		;character flash flag
	*=*+1		;*******************************************available
hibase	*=*+1		;base location of screen (top)
xmax	*=*+1
rptflg	*=*+1		;key repeat flag
kount	*=*+1
delay	*=*+1
shflag	*=*+1		;shift flag byte
lstshf	*=*+1		;last shift pattern
keylog	*=*+2		;indirect for keyboard table setup
mode	*=*+1
autodn	*=*+1		;auto scroll down flag(=0 on,<>0 off)
lintmp	*=*+1
rolflg	*=*+1



;  monitor non-zp storage
;
format	*=*+1
msal	*=*+3
wrap	*=*+1
tmpc	*=*+1
diff	*=*+1
pch	*=*+1
pcl	*=*+1
flgs	*=*+1
acc	*=*+1
xr	*=*+1
yr	*=*+1
sp	*=*+1
invl	*=*+1
invh	*=*+1
cmpflg	*=*+1		;used by various monitor routines
bad	*=*+1

kyndx	*=*+1		;used for programmable keys
keyidx	*=*+1
keybuf	*=*+8		;table of p.f. lengths
maxkys	=128
pkybuf	*=*+maxkys	;p.f. key storage area


;  kennedy interface variables...
;
kdata	*=*+1		;temp for data write to kennedy
kdycmd	*=*+1		;select for kennedy rd or wr
kdynum	*=*+1		;kennedy's dev#
kdyprs	*=*+1		;kennedy present::=$ff, else::=$00
kdytyp	*=*+1		;temp stor. for type of open for kdy
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



savram	*=*+256		;1 page used by banking routines
pat	=savram		;physical address table for banking
lngjmp	=savram+4	;long jump address for banking 'long' routine
fetarg	=savram+6	;storage for long jumps
fetxrg	=savram+7
fetsrg	=savram+8

stktop	*=*+196		;basic run-time stack
stkbot	=*


;  cassette primitive r&w variables
;
typenb			;doubly defined
wrout	*=*+1		;byte to be written on tape

parity	*=*+1		;temp for parity calc
tt1	*=*+1		;temp for write-header
tt2	*=*+1		;temp for write-header
	*=*+1		;*************************************available
rdbits	*=*+1		;local index for readbyte routine
errsp	*=*+1		;pointer to the current entry in the error stack
fperrs	*=*+1		;number of first pass errors
;
; *** don't ever re-order the following 3 variables !!! ***
;
dsamp1	*=*+2		;time constant for x cell sample
dsamp2	*=*+2		;time constant for y cell sample
zcell	*=*+2		;time constant for z cell verify

srecov	*=*+1		;stack marker for stopkey recover
drecov	*=*+1		;stack marker for dropout recover
trsave	*=*+4		;parmeters passed to rdblok
rdetmp	*=*+1		;temp stat save for rdblok
ldrscn	*=*+1		;#consec. shorts to find in leader
cderrm	*=*+1		;#errors fatal in rd countdown
vsave	*=*+1		;temp for verify command
t1pipe	*=*+4		;pipe temp for t1
enext	*=*+1		;read error propagate



;  for rs-232...
;
uoutq	*=*+1		;user char to send
uoutfg	*=*+1		;0::=empty, 1::=full
soutq	*=*+1		;system char to send
soutfg	*=*+1		;0::=empty, 1::=full
inqfpt	*=*+1		;ptr to front of input queue
inqrpt	*=*+1		;ptr to rear of input queue
inqcnt	*=*+1		;# of chars in input queue
astat	*=*+1		;temp ststus word for the acia
aintmp	*=*+1		;temp for input routine
alstop	*=*+1		;flg to indicate if we're paused locally
arstop	*=*+1		;flg to indicate if remote is paused
apres	*=*+1		;flg to indicate if acia in system



;  indirect routine downloaded here...
;
kludes	*=*+12
sinner	=kludes+6


scbot	*=*+1
sctop	*=*+1
sclf	*=*+1
scrt	*=*+1
scrdis	*=*+1
insflg	*=*+1
lstchr	*=*+1
logscr	*=*+1
tcolor	*=*+1
bitabl	*=*+4


sareg	*=*+1		;reg's for sys command
sxreg	*=*+1
syreg	*=*+1
spreg	*=*+1

lstx	*=*+1		;key scan index
stpdsb	*=*+1		;flag to disable ctl-s pause
ramrom	*=*+1		;msb flags monitor fetches from ram (0) or rom (1)
colsw	*=*+1		;msb flags color/lum. table in ram (0) or rom (1)
ffrmsk	*=*+1		;rom mask (split screen)
vmbmsk	*=*+1		;v.m. base mask (split screen)
lsem	*=*+1		;motor lock semaphore for cassette (**02/08/84)
palcnt	*=*+1		;pal tod (**02/17/84)


tedatr	=$0800		;ted attribute bytes
tedscn	=$0c00		;ted character pointers
basbgn	=$1000
grbase	=$2000		;graphic base is the same as basic beginning
bmcolr	=$1c00
bmlum	=$1800
chrbas	=$d000		;beginning of 'character rom'

;end
