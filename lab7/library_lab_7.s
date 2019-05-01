	.text
	.global uart_init
	.global timer_init
	.global output_character
	.global read_character
	.global output_string
	.global displayBoard
	.global start_game
	.global game_play
	.global stop_game
	.global new_game
	.global int_to_string
	.global div_and_mod
	.global end_game
	.global pause_game
	.global resume_game
	.global continue_game
	.global restart_cursor
	.global illuminate_LEDs
	.global illuminate_RGB_LED
	.global random_frog_position
	.global random
	.global library_lab_7
	.global move_objects
	.global move_alligator_row
	.global move_lilypad_row
	.global move_log_row
	.global move_turtle_row

head: .word 0x200002F6
;------------------------- output character --------------------------------------------
; output_character transmits a character from the UART to PuTTy. The character is passed in r0.
output_character:
	STMFD SP!,{r2, r3, r5, lr}

	MOV r2, #0xC018
    MOVT r2, #0x4000				; r2 = 0x4000C018 (Status Register address)
    MOV r3, #0xC000
    MOVT r3, #0x4000         		; r3 = 0x4000C000 (Data Register address)

oloop:
	LDR r5, [r2]					; Load contents of Status Register into r5
	AND r5, r5, #0x20				; Isolate bit TxFF for testing
	CMP r5, #0x20					; Is the TxFF bit = 1?
	BEQ oloop						; If yes, loop until TxFF = 0

	STRB r0, [r3]					; Store byte back into data register

	LDMFD sp!, {r2, r3, r5, lr}
	mov pc, lr
;------------------------- read character ----------------------------------------------
; read_character reads a character which is received by the UART from PuTTy, returning the character in r0.
read_character:
	STMFD SP!,{r1-r3, lr}					; Store register lr on stack
	MOV r2, #0xC018          		; Holds 0xC018 in r2
    MOVT r2, #0x4000         		; r2 = 0x4000C018 (Status Register address)

rloop:
    LDR r1, [r2]       		 		; Load contents of Status Register into r1
	AND r1, r1, #0x10		 		; Isolate bit RxFE for testing
	CMP r1, #0x10			 		; Is the RxFE bit = 1?
    BEQ rloop       				; If yes, loop until RxFE = 0

    ; When RxFE is 0, read the byte from the recieve register
    MOV r3, #0xC000          		; r3 = 0xC000
    MOVT r3, #0x4000         		; r3 = 0x4000C000 (Data Register address)
    LDRB r0, [r3]              		; r0 = byte from data register (one character)

    LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;------------------------------- game play -------------------------------------------------
game_play:
	STMFD sp!, {r1, r6, r10, lr}

keys:
	CMP r9, #0x77						; w?
	BEQ checkTop
	;CMP r9, #0x61						; a?
	;BEQ checkLeft
	;CMP r9, #0x64						; d?
	;BEQ checkRight
	;CMP r9, #0x73						; s?
	;BEQ checkBottom
	B leave_game_play					; Nothing: exit routine, don't do anything

