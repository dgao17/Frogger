; Names: Carmen Tam (50194532) & Dee Gao (50244179)
; Baud Rate: 230,400

	.data
info:			.string " Timer:      Lives:      Level: 1   Score:     ", 0xD,0xA
top:			.string "|---------------------------------------------|", 0xD,0xA
Border1:		.string "|*********************************************|", 0xD,0xA
Border2:		.string "|******   *******   *******   *******   ******|", 0xD,0xA
Border3:		.string "|~~~~~~~~~~Aaaaaa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border4:		.string "|~~~~~~~~O~~~~~~~~~~~~~O~~~~~~~~O~~~~~~~~~~~~~|", 0xD,0xA
Border5:		.string "|~~~~~~~~~~~~~~~~~~LLLLLL~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
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

startscreen:	.string " Timer:      Lives:      Level: 0   Score:     ", 0xD,0xA
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
Border26:		.string "|       Use w, a, s, d to move the frog       |", 0xD,0xA
Border27:		.string "|         Press 'q' to quit the game!         |", 0xD,0xA
Border28:		.string "|                                             |", 0xD,0xA
bottom1:		.string "|---------------------------------------------|", 0,0xD,0xA

info2:			.string "|---------------------------------------------|", 0xD,0xA
top2:			.string "|                                             |", 0xD,0xA
Border30:		.string "|        ||||||  |||||  |\    //| ||||||      |", 0xD,0xA
Border31:		.string "|       ||      ||   || ||\\ //|| ||          |", 0xD,0xA
Border32:		.string "|       ||  ||| ||||||| || \// || ||||||      |", 0xD,0xA
Border33:		.string "|       ||   || ||   || ||     || ||          |", 0xD,0xA
Border34:		.string "|        |||||| ||   || ||     || ||||||      |", 0xD,0xA
Border35:		.string "|                                             |", 0xD,0xA
Border36:		.string "|        ||||| \\       // |||||| |||||       |", 0xD,0xA
Border37:		.string "|       ||   || \\     //  ||     |   ||      |", 0xD,0xA
Border38:		.string "|       ||   ||  \\   //   |||||| |||||       |", 0xD,0xA
Border39:		.string "|       ||   ||   \\ //    ||     || \\       |", 0xD,0xA
Border40:		.string "|        |||||     \_/     |||||| ||  \\      |", 0xD,0xA
Border41:		.string "|                 Score:                      |", 0xD,0xA
Border29:		.string "|                                             |", 0xD,0xA
Border42:		.string "|      PRESS 'n' TO RESTART OR 'q' TO QUIT    |", 0xD,0xA
bottom2:		.string " ---------------------------------------------|", 0, 0xD,0xA

info3:			.string " Timer:      Lives:      Level: 1   Score:     ", 0xD,0xA
top3:			.string "|---------------------------------------------|", 0xD,0xA
Border43:		.string "|*********************************************|", 0xD,0xA
Border44:		.string "|******   *******   *******   *******   ******|", 0xD,0xA
Border45:		.string "|~~~~~~~~~~Aaaaaa~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border46:		.string "|~~~~~~~~O~~~~~~~~~~~~~O~~~~~~~~O~~~~~~~~~~~~~|", 0xD,0xA
Border47:		.string "|~~~~~~~~~~~~~~~~~~LLLLLL~~~~~~~~~~~~~~~~~~~~~|", 0xD,0xA
Border48:		.string "|~~~~~~~~~~~~TT~~~~~~~~~~~~~~~TT~~~~~~~~TT~~~~|", 0xD,0xA
Border49:		.string "|.............................................|", 0xD,0xA
Border50:		.string "|                                  ####       |", 0xD,0xA
Border51:		.string "|       C                 C                   |", 0xD,0xA
Border52:		.string "|                                             |", 0xD,0xA
Border53:		.string "|                           ####              |", 0xD,0xA
Border54:		.string "|          C                                  |", 0xD,0xA
Border55:		.string "|                                             |", 0xD,0xA
Border56:		.string "|.............................................|", 0xD,0xA
bottom3:		.string "|---------------------------------------------|", 0,0xD,0xA

