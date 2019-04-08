;	.page
;	.subttl 'overflow'
msgs=*
msgmon=*-msgs
       .byte cr,"MONITOR",$8d
msgbrk=*-msgs
       .byte cr,"BREA",$cb
msgreg=*-msgs
       .byte cr,"   PC  SR AC XR YR SP",cr,";",$a0
msgasm=*-msgs
       .byte "A",$a0
msgver=*-msgs
       .byte " ERRO",$d2

msgxxx
       lda msgs,x
       php
       and #$7f
       jsr bsout
       inx
       plp
       bpl msgxxx
       rts

;end