checkTop:
	CMP r7, #110
	BEQ gator_to_home
	CMP r7, #0							; Is score = 0? Frog is standing on init row
	BEQ first_step_up					; Yes: go to first step up
	; No: check if we can move up
	LDRB r1, [r8, #-49]					; Load what is in front of frog
	CMP r1, #0x2E						; Is it a dot? (middle of board)
	BEQ step_onto_midpoint				; Yes: step onto the midpoint part
	CMP r1, #0x20						; Is it a space?
	BNE check_object					; No: let's see what's in front

move_up:								; Yes: move the frog up
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x20						; r1 = space
	STRB r1, [r8]						; Erase frog from current position
	MOV r1, #0x26						; Yes: move frog up
	SUB r8, r8, #49						; Point to spot in front of frog
	STRB r1, [r8]						; Move frog up
	B leave_game_play					; Exit routine

first_step_up:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x2E						; Store .
	STRB r1, [r8]						; Store . in current position
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x26						; r1 = &
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

step_onto_midpoint:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x20						; Space
	STRB r1, [r8]						; Store space in current position
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x26						; r1 = &
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

move_to_turtle:
	B first_step_up						; Same method

turtle_to_log:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x54						; Store T
	STRB r1, [r8]						; Store T in current position
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x26						; r1 = &
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

log_to_lilypad:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x4C						; Store L
	STRB r1, [r8]						; Store L in current position
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x26						; r1 = &
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

lilypad_to_gator:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x4F						; Store O
	STRB r1, [r8]						; Store O in current position
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x26						; r1 = &
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

gator_to_home:
	ADD r7, r7, #10						; Increment score by 10
	MOV r1, #0x61						; Store a
	STRB r1, [r8]						; Store a in current position
	LDRB r2, [r8, #-49]						; Load next position
	CMP r2, #0x20						; Is next position a space?
	BNE leave_game_play					; No? Don't do anything. Exit routine
	SUB r8, r8, #49						; Point to spot in front of frog
	MOV r1, #0x48						; r1 = 'H' for home
	STRB r1, [r8]						; Store frog in new position
	B leave_game_play					; Exit routine

check_object:
	CMP r1, #0x7E						; Then, is it water? (~)
	BEQ stop_game						; Yes: you died
	CMP r1, #0x43						; Then, is it a car? (C)
	BEQ stop_game						; Yes: you died
	CMP r1, #0x23						; Then, is it a truck? (#)
	BEQ stop_game						; Yes: you died
	CMP r1, #0x41						; Then, is it a gator mouth?
	BEQ stop_game						; Yes: you died
	CMP r1, #0x54						; Turtle?
	BEQ move_to_turtle
	CMP r1, #0x4C						; Log?
	BEQ turtle_to_log
	CMP r1, #0x4F
	BEQ log_to_lilypad					; Lilypad?
	CMP r1, #0x61
	BEQ lilypad_to_gator				; Gator body
	B leave_game_play

stop_game:
	B end_game

leave_game_play:
	MOV r9, #0
	BL restart_cursor
	BL displayBoard
	LDMFD sp!, {r1, r6, r10, lr}
	mov pc, lr

;---------------------------- pause game -----------------------------------------
pause_game:
	STMFD sp!, {r1-r2, lr}

	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x33
	STRB r4, [r2]
	BL illuminate_RGB_LED		; Turn on red LED for pause

	MOV r2, #0x000C				; Disable the timer 0
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDRB r1, [r2]
    BIC r1, r1, #0x1			; Clear bit 0
    STRB r1, [r2]

    MOV r2, #0x100C				; Disable the timer 1
    MOVT r2, #0x4003			; r2 = 0x4003100C
    LDRB r1, [r2]
    BIC r1, r1, #0x1			; Clear bit 0
    STRB r1, [r2]

	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;---------------------------- resume game -----------------------------------------
resume_game:
	STMFD sp!, {r1-r2, lr}

	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED		; Turn blue LED back on for resume

	MOV r2, #0x000C				; Enable timer 0
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

    MOV r2, #0x100C				; Enable timer 1
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;----------------------------- move_alligator_row ----------------------------------------
move_alligator_row:
	STMFD sp!, {lr}

	MOV r2, #0x00C5
	MOVT r2, #0x2000

move_alligator:
	LDRB r1, [r2, #1] 				; Load byte 1 space over to the right
	CMP r1, #0x7C					; Is it a border?
	BEQ reset_alligator_ptr			; Yes: point back to beginning of row
	STRB r1, [r2] 					; No: store in current spot
	ADD r2, r2, #1					; Increment pointer
	B move_alligator				; Go to check rest of the row

move_with_alligator:
	SUB r8, r8, #1
	B leave_alligator_row

reset_alligator_ptr:
	MOV r2, #0x00C5
	MOVT r2, #0x2000				; beginning address of row

leave_alligator_row:
	LDMFD sp!, {lr}
	mov pc, lr

;----------------------------- move lilypads row -----------------------------------------------
move_lilypad_row:
	STMFD sp!, {lr}

	MOV r2, #0x0122
	MOVT r2, #0x2000				; base address of lilypad row

move_lilypads:
	LDRB r1, [r2, #-1] 				; Load byte 1 space over to the left
	CMP r1, #0x7C					; Is it a border?
	BEQ reset_lilypad_ptr			; Yes: point back to beginning of row
	STRB r1, [r2] 					; No: store in current spot
	SUB r2, r2, #1					; Increment pointer
	B move_lilypads					; Go to check rest of the row

move_with_lilypad:
	ADD r8, r8, #1
	B leave_lilypad_row

reset_lilypad_ptr:
	CMP r7, #100
	BEQ move_with_lilypad
	MOV r2, #0x00C5
	MOVT r2, #0x2000				; beginning address of row

leave_lilypad_row:
	LDMFD sp!, {lr}
	mov pc, lr

;----------------------------- move logs row -----------------------------------------------
move_log_row:
	STMFD sp!, {lr}

	MOV r2, #0x0127
	MOVT r2, #0x2000				; base address of lilypad row

move_logs:
	LDRB r1, [r2, #1] 				; Load byte 1 space over to the left
	CMP r1, #0x7C					; Is it a border?
	BEQ reset_log_ptr				; Yes: point back to beginning of row
	STRB r1, [r2] 					; No: store in current spot
	ADD r2, r2, #1					; Increment pointer
	B move_logs						; Go to check rest of the row

frog_left:
	SUB r8, r8, #1
	B leave_log_row

reset_log_ptr:
	CMP r7, #90						; Is frog on this row?
	BEQ frog_left
	MOV r2, #0x0127
	MOVT r2, #0x2000				; beginning address of row

leave_log_row:
	LDMFD sp!, {lr}
	mov pc, lr

;----------------------------- move turtles row -----------------------------------------------
move_turtle_row:
	STMFD sp!, {lr}

	MOV r2, #0x0184
	MOVT r2, #0x2000				; base address of lilypad row

move_turtles:
	LDRB r1, [r2, #-1] 				; Load byte 1 space over to the left
	CMP r1, #0x7C					; Is it a border?
	BEQ reset_turtle_ptr			; Yes: point back to beginning of row
	STRB r1, [r2] 					; No: store in current spot
	SUB r2, r2, #1					; Increment pointer
	B move_turtles					; Go to check rest of the row

frog_right:
	ADD r8, r8, #1
	B leave_move_turtles

reset_turtle_ptr:
	CMP r7, #80						; Is frog on this row?
	BEQ frog_right
	MOV r2, #0x0184
	MOVT r2, #0x2000				; beginning address of row

leave_move_turtles:
	LDMFD sp!, {lr}
	mov pc, lr

;--------------------------- move cars/trucks --------------------------------------------------
move_objects:
	STMFD sp!, {r1-r2, lr}

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r3, [r2]
    CMP r3, #0x31				; Is game in play? (green)
    BNE leave_move_objects

loop:									; Started from top left corner of road board
	LDRB r3, [r4]						; Load byte
	CMP r3, #0x7C						; Is it a border?
	BEQ next_row						; Yes: Go to next row
	CMP r3, #0x26						; Is it the frog?
	BEQ ignore  						; Yes: ignore the frog
	CMP r3, #0x20						; Is it an empty spot? (no car/truck)
	BEQ ignore							; Yes: ignore the space
	CMP r3, #0x7E						; Is it water?
	BEQ ignore							; Yes: ignore the water
	B checkObject						; No: MUST be car or truck or water thing

ignore:
	ADD r4, r4, #1						; Point to next spot
	B loop								; Continue checking each spot

checkObject:
	CMP r3, #0x43						; Then, is it a car? (C)
	BEQ move_car						; Yes: move it
	CMP r3, #0x23						; Then, is it a truck? (#)
	BEQ move_truck						; Yes: move it
	CMP r3, #0x2E						; Then, is it a dot?
	BEQ ignore							; Yes: ignore it
	CMP r3, #0xD
	BEQ next_row2
	CMP r3, #0x7C						; Then, is it a border? (middle line border)
	BEQ next_row
	CMP r3, #0x2D						; Then, is it a dash? (bottom border)
	BEQ reset_pointer					; Point back at top left corner of the board for next refresh

move_car:								; CARS GO RIGHT
	MOV r1, #0x20						; r1 = ASCII space
	STRB r1, [r4]						; Overwrite current spot w a space (erase car from current spot)
	LDRB r5, [r4, #1]					; Load what's in front of the car (right side)
	CMP r5, #0x26						; Is it the frog?
	BEQ stopGame						; Yes: game over
	CMP r5, #0x7C						; Is it a border?
	BEQ ignore							; Yes: car has been erased, so do nothing, but point to next spot
	STRB r3, [r4, #1]					; No: Must be a space, so store car 1 spot over to 'move' it
	ADD r4, r4, #2						; Point 2 spots forward, since we just moved the car over 1 spot
	B loop								; Continue checking each spot

move_truck:								; TRUCKS GO LEFT
	MOV r1, #0x20						; Space
	STRB r1, [r4]						; Store space at current spot
	LDRB r5, [r4, #-1]					; Load space next to truck (left side)
	CMP r5, #0x26						; Is it the frog?
	BEQ stopGame						; Yes: game over
	CMP r5, #0x23						; Is it itself?
	BEQ ignore							; Yes: point to next spot
	CMP r5, #0x7C						; Is it a border?
	BEQ ignore							; Yes: truck has been erased, so do nothing, but point to next spot
	STRB r3, [r4, #-1]					; No: Must be a space, so store truck 1 spot over to 'move' it
	B loop								; Continue checking each spot

next_row:								; Move pointer to the beginning of the next row
	ADD r4, r4, #4
	B loop								; Continue going through this row

next_row2:								; Move pointer to the beginning of the next row
	ADD r4, r4, #3
	B loop

reset_pointer:							; Reverts r4 to the address of the top left corner of road board
	MOV r4, #0x01BA
	MOVT r4, #0x2000
	BL restart_cursor					; Refresh board & leave subroutine
	BL displayBoard
	B leave_move_objects

stopGame:
    MOV r2, #0x0014
    MOVT r2, #0x2000					; 0x20000014
	LDRB r1, [r2]
	SUB r1, r1, #1
	STRB r1, [r2]						; Decrement lives
	BL illuminate_LEDs

	CMP r1, #0x30						; Any lives left?
	BNE newLife						; Yes: start round again

    MOV r2, #0xE100
	MOVT r2, #0xE000
	LDR r1, [r2]
	AND r1, r1, #0x0
	STR r1, [r2]

	MOV r4, #0x00C5
	MOVT r4, #0x2000
	BL output_string					; Ends the game & displays score
	B leave_move_objects

newLife:
	BL random_frog_position
	BL illuminate_LEDs
	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED
	MOV r9, #0							; reset r9
	MOV r7, #0
	BL restart_cursor
	BL displayBoard

leave_move_objects:
	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;------------------------- output string -----------------------------------------------
; output_string transmits a null-terminated string for display in PuTTy.
; The base address of the string should be passed into the routine in r4.
output_string:
	STMFD SP!,{r3-r5, r8, lr} 	; Store register lr on stack

	MOV r4, #0x0917
	MOVT r4, #0x2000			; r4 = 0x20009020 (base address)
	MOV r8, #0					; counter for # of digits the answer contains

div:
	BL int_to_string			; Branch to int_to_string
	STRB r3, [r4], #-1			; Store num into memory backwards (b/c answer comes out backwards)
	ADD r8, r8, #1				; increment counter
	CMP r7, #0					; Is quotient = 0?
	BNE div						; No: branch back to div again
	MOV r5, r4					; copy base address to r5 b/c r4 will get overwritten

loop6:
	BL restart_cursor
	BL end_game
	SUB r8, r8, #1				; decrement counter
	CMP r8, #0					; is counter = 0?
	BNE loop6					; no: loop till counter = 0 (answer has been fully outputted)

	LDMFD sp!, {r3-r5, r8, lr}
	mov pc, lr
;---------------------- int to string -------------------------------------
; Converts an integer back into a string for output (display)
int_to_string:
	STMFD SP!,{lr} 			; Store register lr on stack

	MOV r12, #10			; 10 needed as divisor
	BL div_and_mod			; branch to div_and_mod for conversion purposes
	ADD r3, r10, #48		; r3 = remainder + 48 (ascii value of a digit)

	LDMFD sp!, {lr}
	mov pc, lr

div_and_mod:
	STMFD SP!,{r2, r5-r6, r12, lr}

	; Clear the registers & copy needed variables to new registers
    MOV r6, #0          	; r6 = counter
    MOV r5, #0          	; r5 = remainder
	MOV r3, #0

    ADD r6, r6, #15     	; initialize r6 (counter) to 15
    MOV r2, #0          	; r2 = quotient, initialize quotient to 0
    LSL r12, r12, #15     	; Logical Left Shift Divisor 15 places
    MOV r5, r7          	; Initialize Remainder to Dividend
    B LOOP5              	; Branch to LOOP5

SUBTRACT:
	SUB r6, r6, #1			; Decrement counter
    B LOOP5              	; Branch to LOOP5

LOOP5:
    SUB r5, r5, r12      	; Remainder:= Remainder (r5) - Divisor (r0)
    CMP r5, #0          	; Is remainder < 0 ?
    BLT YES             	; If true, branch to YES
    LSL r2, r2, #1      	; If false, Left Shift Quotient
    ADD r2, r2, #1      	; LSB = 1
    B CHECK             	; Branch to CHECK

YES:
    ADD r5, r5, r12      	; Remainder:= Remainder (r5) + Divisor (r0)
    LSL r2, r2, #1      	; Left Shift Quotient

CHECK:
	LSR r12, r12, #1      	; Right Shift Divisor
    CMP r6, #0         		; Is counter > 0 ?
    BGT SUBTRACT

	MOV r7, r2				; copy quotient to r7

END:
	MOV r10, r5				; copy remainder to r10

	LDMFD sp!, {r2, r5-r6, r12, lr}
	mov pc, lr

;------------------------- restart cursor ----------------------------------------------
; Resets the terminal cursor to position 0,0 (top left corner)
restart_cursor:
	STMFD SP!,{r0, lr}

	MOV r0, #0x1B
	BL output_character
	MOV r0, #0x5B
	BL output_character
	MOV r0, #0x30
	BL output_character
	MOV r0, #0x3B
	BL output_character
	MOV r0, #0x30
	BL output_character
	MOV r0, #0x48
	BL output_character


	LDMFD sp!, {r0, lr}
	mov pc, lr
;--------------------------- uart init ----------------------------------------------
uart_init:
	STMFD SP!,{r1-r2, lr} 				; Store register lr on stack

	MOV r2, #0xE608
	MOVT r2, #0x400F
	LDR r1, [r2]
	MOV r1, #0x2B				; Enable clock for GPIO PORT A, B, D, & F
	STR r1, [r2]

	MOV r2, #0xE618
    MOVT r2, #0x400F			; r2 = 0x400FE618
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #1					; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xE608
    MOVT r2, #0x400F			; r2 = 0x400FE608
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #1					; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xC030
    MOVT r2, #0x4000			; r2 = 0x4000C030
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #0					; Changes r1 to #0
    STR r1, [r2]				; Stores back into the address

	; BAUD RATE: 360,500
    MOV r2, #0xC024				; Baud Integer
    MOVT r2, #0x4000			; r2 = 0x4000C024
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #4					; Changes r1 to #104
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xC028				; Baud Fractional
    MOVT r2, #0x4000			; r2 = 0x4000C028
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #11					; Changes r1 to #11
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xCFC8
    MOVT r2, #0x4000			; r2 = 0x4000CFC8
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #0					; Changes r1 to #0
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xC02C
    MOVT r2, #0x4000			; r2 = 0x4000C02C
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #0x60				; Changes r1 to #0x60
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xC030
    MOVT r2, #0x4000			; r2 = 0x4000C030
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    MOV r1, #0x301				; Changes r1 to #0x301
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0x451C
    MOVT r2, #0x4000			; r2 = 0x4000451C
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x03			; Changes r1 to #0x03
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0x4420
    MOVT r2, #0x4000			; r2 = 0x40004420
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x03			; Changes r1 to #0x03
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0x452C
    MOVT r2, #0x4000			; r2 = 0x4000452C
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x11			; Changes r1 to #0x11
    STR r1, [r2]				; Stores back into the address

    MOV r2, #0xC038
	MOVT r2, #0x4000
	LDRB r1, [r2]
	ORR r1, r1, #0x10
	STRB r1, [r2]				; Enable UART Recieve in UART0 Interrupt Mask Register Interrupt Mask

	MOV r2, #0xE100
	MOVT r2, #0xE000
	LDRB r1, [r2]
	ORR r1, r1, #0x20
	STRB r1, [r2] 				; Set Bit 5 of EN0

	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;--------------------------- timer init 1 ------------------------------------------------
timer_init:
	STMFD SP!,{r1-r2, lr}

	MOV r2, #0xE604				; Connect clock to timer
    MOVT r2, #0x400F			; r2 = 0x400FE604
    LDRB r1, [r2]
    ORR r1, r1, #0x7			; Enable Timer 0, 1, 2
    STRB r1, [r2]

	MOV r2, #0x000C				; Disable timer0 for setup & configuration
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDRB r1, [r2]
    BIC r1, r1, #0x0			; Clear bit 0
    STRB r1, [r2]

	MOV r2, #0x100C				; Disable timer1 for setup & configuration
    MOVT r2, #0x4003			; r2 = 0x4003100C
    LDRB r1, [r2]
    BIC r1, r1, #0x0			; Clear bit 0
    STRB r1, [r2]

    MOV r2, #0x200C				; Disable timer2 for setup & configuration
    MOVT r2, #0x4003			; r2 = 0x4003100C
    LDRB r1, [r2]
    BIC r1, r1, #0x0			; Clear bit 0
    STRB r1, [r2]

	MOV r2, #0x0000				; setup timer0 for 32-bit mode
    MOVT r2, #0x4003
    LDR r1, [r2]
    BIC r1, #0x0				; Clear bit 0
    STR r1, [r2]

    MOV r2, #0x1000				; setup timer1 for 32-bit mode
    MOVT r2, #0x4003
    LDR r1, [r2]
    BIC r1, #0x0				; Clear bit 0
    STR r1, [r2]

	MOV r2, #0x2000				; setup timer2 for 32-bit mode
    MOVT r2, #0x4003
    LDR r1, [r2]
    BIC r1, #0x0				; Clear bit 0
    STR r1, [r2]


	MOV r2, #0x0004				; put timer0 into periodic mode
    MOVT r2, #0x4003
    LDRB r1, [r2]
    ORR r1, r1, #0x02
    STRB r1, [r2]

    MOV r2, #0x1004				; put timer1 into periodic mode
    MOVT r2, #0x4003
    LDRB r1, [r2]
    ORR r1, r1, #0x02
    STRB r1, [r2]

    MOV r2, #0x2004				; put timer2 into periodic mode
    MOVT r2, #0x4003
    LDRB r1, [r2]
    ORR r1, r1, #0x02
    STRB r1, [r2]

	MOV r2, #0x0028				; set interrupt interval 0
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]
    MOV r1, #0x1200				; .50 Seconds
    MOVT r1, #0x007A
    STR r1, [r2]

    MOV r2, #0x1028				; set interrupt interval 1
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]
    MOV r1, #0x2400				; 1 Seconds
    MOVT r1, #0x00F4
    STR r1, [r2]

    MOV r2, #0x2028				; set interrupt interval 2
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]
    MOV r1, #0x2400				; 1 Seconds
    MOVT r1, #0x00F4
    STR r1, [r2]


	MOV r2, #0x0018				; set timer0 to interrupt when top limit reached
    MOVT r2, #0x4003			; r2 = 0x40030018
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

    MOV r2, #0x1018				; set timer1 to interrupt when top limit reached
    MOVT r2, #0x4003			; r2 = 0x40030018
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

	MOV r2, #0x2018				; set timer2 to interrupt when top limit reached
    MOVT r2, #0x4003			; r2 = 0x40030018
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

	MOV r2, #0xE100				; Enable interrupts timer 0
    MOVT r2, #0xE000			; r2 = 0xE000E100
    LDR r1, [r2]
    ORR r1, #0x80000			; Set bit 19
    STR r1, [r2]

	MOV r2, #0xE100				; Enable interrupts timer 1
    MOVT r2, #0xE000			; r2 = 0xE000E100
    LDR r1, [r2]
    ORR r1, r1, #0x200000		; Set bit 21
    STR r1, [r2]

    MOV r2, #0xE100				; Enable interrupts timer 2
    MOVT r2, #0xE000			; r2 = 0xE000E100
    LDR r1, [r2]
    ORR r1, r1, #0x800000		; Set bit 23
    STR r1, [r2]

    MOV r2, #0x000C				; Enable timer 0
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

    MOV r2, #0x100C				; Enable timer 1
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

    MOV r2, #0x200C				; Enable timer 1
    MOVT r2, #0x4003			; r2 = 0x4003000C
    LDR r1, [r2]
    ORR r1, r1, #0x1			; Set bit 0 to 1
    STR r1, [r2]

	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;------------------------- illuminate LEDs -----------------------------------------------
; Illuminate LEDs illuminates a selected set of LEDs.
; The pattern indicating which LEDs to illuminate is passed into the routine in r0.
illuminate_LEDs:
	STMFD SP!, {r1-r2, r5-r6, lr}		; Store register lr on stack

	MOV r2, #0x5400
    MOVT r2, #0x4000	; r2 = 0x40005400 Direction Register (Port B)
 	LDR r1, [r2]		; Load in byte from address
 	ORR r1, r1, #0xF	; Configure Pins as Output
 	STR r1, [r2]

	MOV r2, #0x551C
	MOVT r2, #0x4000	; r2 = 0x4000551C Digital Register (Port B)
	LDR r1, [r2]		; Accessing Digital Enable for PORT B;
	ORR r1, #0xF		; Setting PIN 0 - 3 to digital
	STR r1, [r2]

readvalue:
	MOV r5, #0x53FC
	MOVT r5, #0x4000	; r5 = 0x400053FC Data Register (PORTB)
	LDR r6, [r5]

    MOV r2, #0x0014
    MOVT r2, #0x2000			; 0x20000014
	LDRB r1, [r2]		; Load lives into r1

four:					; Check how many lives are left
	CMP r1, #0x34
	BEQ all_on

three:
	CMP r1, #0x33
	BEQ three_on

two:
	CMP r1, #0x32
	BEQ two_on

one:
	CMP r1, #0x31
	BEQ one_on

none:
	CMP r1, #0x30
	BEQ all_off

all_on:
	MOV r6, #0xF
	STRB r6, [r5]
	B done3

three_on:
	MOV r6, #0xE
	STRB r6, [r5]
	B done3

two_on:
	MOV r6, #0xC
	STRB r6, [r5]
	B done3

one_on:
	MOV r6, #0x8
	STRB r6, [r5]
	B done3

all_off:
	MOV r6, #0x0
	STRB r6, [r5]
	B done3

done3:
	LDMFD sp!, {r1-r2, r5-r6, lr}
	MOV pc, lr
;-------------------------------------------------------------------------------
; Turns on the respective RGB LED color depending on the state of the game.
illuminate_RGB_LED:
	STMFD SP!,{r1-r3, lr}

    MOV r2, #0x5400
    MOVT r2, #0x4002			; r2 = 0x40025400 Direction Register (Port F)
 	LDR r1, [r2]				; Load in byte from address
 	ORR r1, r1, #0xF			; Configure Pin as Outputs
 	STR r1, [r2]

	MOV r2, #0x551C
	MOVT r2, #0x4002			; r2 = 0x4002551C Digital Register (Port F)
	LDR r1, [r2]				; Accessing Digital Enable for PORT F;
	MOV r1, #0xE
	STR r1, [r2]				; Setting PIN 1 - 3 to digital

checkState:
	MOV r2, #0x0D0F				; Check state
    MOVT r2, #0x2000
    LDRB r3, [r2]
    CMP r3, #0x30
    BEQ White
    CMP r3, #0x31
    BEQ Green
    CMP r3, #0x32
    BEQ Blue
    CMP r3, #0x33
    BEQ Red

White:					; RED & GREEN & BLUE
	MOV r2, #0x53FC				; Now accessing PORTF (Data Register)
	MOVT r2, #0x4002
	LDR r1, [r2]				; Data in r1
	ORR r1, r1, #0x0E
	STR r1, [r2]		; Stores back the result of color needed to be lit
	B STOP

; Red - Pin1, Blue - Pin2, Green - Pin3 (Green, Blue, Red, Empty)
Red:
	MOV r2, #0x53FC				; Now accessing PORTF (Data Register)
	MOVT r2, #0x4002
	LDR r1, [r2]				; Data in r1
	MOV r1, #0x02		; RED
	STR r1, [r2]		; Stores back the result of color needed to be lit
	B STOP

Green:					; GREEN
	MOV r2, #0x53FC				; Now accessing PORTF (Data Register)
	MOVT r2, #0x4002
	LDR r1, [r2]				; Data in r1
	MOV r1, #0x08
	STR r1, [r2]		; Stores back the result of color needed to be lit
	B STOP

Blue:					; BLUE
	MOV r2, #0x53FC				; Now accessing PORTF (Data Register)
	MOVT r2, #0x4002
	LDR r1, [r2]				; Data in r1
	MOV r1, #0x04
	STR r1, [r2]		; Stores back the result of color needed to be lit
	B STOP

STOP:
	LDMFD sp!, {r1-r3, lr}
	MOV pc, lr