trucks: 		.string "#### ", 0
alligators:		.string "Aaaaaaa", 0
turtles: 		.string " TT", 0
gameState:      .string "0", 0
level:			.string "0", 0
wins:			.string "0", 0
instructions:	.string 0xD, 0xA ," Objective: Get 2 frogs home while avoiding", 0xD, 0xA,  " cars, trucks, and alligator mouths to advance", 0xD, 0xA,  " to the next level"
points1:		.string 0xD, 0xA, " Moving up: 10 points"
points2:		.string 0xD, 0xA, " Safely getting a frog home: 50 points"
points3:		.string 0xD, 0xA, " Each second of unused time: 10 points"
points4: 		.string 0xD, 0xA, " Eating a fly: 100 points"
points5:		.string 0xD, 0xA, " Increasing to the next level: 250", 0

paused:			.string "|---------------------------------------------|", 0xD,0xA
top4:			.string "|                                             |", 0xD,0xA
Border57:		.string "|    |||||   ||||  ||   ||  |||||   ||||||    |", 0xD,0xA
Border58:		.string "|    ||  || ||  || ||   || ||   ||  ||        |", 0xD,0xA
Border59:		.string "|    ||  || ||  || ||   ||  |||     ||        |", 0xD,0xA
Border60:		.string "|    |||||  |||||| ||   ||    |||   ||||||    |", 0xD,0xA
Border61:		.string "|    ||     ||  || ||   ||      ||  ||        |", 0xD,0xA
Border62:		.string "|    ||     ||  || ||   || ||    || ||        |", 0xD,0xA
Border63:		.string "|    ||     ||  ||  |||||   ||||||  ||||||    |", 0xD,0xA
Border64:		.string "|    =====================================    |", 0xD,0xA
Border65:		.string "|        PRESS 'A' ON KEYPAD TO RESUME        |", 0xD,0xA
Border66:		.string "|    =====================================    |", 0xD,0xA
Border67:		.string "|                                             |", 0xD,0xA
Border68:		.string "|                                             |", 0xD,0xA
Border69:		.string "|                                             |", 0xD,0xA
Border70:		.string "|                                             |", 0xD,0xA
bottom4:		.string " ---------------------------------------------|", 0, 0xD,0xA

quit:			.string "|---------------------------------------------|", 0xD,0xA
top5:			.string "|                                             |", 0xD,0xA
Border71:		.string "|    |||||  ||||||  |||||   ||||||  ||||||    |", 0xD,0xA
Border72:		.string "|    ||  || ||     ||   || ||    || ||        |", 0xD,0xA
Border73:		.string "|    ||  || ||     ||   || ||       ||        |", 0xD,0xA
Border74:		.string "|    |||||  |||||| ||||||| ||       ||||||    |", 0xD,0xA
Border75:		.string "|    ||     ||     ||   || ||       ||        |", 0xD,0xA
Border76:		.string "|    ||     ||     ||   || ||    || ||        |", 0xD,0xA
Border77:		.string "|    ||     |||||| ||   ||  ||||||  ||||||    |", 0xD,0xA
Border78:		.string "|    =====================================    |", 0xD,0xA
Border79:		.string "|                                             |", 0xD,0xA
Border80:		.string "|            THANK YOU FOR PLAYING!           |", 0xD,0xA
Border81:		.string "|                                             |", 0xD,0xA
Border82:		.string "|                                             |", 0xD,0xA
Border83:		.string "|                                             |", 0xD,0xA
Border84:		.string "|                                             |", 0xD,0xA
bottom5:		.string " ---------------------------------------------|", 0, 0xD,0xA



	.text
	.global uart_init
	.global timer_init
	.global GPIO_init
	.global output_character
	.global read_character
	.global output_string
	.global int_to_string
	.global PortAHandler
	.global UART0Handler
	.global Timer0Handler
	.global Timer1Handler
	.global Timer2Handler
	.global fly_using_mod
	.global game_play
	.global end_game
	.global start_game
	.global stop_game
	.global new_game
	.global read_from_keypad
	.global continue_game
	.global pause_game
	.global resume_game
	.global restart_cursor
	.global display_prompt
	.global displayBoard
	.global displayTime
	.global displayScore
	.global displayScore2
	.global illuminate_LEDs
	.global display_instructions
	.global random
	.global random_turtle
	.global random_frog_position
	.global random_lilypad
	.global random_log
	.global random_fly
	.global random_alligator
	.global move_objects
	.global move_alligator_row
	.global move_lilypad_row
	.global move_log_row
	.global move_turtle_row
	.global illuminate_RGB_LED
	.global lab7
	.global library_lab_7


