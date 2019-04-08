;	.page
;	.subttl 'messages'
ms1    .byte cr,"I/O ERROR ",$a3
ms5    .byte cr,"SEARCHING",$a0
ms6    .byte "FOR",$a0
ms7    .byte cr,"PRESS PLAY ON TAP",$c5
ms8    .byte "PRESS RECORD & PLAY ON TAP",$c5
ms10   .byte cr,"LOADIN",$c7
ms11   .byte cr,"SAVING",$a0
ms21   .byte cr,"VERIFYIN",$c7
ms17   .byte cr,"FOUND",$a0
ms18   .byte cr,"OK",$8d


;print message to screen only if
;output enabled

spmsg  bit msgflg      	;printing messages?
	bpl msg10       ;no...
msg	lda ms1,y
	php
	and #$7f
	jsr    bsout
	iny
	plp
	bpl    msg
msg10  clc
	rts

;.end
