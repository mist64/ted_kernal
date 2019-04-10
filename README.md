	;  ****************************************************************** 
	;  *                                                                * 
	;  *     PPPPPPPP   LLL      UUU   UUU   SSSSSSS           444      * 
	;  *     PPP   PPP  LLL      UUU   UUU  SSS   SSS        44444      * 
	;  *     PPP   PPP  LLL      UUU   UUU  SSS             44 444      * 
	;  *     PPPPPPPP   LLL      UUU   UUU   SSSSSSS      44   444      * 
	;  *     PPP        LLL      UUU   UUU        SSS     444444444     * 
	;  *     PPP        LLL      UUU   UUU  SSS   SSS          444      * 
	;  *     PPP        LLLLLLL   UUUUUUU    SSSSSSS           444      * 
	;  *                                                                * 
	;  *                                                                * 
	;  * KKK   KKK  EEEEEEEEE  RRRRRRRR   NNN    NN     AAA     LLL     * 
	;  * KKK  KKK   EEE        RRR   RRR  NNNN   NN   AA   AA   LLL     * 
	;  * KKK KKK    EEE        RRR   RRR  NNNNN  NN  AAA   AAA  LLL     * 
	;  * KKKKK      EEEEEE     RRRRRRRR   NNN NN NN  AAAAAAAAA  LLL     * 
	;  * KKK KKK    EEE        RRR RRR    NNN  NNNN  AAA   AAA  LLL     * 
	;  * KKK  KKK   EEE        RRR  RRR   NNN   NNN  AAA   AAA  LLL     * 
	;  * KKK   KKK  EEEEEEEEE  RRR   RRR  NNN    NN  AAA   AAA  LLLLLLL * 
	;  *                                                                * 
	;  *                                                                * 
	;  *                    V E R S I O N   3 . 5                       * 
	;  *                                                                * 
	;  *                                                                * 
	;  *    COPYRIGHT (C)1984  BY   COMMODORE BUSINESS MACHINES, INC.   * 
	;  *                                                                * 
	;  ****************************************************************** 
	  
	  
	  
	;  ****************************************************************** 
	;  *                                                                * 
	;  *  THIS  SOFTWARE IS  FURNISHED FOR USE IN  COMMODORE  COMPUTER  * 
	;  *  SYSTEMS ONLY. COPIES MAY NOT BE MADE IN WHOLE OR IN PART FOR  * 
	;  *                   USE ON ANY OTHER SYSTEM.                     * 
	;  *                                                                * 
	;  *  THE  INFORMATION  IN  THIS  DOCUMENT  IS  SUBJECT  TO CHANGE  * 
	;  *                       WITHOUT NOTICE.                          * 
	;  *                                                                * 
	;  *  NO  RESPONSIBILITY  IS  ASSUMED  FOR THE RELIABILITY OF THIS  * 
	;  *                          SOFTWARE.                             * 
	;  *                                                                * 
	;  ****************************************************************** 

# Context

This is based on the original Commodore TED (C16, C116, Plus/4) KERNAL source from the [ted_kernal_basic_src.tar.gz](http://www.zimmers.net/anonftp/pub/cbm/src/plus4/index.html). The source has been adapted to work with the cc65/ca65 assembler. All original symbols and comments are intact.

This makes it a great base for custom TED KERNALs.

# Building

* Use `make` to build.
* Requires [cc65](https://github.com/cc65/cc65).
* The resulting files `lokernal.bin` and `hikernal.bin` contain the ranges of $CE00-$CFFF and $D800-$FFFF of the 318004-05 (PAL) ROM - the remaining parts are the BASIC overflow area and the character set.
* To compile the NTSC version (318005-05), set `palmod=false` in `kernal.s`.
* There are two minor differences to the original KERNAL images:
	* In the original KERNAL image, $FF49 contains the bytes $4C, $C2, $B7. It is unknown what they mean.
	* In the original KERNAL image, $FF7F contains $5e (PAL) and $c4 (NTSC). This is probably the checksum, and it's not included in this build.

# Modifying

The code is split up into the following sections:

* lokernal
* editor
* serial
* tape
* rs232
* io
* init
* monitor
* banking
* bankvectors
* basvectors
* vectors

These sections will always be linked to their original addresses, so if you want to remove "tape" or "monitor", for example, the other sections will still remain where they should be in the image.

# Credits

This version is maintained by Michael Steil <mist64@mac.com>, [www.pagetable.com](https://www.pagetable.com/)