game_ptr: 		.word info
end_scr: 		.word info2
new_scr: 		.word info3
start_scr: 		.word startscreen
paused_game:	.word paused
quit_game:		.word quit
head: 			.word 0x200002F6
fly: 			.word 0x20000094
game_board: 	.word Border3
truck: 			.word trucks
turtle: 		.word turtles
lives: 			.word 0x20000014
lives2: 		.word 0x200009DA
score: 			.word 0x2000002d
score2: 		.word 0x20000919
level_num: 		.word level
win_score: 		.word wins
instruct:		.word instructions
points_1: 		.word points1
points_2:		.word points2
points_3: 		.word points3
points_4:		.word points4
points_5:		.word points5

lab7:
	STMFD sp!, {lr}

	BL uart_init				; initialize the UART
	BL GPIO_init				; initialize the GPIO
	BL illuminate_RGB_LED

	BL start_game				; Display Frogger's starting screen
	LDR r8, head				; address of frog in beginning of game

	LDR r4, game_board			; 0x200001BA
	ADD r4, r4, #1				; Address of top left corner of the road area (not the border, the space)

	LDR r6, truck				; truck string address: 0xD08
	MOV r11, #60				; Level 1 = 60 seconds

	LDMFD sp!, {lr}
	mov pc, lr

;----------------------------- Port A Handler ---------------------------------------------------------
; Handles keypad input to pause/resume the game upon press '1' for pause and 'A' for resume.
PortAHandler:
	STMFD sp!, {r3, r4, lr}

	BL read_from_keypad					; Read user input
	CMP r3, #0x4						; Was '1' pressed?
	BEQ pause_game_now					; Yes: pause the game

	CMP r3, #0x20						; Was 'A' pressed?
	BEQ resume_game_now					; Yes: resume the game

	B stop_GPIO							; Neither: exit the interrupt

pause_game_now:							; Pauses the game
	BL pause_game
	BL restart_cursor
	LDR r4, paused_game
	BL display_prompt
	BL restart_cursor
	B stop_GPIO

resume_game_now:						; Resumes the game
	BL resume_game
	BL restart_cursor
	B stop_GPIO

stop_GPIO:								; Exit interrupt
	MOV r2, #0x441C
	MOVT r2, #0x4000
	LDRB r1, [r2]
	ORR r1, r1, #0xFF				; Clears keypad interrupt (PortA pins 2-5)
	STRB r1, [r2]					; Write '1' to pin on port A

	LDMFD sp!, {r3, r4, lr}
	BX lr

;--------------------------- interrupts ------------------------------------------------------------------
; Handles interrupt when user presses keys on keyboard
UART0Handler:
	STMFD sp!, {r1-r2, r4, lr}

	BL read_character			; Read user input
	MOV r9, r0					; store character into r9 for safekeeping

	CMP r9, #0x0D				; Enter: start game
	BEQ start
	CMP r9, #0x6E				; n: new game
	BEQ restart
	CMP r9, #0x71
	BEQ quit_Game
    CMP r9, #0x70
	BEQ pause_Game
	CMP r9, #0x72
	BEQ resume_Game
	B exit_interrupt

start:
	MOV r5, #0

	BL illuminate_LEDs
	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED

	BL timer_init				; initialize timer setup & config
	BL restart_cursor			; Reposition cursor at beginning of terminal
	BL displayBoard				; Redisplay the board
	B exit_interrupt

pause_Game:
	BL pause_game
	BL restart_cursor
	LDR r4, paused_game
	BL display_prompt
	BL restart_cursor
	B exit_interrupt

resume_Game:
	BL resume_game
	BL restart_cursor
	B exit_interrupt

restart:
	BL new_game					; restore clean board
	MOV r1, #0x34				; Lives = 4
	MOV r2, #0x0014
    MOVT r2, #0x2000
    STRB r1, [r2]				; Reset lives for display

	BL timer_init				; reinitialize the timer
	MOV r5, #0
	BL displayScore

	BL random_frog_position
	BL illuminate_LEDs
	MOV r2, #0x0D0F
	MOVT r2, #0x2000
	MOV r4, #0x31
	STRB r4, [r2]
	BL illuminate_RGB_LED
	MOV r9, #0					; reset r9
	MOV r7, #0					; reset score
	MOV r11, #60
	BL restart_cursor
	BL displayBoard
	B exit_interrupt

