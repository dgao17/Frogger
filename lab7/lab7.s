; Names: Carmen Tam (50194532) & Dee Gao (50244179)

	.data
info:			.string " Timer: 60   Lives: 4   Level: 1   Score:      ", 0xD,0xA
top:			.string "|---------------------------------------------|", 0xD,0xA
Border1:		.string "|*********************************************|", 0xD,0xA
Border2:		.string "|*****     *****     *****     *****     *****|", 0xD,0xA
Border3:		.string "|~~~~~~~~~~Aaaaaa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border4:		.string "|~~~~~~~~~~~~~~~~~~~~LLLLLL~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border5:		.string "|~~~~~~~~~~~~O~~~~~~~~O~~~~~O~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border6:		.string "|~~~~~~~~~~~~TT~~~~~~~~~~~~~~~TT~~~~~~~~TT~~~~|", 0xD,0xA
Border7:		.string "|.............................................|", 0xD,0xA
Border8:		.string "|                                  ####       |", 0xD,0xA
Border9:		.string "|       C                 C                   |", 0xD,0xA
Border10:		.string "|                                             |", 0xD,0xA
Border11:		.string "|                           ####              |", 0xD,0xA
Border12:		.string "|          C                                  |", 0xD,0xA
Border13:		.string "|                                             |", 0xD,0xA
Border14:		.string "|......................&......................|", 0xD,0xA
bottom:			.string "|---------------------------------------------|", 0,0xD,0xA

startscreen:	.string " Timer: 60   Lives: 4   Level: 1   Score:      ", 0xD,0xA
Border:			.string "|---------------------------------------------|", 0xD,0xA
Border15:		.string "|                                             |", 0xD,0xA
Border16:		.string "| :::: ::::: :::::: :::::: :::::: :::: :::::  |", 0xD,0xA
Border17:		.string "| ::   ::  : ::  :: ::     ::     ::   ::  :  |", 0xD,0xA
Border18:		.string "| :::: ::::: ::  :: :: ::: :: ::: :::: :::::  |", 0xD,0xA
Border19:		.string "| ::   :: :  ::  :: ::  :: ::  :: ::   :: :   |", 0xD,0xA
Border20:		.string "| ::   ::  : :::::: :::::: :::::: :::: ::  :  |", 0xD,0xA
Border21:		.string "|                                             |", 0xD,0xA
Border22:		.string "|        Press enter to start the game!       |", 0xD,0xA
Border23:		.string "|     Get all the frogs home safely while     |", 0xD,0xA
Border24:		.string "|  trying to get as many points as possible!  |", 0xD,0xA
Border25:		.string "|                                             |", 0xD,0xA
Border26:		.string "|                                             |", 0xD,0xA
Border27:		.string "|                                             |", 0xD,0xA
Border28:		.string "|                                             |", 0xD,0xA
bottom1:		.string "|---------------------------------------------|", 0,0xD,0xA

info2:			.string " Timer: 60   Lives: 4   Level: 1   Score:      ", 0xD,0xA
top2:			.string "|---------------------------------------------| ", 0xD,0xA
Border29:		.string "|                                             |", 0xD,0xA
Border30:		.string "|        ||||||  |||||  |\     /| ||||||      |", 0xD,0xA
Border31:		.string "|       ||      ||   || ||\\ //|| ||          |", 0xD,0xA
Border32:		.string "|       ||  ||| ||||||| || \/  || ||||||      |", 0xD,0xA
Border33:		.string "|       ||   || ||   || ||     || ||          |", 0xD,0xA
Border34:		.string "|        |||||| ||   || ||     || ||||||      |", 0xD,0xA
Border35:		.string "|                                             |", 0xD,0xA
Border36:		.string "|        ||||| \\       // |||||| |||||       |", 0xD,0xA
Border37:		.string "|       ||   || \\     //  ||     |   ||      |", 0xD,0xA
Border38:		.string "|       ||   ||  \\   //   |||||| |||||       |", 0xD,0xA
Border39:		.string "|       ||   ||   \\ //    ||     || \\       |", 0xD,0xA
Border40:		.string "|        |||||     \_/     |||||| ||  \\      |", 0xD,0xA
Border41:		.string "|             Score:                          |", 0xD,0xA
Border42:		.string "|          Press p to restart the game!       |", 0xD,0xA
bottom2:		.string " ---------------------------------------------|", 0, 0xD,0xA

