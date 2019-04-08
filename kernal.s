	.feature labels_without_colons, pc_assignment, missing_char_term
;	.nam ted_kernal

	.include   "declare.s"

true	=-1
false	=0
truted	=true
palmod	=true

	.segment "d800"
	.include   "ed1.s"
	.include   "ed2.s"
	.include   "ed3.s"
	.include   "ed4.s"
	.include   "ed5.s"
	.include   "ed6.s"
	.include   "ed7.s"
	.include   "serial.s"
	.include   "tapsup.s"
	.include   "tapwrt.s"
	.include   "tapred.s"
	.include   "rs232.s"
	.include   "messages.s"
	.include   "channelio.s"
	.include   "openchanl.s"
	.include   "close.s"
	.include   "clall.s"
	.include   "open.s"
	.include   "load.s"
	.include   "save.s"
	.include   "errorhdlr.s"
	.include   "init.s"
	.include   "cmds1.s"
	.include   "cmds2.s"
	.include   "disasm.s"
	.include   "assem.s"
	.include   "util.s"
	.include   "banking.s"

	.segment "ce00"
	.include   "interrupt.s"
	.include   "split.s"
	.include   "music.s"
	.include   "time.s"
	.include   "overflow.s"
	.include   "patches.s"
	.include   "vectors.s"
	.end