quit_Game:
	BL restart_cursor
	LDR r4, quit_game
	BL display_prompt
	BL restart_cursor
	B exit_interrupt

exit_interrupt:
	MOV r2, #0xC044
	MOVT r2, #0x4000
	LDRB r4, [r2]
	ORR r4, r4, #0x10				; Clears UART interrupt
	STRB r4, [r2]					; Write '1' to UARTIM RXIM Bit

stophandler:
	LDMFD sp!, {r1-r2, r4, lr}
	BX lr

;------------------------ Remove Frog for restart game--------------------------------------------
clear_Frog_loop:					; Clear the H's on the home row for new level
	STMFD sp!, {r1-r2,lr}

	MOV r1, #0x0094				; Base address of home row
	MOVT r1, #0x2000

	LDRB r2, [r1]
	CMP r2, #0x7C				; Is it a border?
	BEQ next_row				; Yes: then, we're done clearing &'s

next_row:
	ADD r1, r1, #49				; Next row

	CMP r2, #0x2B				; Is it a H?
	BEQ clear_Home				; Yes: erase it
	ADD r1, r1, #1				; Point to next byte on row
	B clear_Frog_loop			; Continue checking each byte

clear_Frog:
	MOV r2, #0x20				; Replace H with a space
	STRB r2, [r1]
	ADD r1, r1, #1
	B clear_Frog_loop

	LDMFD sp!, {r1-r2, lr}
	mov pc, lr

;------------------------ Timer0 Handler ----------------------------------------------------------
Timer0Handler:					; FROG
	STMFD sp!, {r1,lr}

	;clear this interrupt first
	MOV r2, #0x0024
    MOVT r2, #0x4003			; r2 = 0x40030024
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

	BL game_play
	BL restart_cursor
	BL move_objects
	BL random

	LDMFD sp!, {r1,lr}
	BX lr

;------------------------ Timer1 Handler ----------------------------------------------------------
Timer1Handler:					; MAP REFRESH
	STMFD sp!, {lr}

	;clear this interrupt first
	MOV r2, #0x1024
    MOVT r2, #0x4003			; r2 = 0x40031024
    LDR r1, [r2]				; Loads in the value in address r2 into r1
    ORR r1, r1, #0x1			; Changes r1 to #1
    STR r1, [r2]				; Stores back into the address

    BL move_alligator_row
    BL move_lilypad_row
    BL move_log_row
    BL move_turtle_row
    BL random_turtle
    BL random_log
    BL random_lilypad
    BL random_alligator
	BL restart_cursor
    BL displayBoard

	LDMFD sp!, {lr}
	BX lr

;------------------------ Timer2 Handler -----------------------------------------------------------
; r11 IS THE GAME TIMER. DON'T TOUCH
Timer2Handler:					; GAME TIME
	STMFD r13!, {r1-r2, r4, r6, r7, r8, r10, lr}

	;clear this interrupt first
	MOV r2, #0x2024
    MOVT r2, #0x4003			; r2 = 0x40030000
    LDR r4, [r2]				; Loads in the value in address r2 into r1
    ORR r4, r4, #0x1			; Changes r4 to #1
    STR r4, [r2]				; Stores back into the address

	MOV r7, r11

	CMP r7, #60
	BEQ spawn_fly
	CMP r7, #45
	BEQ spawn_fly
	CMP r7, #30
	BEQ spawn_fly
	CMP r7, #20
	BEQ spawn_fly
	CMP r7, #10
	BEQ spawn_fly

	B continue_timer2

spawn_fly:
	BL fly_using_mod


continue_timer2:

	MOV r1, #0x0094				; Base address of home row
	MOVT r1, #0x2000
	BL displayTime

	CMP r7, #55
	BEQ clear_Home_loop
	CMP r7, #40
	BEQ clear_Home_loop
	CMP r7, #25
	BEQ clear_Home_loop
	CMP r7, #15
	BEQ clear_Home_loop
	CMP r7, #5
	BEQ clear_Home_loop

	B end_the_second