info3:			.string " Timer: 60   Lives: 4   Level: 1   Score:      ", 0xD,0xA
top3:			.string "|---------------------------------------------|", 0xD,0xA
Border43:		.string "|*********************************************|", 0xD,0xA
Border44:		.string "|*****     *****     *****     *****     *****|", 0xD,0xA
Border45:		.string "|~~~~~~~~~~Aaaaaa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border46:		.string "|~~~~~~~~~~~~~~~~~~~~LLLLLL~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border47:		.string "|~~~~~~~~~~~~O~~~~~~~~O~~~~~O~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border48:		.string "|~~~~~~~~~~~~TT~~~~~~~~~~~~~~~TT~~~~~~~~~~~~~~|", 0xD,0xA
Border49:		.string "|.............................................|", 0xD,0xA
Border50:		.string "|                                  ####       |", 0xD,0xA
Border51:		.string "|       C                 C                   |", 0xD,0xA
Border52:		.string "|                    ####                     |", 0xD,0xA
Border53:		.string "|                   C                         |", 0xD,0xA
Border54:		.string "|          ####                               |", 0xD,0xA
Border55:		.string "|         C                        C          |", 0xD,0xA
Border56:		.string "|......................&......................|", 0xD,0xA
bottom3:		.string "|---------------------------------------------|", 0,0xD,0xA

trucks: 		.string "#### ", 0
gameState:      .string "0", 0

	.text
	.global uart_init
	.global timer_init0A
	.global timer_init0B
	.global output_character
	.global read_character
	.global output_string
	.global UART0Handler
	.global Timer0AHandler
	.global Timer0BHandler
	.global game_play
	.global end_game
	.global start_game
	.global stop_game
	.global new_game
	.global continue_game
	.global restart_cursor
	.global displayBoard
	.global illuminate_LEDs
	.global random
	.global illuminate_RGB_LED
	.global lab7
	.global library_lab_7
	.global move_objects


game_ptr: .word info
end_scr: .word info2
new_scr: .word info3
start_scr: .word startscreen
head: .word 0x200002F6
game_board: .word Border3
truck: .word trucks


lab7:
	STMFD sp!, {lr}

	BL uart_init				; initialize the UART
	BL illuminate_RGB_LED

	BL start_game				; Display Frogger's starting screen
	LDR r8, head				; address of frog in beginning of game

	LDR r4, game_board			; 0x200001BA
	ADD r4, r4, #1				; Address of top left corner of the road area (not the border, the space)

	LDR r6, truck				; truck string address: 0xD09

	LDMFD sp!, {lr}
	mov pc, lr

random:
	STMFD SP!,{r1-r3, lr}		; Store register lr on stack

	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	; Did we finish printing truck?
    MOV r3, r6
	AND r3, r3, #0xF
	CMP r3, #0xA
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xB
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xC
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xD
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xE
	BEQ reset_truck_ptr			; Yes: run routine to randomly generate another object

reset_truck_ptr:
	LDR r6, truck

	CMP r1, #0x1
	BEQ generate_car1			; Yes: generate car on top row
	CMP r1, #0x2
	BEQ generate_car2
	CMP r1, #0x3
	BEQ generate_truck1
	CMP r1, #0x5
	BEQ generate_truck2
	B leave

generate_car1:
	MOV r1, #0x43				; C
	MOV r2, #0x01EB
	MOVT r2, #0x2000
	LDRB r3, [r2]
	CMP r3, r1
	BEQ leave
	STRB r1, [r2]
	LDR r6, truck				; reset pointer to beginning of truck string
	B leave

generate_car2:
	MOV r1, #0x43				; C
	MOV r2, #0x027E
	MOVT r2, #0x2000
	LDRB r3, [r2]
	CMP r3, r1
	BEQ leave
	STRB r1, [r2]
	LDR r6, truck				; reset pointer to beginning of truck string
	B leave

generate_truck1:
	MOV r10, #0x01E6
	MOVT r10, #0x2000			; address of 1st row of trucks
	B generate_truck

generate_truck2:
	MOV r10, #0x0279
	MOVT r10, #0x2000			; address of 2nd row of trucks
	B generate_truck

generate_truck:
	LDRB r3, [r6]
	ADD r6, r6, #1				; Point to next byte in the string
	STRB r3, [r10]				; store byte

leave:
	BL restart_cursor
	BL displayBoard
    LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;--------------------------- interrupts ----------------------------------------------
; Handles interrupt when user presses keys on keyboard
UART0Handler:
	STMFD r13!, {r2, r4, lr}

	BL read_character
	MOV r9, r0					; store character into r9 for safekeeping
	CMP r9, #0x0D
	BEQ start
	CMP r9, #0x70
	BEQ restart					; Yes: restart game
	B exit_interrupt

start:
	BL illuminate_LEDs
	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED
	MOV r1, #4					; Lives = 4
	BL timer_init0A				; initialize timer setup & config
	BL restart_cursor			; Reposition cursor at beginning of terminal
	BL displayBoard				; Redisplay the board
	B exit_interrupt

