	.feature labels_without_colons, pc_assignment, missing_char_term
;	.nam ted_kernal

	.include   "declare.s"

true	=-1
false	=0
truted	=true
palmod	=true

	.segment "editor"
	.include   "ed1.s"
	.include   "ed2.s"
	.include   "ed3.s"
	.include   "ed4.s"
	.include   "ed5.s"
	.include   "ed6.s"
	.include   "ed7.s"

	.segment "serial"
	.include   "serial.s"

	.segment "tape"
	.include   "tapsup.s"
	.include   "tapwrt.s"
	.include   "tapred.s"

	.segment "rs232"
	.include   "rs232.s"

	.segment "io"
	.include   "messages.s"
	.include   "channelio.s"
	.include   "openchanl.s"
	.include   "close.s"
	.include   "clall.s"
	.include   "open.s"
	.include   "load.s"
	.include   "save.s"
	.include   "errorhdlr.s"

	.segment "init"
	.include   "init.s"

	.segment "monitor"
	.include   "cmds1.s"
	.include   "cmds2.s"
	.include   "disasm.s"
	.include   "assem.s"
	.include   "util.s"

	.segment "banking"
	.include   "banking.s"

	.segment "lokernal"
	.include   "interrupt.s"
	.include   "split.s"
	.include   "music.s"
	.include   "time.s"
	.include   "overflow.s"
	.include   "patches.s"

	.include   "vectors.s"
	.end