clear_Home_loop:				; Clear the H's on the home row for new level
	LDRB r2, [r1]
	CMP r2, #0x7C				; Is it a border?
	BEQ end_the_second			; Yes: then, we're done clearing H's

	CMP r2, #0x2B				; Is it a +?
	BEQ clear_Home				; Yes: erase it
	ADD r1, r1, #1				; Point to next byte on row
	B clear_Home_loop			; Continue checking each byte

clear_Home:
	LDRB r2, [r1, #1]			; Check if this space is occupied
	CMP r2, #0x48				; Is there an H next to fly?
	BEQ put_H_back
	MOV r2, #0x20				; Replace H with a space
	STRB r2, [r1]
	ADD r1, r1, #1
	B clear_Home_loop

put_H_back:
	MOV r2, #0x48
	STRB r2, [r1]
	ADD r1, r1, #1

end_the_second:
	LDMFD r13!, {r1-r2, r4, r6, r7, r8, r10, lr}
	BX lr

;-------------------------------------- new game ------------------------------------------------------------
; Restore empty game screen
new_game:
	STMFD SP!,{r0, r4-r5,lr}

	LDR r4, new_scr				; #0x9C6
	LDR r5, game_ptr

continue3:
	LDRB r0, [r4], #1			; load byte of game board
	CMP r0, #0x0				; did we reach null terminating string?
	BEQ complete3				; yes: done storing entire board
	STRB r0, [r5], #1			; no: store byte
	B continue3					; loop until done storing entire board

complete3:
	MOV r4, #0x08BD
	MOVT r4, #0x2000			; r4 = 0x200008BD (base address for score)
	MOV r0, #0x20				; 0x20 = ASCII SPACE
	STRB r0, [r4], #-1			; Store spaces to cover the old score
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1
	STRB r0, [r4], #-1

	LDMFD sp!, {r0, r4-r5,lr}
	mov pc, lr

;------------------------------------- display board ------------------------------------------------------
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

;-------------------------------------display time ------------------------------------------------------
; Displays the time left on the top left corner of the game board.
displayTime:
	STMFD SP!,{r7-r8, r4, lr}

	MOV r4, #0x0009
	MOVT r4, #0x2000			; address where game time is displayed
	MOV r7, r11
	CMP r7, #0					; Is time = 0?
	BEQ timeOver
	MOV r8, #0					; counter for # of digits the answer contains

div:
	BL int_to_string			; Branch to int_to_string
	STRB r3, [r4], #-1			; Store num into memory backwards (b/c answer comes out backwards)
	ADD r8, r8, #1				; increment counter
	CMP r7, #0					; Is quotient = 0?
	BNE div						; No: branch back to div again

	SUB r11, r11, #1
	CMP r11, #9
	BLT add_zero_in_front
	B leave_displayTime

add_zero_in_front:
	MOV r3, #0x20
	STRB r3, [r4]
	B leave_displayTime

timeOver:
	BL output_string

leave_displayTime:
	LDMFD sp!, {r7-r8, r4, lr}
	mov pc, lr

;---------------------------------- start game -----------------------------------------------------------------
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
	LDR r4, lives				; address of where the # of lives is displayed
	MOV r0, #0x34				; r0 = 4 ASCII
	STRB r0, [r4]				; Set lives to 4 at the start of the game
	LDR r4, lives2				; Store lives into new screen place too
	STRB r0, [r4]

	BL display_instructions

	LDMFD sp!, {r0, r4, lr}
	mov pc, lr


;--------------------------------- display instructions -------------------------------------------------------
; Displays the instructions of the game below the game board for the user at the beginning of the game
display_instructions:
	STMFD sp!, {r4, lr}

	LDR r4, instruct
	BL display_prompt

	LDMFD sp!, {r4, lr}
	mov pc, lr

;--------------------------- end game ----------------------------------------------
; Display the game's ending screen
end_game:
	STMFD SP!,{r0-r2, r4, lr}

	MOV r2, #0x000C					; Disable the timer 0
    MOVT r2, #0x4003					; r2 = 0x4003000C
    LDRB r1, [r2]
    BIC r1, r1, #0x1					; Clear bit 0
    STRB r1, [r2]

    MOV r2, #0x100C						; Disable the timer 1
    MOVT r2, #0x4003					; r2 = 0x4003100C
    LDRB r1, [r2]
    BIC r1, r1, #0x1					; Clear bit 0
    STRB r1, [r2]

    MOV r2, #0x200C						; Disable the timer 2
    MOVT r2, #0x4003					; r2 = 0x4003200C
    LDRB r1, [r2]
    BIC r1, r1, #0x1					; Clear bit 0
    STRB r1, [r2]

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
	MOV r2, #0x0014
    MOVT r2, #0x2000					; 0x20000014
	LDRB r1, [r2]
	SUB r1, r1, #1
	STRB r1, [r2]						; Decrement lives
	LDR r2, lives2
	LDRB r1, [r2]
	SUB r1, r1, #1
	STRB r1, [r2]

	BL illuminate_LEDs

	LDMFD sp!, {r0-r2, r4, lr}
	mov pc, lr

;----------------------------------------- random -----------------------------------------------
random:
	STMFD SP!,{r1-r3, lr}		; Store register lr on stack

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r3, [r2]
    CMP r3, #0x31				; Is game in play? (green)
    BNE leave_random

	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	; Did we finish printing truck?
    MOV r3, r6
	AND r3, r3, #0xF
	CMP r3, #0x9
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xA
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xB
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xC
	BEQ generate_truck			; No: keep printing truck
	CMP r3, #0xD
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
	CMP r1, #0x6
	BEQ generate_car1
	CMP r1, #0x7
	BEQ generate_car1
	CMP r1, #0x8
	BEQ generate_car2
	CMP r1, #0x9
	BEQ generate_car2
	CMP r1, #0xA
	BEQ generate_truck1
	CMP r1, #0xB
	BEQ generate_truck2
	CMP r1, #0xC
	BEQ generate_truck1
	CMP r1, #0xD
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

leave_random:
    LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;--------------------------------- random frog position ---------------------------------------------------------
; Generates a random frog on the baseline for new rounds of the game (after a life is lost or the game restarted)
random_frog_position:
	STMFD sp!, {r1-r4, lr}

	; Getting a random #
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate LSB

	LDR r8, head
	AND r3, r8, #0xF			; Isolate LSB of frog address
	CMP r1, r3
	BGT right
	B left

right:
	ADD r8, r8, r1
	MOV r4, #0x26
	STRB r4, [r8]
	B leave_random_frog_pos

left:
	SUB r8, r8, r1
	MOV r4, #0x26
	STRB r4, [r8]

leave_random_frog_pos:
	BL restart_cursor
    BL displayBoard
	LDMFD sp!, {r1-r4, lr}
	mov pc, lr

;---------------------------------- random fly ------------------------------------------------------------------
; Generates a random fly on the home bases throughout the game
fly_using_mod:
	STMFD sp!, {r1-r10, lr}
	; Getting a random #
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate LSB

	LDR r8, fly
	AND r3, r8, #0xF			; Isolate LSB of frog address

	SUB r7, r7, r3
; Clear the registers & copy needed variables to new registers
    MOV r6, #0          	; r6 = counter
    MOV r5, #0          	; r5 = remainder
	MOV r3, #0
	MOV r12, #4

    ADD r6, r6, #15     	; initialize r6 (counter) to 15
    MOV r2, #0          	; r2 = quotient, initialize quotient to 0
    LSL r12, r12, #15     	; Logical Left Shift Divisor 15 places
    MOV r5, r7          	; Initialize Remainder to Dividend
    B LOOPS              	; Branch to LOOP5

SUBTRACTT:
	SUB r6, r6, #1			; Decrement counter
    B LOOPS              	; Branch to LOOP5

LOOPS:
    SUB r5, r5, r12      	; Remainder:= Remainder (r5) - Divisor (r0)
    CMP r5, #0          	; Is remainder < 0 ?
    BLT YESS             	; If true, branch to YES
    LSL r2, r2, #1      	; If false, Left Shift Quotient
    ADD r2, r2, #1      	; LSB = 1
    B CHECKK             	; Branch to CHECK

YESS:
    ADD r5, r5, r12      	; Remainder:= Remainder (r5) + Divisor (r0)
    LSL r2, r2, #1      	; Left Shift Quotient

CHECKK:
	LSR r12, r12, #1      	; Right Shift Divisor
    CMP r6, #0         		; Is counter > 0 ?
    BGT SUBTRACTT

	MOV r7, r2				; copy quotient to r7

ENDD:
	MOV r10, r5				; copy remainder to r10

	CMP r10, #0
	BEQ first_fly_pos
	CMP r10, #1
	BEQ second_fly_pos
	CMP r10, #2
	BEQ third_fly_pos
	CMP r10, #3
	BEQ fourth_fly_pos
	B end_placement

first_fly_pos:
	MOV r2, #0x009b
    MOVT r2, #0x2000
    LDRB r1, [r2, #1]			; Check if home base is empty
    CMP r1, #0x48				; Is there an H?
    BEQ second_fly_pos			; Spawn fly at next home base
    MOV r1, #0x2B
    STRB r1, [r2]
	B end_placement

second_fly_pos:
	MOV r2, #0x00a5
    MOVT r2, #0x2000
    LDRB r1, [r2, #1]			; Check if home base is empty
    CMP r1, #0x48				; Is there an H?
    BEQ third_fly_pos			; Spawn fly at next home base
    MOV r1, #0x2B
    STRB r1, [r2]
	B end_placement

third_fly_pos:
	MOV r2, #0x00af
    MOVT r2, #0x2000
    LDRB r1, [r2, #1]			; Check if home base is empty
    CMP r1, #0x48				; Is there an H?
    BEQ fourth_fly_pos			; Spawn fly at next home base
    MOV r1, #0x2B
    STRB r1, [r2]
	B end_placement

fourth_fly_pos:
	MOV r2, #0x00b9
    MOVT r2, #0x2000
    LDRB r1, [r2, #1]			; Check if home base is empty
    CMP r1, #0x48				; Is there an H?
    BEQ first_fly_pos			; Spawn fly at next home base
    MOV r1, #0x2B
    STRB r1, [r2]
	B end_placement

end_placement:

	LDMFD sp!, {r1-r10, lr}
;--------------------- random turtle ---------------------------------------------------------------------
; Generates a random turtle  on the lake
random_turtle:
	STMFD sp!, {r1-r3, lr}

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r1, [r2]
    CMP r1, #0x31				; Is game in play? (green)
    BNE leave_random_turtle		; No: don't run random generator

	MOV r2, #0x015A
	MOVT r2, #0x2000			; 6th spot over, log head
	LDRB r1, [r2]				; Check if we were still generating a turtle from previous refresh
	CMP r1, #0x54				; Is it a T?
	BEQ add_water				; Add water to the left of it


get_random_turtle:
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	CMP r1, #0x4				; Is it less than 4? (Could be 3, 2, 1, 0) ~ 15%
	BLT generate_turtle
	B leave_random_turtle

generate_turtle:
	MOV r3, #0x54				; r3 = T
	MOV r2, #0x0158
	MOVT r2, #0x2000
	STRB r3, [r2]				; Generate T onto map
	B leave_random_turtle

add_water:
	MOV r3, #0x7E				; Once turtle is done generating (2 T's), add water next
	STRB r3, [r2, #-2]
	B leave_random_turtle

leave_random_turtle:
	BL restart_cursor
    BL displayBoard
	LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;--------------------------------- random log -----------------------------------------------------------
; Generates a log randomly throughout the game.
random_log:
	STMFD sp!, {r1-r3, lr}

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r1, [r2]
    CMP r1, #0x31				; Is game in play? (green)
    BNE leave_random_log		; No: don't run random generator

	MOV r2, #0x014D
	MOVT r2, #0x2000			; 2nd spot over
	LDRB r1, [r2]				; Check if we were still generating a log from previous refresh
	CMP r1, #0x4C				; Is it a L?
	BEQ add_water2				; Add water to the left of it
	LDRB r1, [r2, #1]!
	CMP r1, #0x4C				; 3rd spot
	BEQ leave_random_log
	LDRB r1, [r2, #1]!
	CMP r1, #0x4C				; 4th
	BEQ leave_random_log
	LDRB r1, [r2, #1]!
	CMP r1, #0x4C				; 5th
	BEQ leave_random_log
	LDRB r1, [r2, #1]!
	CMP r1, #0x4C				; 6th
	BEQ leave_random_log
	LDRB r1, [r2, #1]!
	CMP r1, #0x4C				; 7th
	BEQ leave_random_log

get_random_log:
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	CMP r1, #0x7				; Is it less than 3? (Could be 2, 1, 0) ~ 15%
	BLT generate_log
	B leave_random_log

generate_log:
	MOV r3, #0x4C				; r3 = L
	MOV r2, #0x0153
	MOVT r2, #0x2000
	STRB r3, [r2]				; Generate L onto map
	B leave_random_log

add_water2:						; Add water after the log is done generating
	MOV r3, #0x7E
	STRB r3, [r2, #6]
	B leave_random_log

leave_random_log:
	BL restart_cursor
    BL displayBoard
	LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;--------------------------------------- generate random lilypads -----------------------------------
; Generates a log randomly throughout the game.
random_lilypad:
	STMFD sp!, {r1-r3, lr}

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r1, [r2]
    CMP r1, #0x31				; Is game in play? (green)
    BNE leave_random_lilypad	; No: don't run random generator

	MOV r2, #0x00F7
	MOVT r2, #0x2000
	LDRB r1, [r2]				; Check if we were still generating a turtle from previous refresh
	CMP r1, #0x4F				; Is it an O?
	BEQ add_water3				; Add water to the left of it

get_random_lilypad:
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	CMP r1, #0x5				; Is it less than 4? (Could be 3, 2, 1, 0) ~ 15%
	BLT generate_lilypad
	B leave_random_lilypad

generate_lilypad:
	MOV r3, #0x4F				; r3 = O
	MOV r2, #0x00F6
	MOVT r2, #0x2000
	STRB r3, [r2]				; Generate O onto map
	B leave_random_turtle

add_water3:						;
	MOV r3, #0x7E
	STRB r3, [r2, #-1]
	B leave_random_turtle

leave_random_lilypad:
	BL restart_cursor
    BL displayBoard
	LDMFD sp!, {r1-r3, lr}
	mov pc, lr

;-------------------------- random alligator -----------------------------------------------------------
; Generates an alligator randomly throughout the game.
random_alligator:
	STMFD sp!, {r1-r3, lr}

	MOV r2, #0x0D0F				; Check state of game
    MOVT r2, #0x2000
    LDRB r1, [r2]
    CMP r1, #0x31				; Is game in play? (green)
    BNE leave_random_log		; No: don't run random generator

	MOV r2, #0x0EB
	MOVT r2, #0x2000			; 2nd spot over
	LDRB r1, [r2]				; Check if we were still generating a log from previous refresh
	CMP r1, #0x41				; Is it a A?
	BEQ add_water4				; Add water to the left of it
	LDRB r1, [r2, #1]
	CMP r1, #0x61				; 3rd spot
	BEQ leave_random_gator
	LDRB r1, [r2, #2]
	CMP r1, #0x61				; 4th
	BEQ leave_random_gator
	LDRB r1, [r2, #3]
	CMP r1, #0x61				; 5th
	BEQ leave_random_gator
	LDRB r1, [r2, #4]
	CMP r1, #0x61				; 6th
	BEQ leave_random_gator
	LDRB r1, [r2, #5]
	CMP r1, #0x61				; 7th
	BEQ leave_random_gator
	LDRB r1, [r2, #6]
	CMP r1, #0x61				; 7th
	BEQ leave_random_gator

get_random_gator:
	MOV r2, #0x0048				; set interrupt interval
    MOVT r2, #0x4003			; r2 = 0x40030028
    LDR r1, [r2]				; Load whole word (random value)
    AND r1, r1, #0xF			; Isolate byte

	CMP r1, #0x5				; Is it less than 3? (Could be 2, 1, 0) ~ 15%
	BLT generate_gator
	B leave_random_gator

generate_gator:
	MOV r2, #0x00F1
	MOVT r2, #0x2000
	LDRB r1, [r2, #-1]			; Load byte
	CMP r1, #0x41				; Did we generate head of alligator already?
	BEQ generate_gator_body
	MOV r3, #0x41				; r3 = A
	STRB r3, [r2]
	B leave_random_gator

generate_gator_body:
	MOV r3, #0x61				; r3 = a
	STRB r3, [r2]				; Generate A onto map
	B leave_random_gator

add_water4:						; Adds water to the end of the gator once it's done generating
	MOV r3, #0x7E
	STRB r3, [r2, #6]
	B leave_random_gator

leave_random_gator:
	BL restart_cursor
    BL displayBoard
	LDMFD sp!, {r1-r3, lr}
	mov pc, lr

	.end