restart:
	MOV r1, #4					; Lives = 4
	BL timer_init0A				; reinitialize the timer
	BL new_game					; restore clean board
	BL illuminate_LEDs
	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED
	LDR r8, head				; point back at head
	MOV r9, #0					; reset r9
	BL restart_cursor
	BL displayBoard


exit_interrupt:
	MOV r2, #0xC044
	MOVT r2, #0x4000
	LDRB r4, [r2]
	ORR r4, r4, #0x10				; Clears UART interrupt
	STRB r4, [r2]					; Write '1' to UARTIM RXIM Bit

stophandler:
	LDMFD r13!, {r2, r4, lr}
	BX lr

;------------------------ Timer0 Handler ------------------------------------------
Timer0AHandler:					; FROG
	STMFD r13!, {lr}

	;clear this interrupt first
	MOV r2, #0x0024
    MOVT r2, #0x4003			; r2 = 0x40030000
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address


	BL move_objects
	BL random
	BL game_play

	LDMFD r13!, {lr}
	BX lr

;--------------------------- new game ----------------------------------------------
; Restore empty game screen
new_game:
	STMFD SP!,{r5,lr}

	LDR r4, new_scr
	LDR r5, game_ptr

continue3:
	LDRB r0, [r4], #1			; load byte of game board
	CMP r0, #0x0				; did we reach null terminating string?
	BEQ complete3				; yes: done storing entire board
	STRB r0, [r5], #1			; no: store byte
	B continue3					; loop until done storing entire board

complete3:
	MOV r4, #0x08BA
	MOVT r4, #0x2000			; r4 = 0x200008BA (base address for score)
	MOV r0, #0x20				; 0x20 = ASCII SPACE
	STRB r0, [r4], #-1			; Store spaces to cover the old score
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1

	MOV r4, #0x0018
	MOVT r4, #0x2000
	MOV r0, #4
	STRB r0, [r4]				; Reset lives to 4

	LDMFD sp!, {r5,lr}
	mov pc, lr
;------------------------ Timer1 Handler ------------------------------------------
Timer0BHandler:					; MAP REFRESH
	STMFD r13!, {lr}

	;clear this interrupt first
	MOV r2, #0x1024
    MOVT r2, #0x4003			; r2 = 0x40031000
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

	LDMFD r13!, {lr}
	BX lr

;------------------------ Timer2 Handler ------------------------------------------
Timer2Handler:					; GAME TIME
	STMFD r13!, {lr}

	;clear this interrupt first
	MOV r2, #0x0024
    MOVT r2, #0x4003			; r2 = 0x40030000
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

	LDMFD r13!, {lr}
	BX lr

;------------------------ Timer3 Handler ------------------------------------------
Timer3Handler:					; FLY
	STMFD r13!, {lr}

	;clear this interrupt first
	MOV r2, #0x0024
    MOVT r2, #0x4003			; r2 = 0x40030000
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

	LDMFD r13!, {lr}
	BX lr
;------------------------- display board --------------------------------------------
; Display the game board onto PuTTy.
displayBoard:
	STMFD SP!,{r0, r4, lr}

	LDR r4, game_ptr

keepDisplaying:
	LDRB r0, [r4], #1			; load byte of game board
	CMP r0, #0x0				; did we reach null terminating string?
	BEQ boardDone				; yes: done displaying entire board
	BL output_character			; no: output game board byte
	B keepDisplaying			; loop until done displaying entire board

boardDone:
	LDMFD sp!, {r0, r4, lr}
	mov pc, lr

;--------------------------- start game ----------------------------------------------
; Display the game's starting screen
start_game:
	STMFD SP!,{r0, r4, lr}

	LDR r4, start_scr


continue:
	LDRB r0, [r4], #1			; load byte of game board
	CMP r0, #0x0				; did we reach null terminating string?
	BEQ complete				; yes: done displaying entire board
	BL output_character			; no: output game board byte
	B continue					; loop until done displaying entire board

complete:
	LDMFD sp!, {r0, r4, lr}
	mov pc, lr

;--------------------------- end game ----------------------------------------------
; Display the game's ending screen
end_game:
	STMFD SP!,{r0, r4, lr}

	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x32
	STRB r4, [r2]
	BL illuminate_RGB_LED
	LDR r4, end_scr

continue2:
	LDRB r0, [r4], #1			; load byte of game board
	CMP r0, #0x0				; did we reach null terminating string?
	BEQ complete2				; yes: done displaying entire board
	BL output_character			; no: output game board byte
	B continue2					; loop until done displaying entire board

complete2:

	LDMFD sp!, {r0, r4, lr}
	mov pc, lr

