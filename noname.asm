assume cs:text, ds:data
text segment 'code'
dely proc 
; Процедура задержки
	push cx
	push bx
	push bp
	push ax
	push dx
	mov cx, time					; Количество повторений цикла задержки	
	zd:	
		push cx
		mov bp, 0
		mov bx, 1
		cikl1:
			inc bp
			mov ah, 00h				; Функция BIOS для работы с таймером
			int 1Ah			
			cmp bp, 1
			je ii					; Переходим на метку ii на первой итерации цикла
			jmp ii1					; На следующих итерациях переходим на метку ii1
		ii:
			add bx, dx				; Формируем значение на единицу больше, чем в регистре dx
		ii1:
			cmp bx, dx				; Если значение в регистре dx не изменилось
			jne cikl1				; То новая итерация цикла
			pop cx
	loop zd
	pop cx
	pop bx
	pop bp
	pop ax
	pop dx
	ret
dely endp
cube_front proc 
; Процедура, рисующая квадрат определенного цвета
	mov ah, 0ch 						
	mov bh, 0 				
	mov al, color 		
	mov si, 50 				
	push dx 						; Помещаем координату Y в стек
	front_width:
		push cx 					; Помещаем координату Х в стек
		mov bl,50 					; Устанавливаем длину
		front_line:		
			int 10h 		
			inc cx 					; Увеличиваем координату Х
			dec bl 					; Уменьшаем длину 
			cmp bl, 0 				; Сравниваем BL с нулем
		jne front_line 		
	cmp si, 0 						; Если SI=0
	je front_exit 					; Переход на front_exit
	dec si 					
	pop cx 							; Считываем координату X из стека
	inc dx 							; Увеличиваем координату Y
	jmp front_width 		
	front_exit:
		pop cx 						; Считываем координату X из стека
		pop dx 						; Считываем координату Y из стека
		ret
cube_front endp	

algoritm1 proc
; Процедура, реализующая алгоритм 1
; Модель меняет состояния по кругу 

	mov ah, 0ch 					; Функция вывода пискселя
	mov bh, 0 				
	mov al, color 			
		alg:
			mov color, 2			; Устанавливаем цвета
			mov cx, 200				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y 
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x1					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x1:							
			inc time_count		; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 200				
			mov dx, 110				
			call cube_front						
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh			
			int 21h					
			call check				; Да, выход из алгоритма 			
			mov ah, 0ch				; Функция считывания символа с клавиатуры
			int 21h
			mov color, 2			; Устанавливаем цвета
			mov cx, 300				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y  
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x2					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x2:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 300
			mov dx, 110
			call cube_front			
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh			
			int 21h
			call check				; Да, выход из алгоритма 
			mov ah, 0ch
			int 21h
			mov color, 2			; Устанавливаем цвета
			mov cx, 400				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y  
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x3					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x3:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 400
			mov dx, 110
			call cube_front
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма	
			mov ah, 0ch
			int 21h
			mov color, 2			; Устанавливаем цвета
			mov cx, 350				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y  
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x4					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x4:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 350
			mov dx, 210
			call cube_front
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма
			mov ah, 0ch
			int 21h
			mov color, 2			; Устанавливаем цвета
			mov cx, 250				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y  
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x5					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x5:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 250
			mov dx, 210
			call cube_front
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма 
			mov ah, 0ch
			int 21h
			jmp alg					; Начинаем алгоритм заново
algoritm1 endp			
			
algoritm2 proc						
; Процедура, реализующая алгоритм 2
; Модель меняет состояния зигзагом(буквой W)

	mov ah, 0ch 					; Функция вывода пискселя
	mov bh, 0 				
	mov al, color 			
	mov bl, 2				
		alg2:
			mov color, 2			; Устанавливаем цвет
			mov cx, 200				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату У	
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x6					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x6:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 200
			mov dx, 110
			call cube_front	
			mov ah, 06h				; Функция ввода без ожидания
			mov dl, 0FFh			
			int 21h	
			call check				; Да, выход из алгоритма
			mov color, 2			; Устанавливаем цвет			
			mov cx, 250				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата	
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x7					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x7:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 250
			mov dx, 210
			call cube_front			
			mov ah, 06h				; Функция ввода без ожидания				
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма
			mov color, 2			; Устанавливаем цвет
			mov cx, 300				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x8					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x8:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 300				
			mov dx, 110
			call cube_front				
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма		
			mov color, 2			; Устанавливаем цвет
			mov cx, 350				; Устанавливаем координату Y
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x9					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x9:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 350				
			mov dx, 210
			call cube_front
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма					
			mov color, 2			; Устанавливаем цвет
			mov cx, 400				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x10					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x10:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 400
			mov dx, 110
			call cube_front			
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh			
			int 21h
			call check				; Да, выход из алгоритма			
			mov color, 2			; Устанавливаем цвет
			mov cx, 350				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?	
			jne x11					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x11:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 350				
			mov dx, 210
			call cube_front			
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh	
			int 21h
			call check				; Да, выход из алгоритма			
			mov color, 2			; Устанавливаем цвет
			mov cx, 300				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x12					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x12:
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4			
			mov cx, 300
			mov dx, 110
			call cube_front
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма				
			mov color, 2			; Устанавливаем цвет
			mov cx, 250				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Меняем цвет квадрата
			call dely				; Задержка
			cmp time_count, 15		; Прошло 15 секунд?
			jne x13					; Нет, продолжаем алгоритм
			call question			; Да, выходим из алгоритма
		x13:						
			inc time_count			; Увеличиваем счетчик времени
			mov color, 4
			mov cx, 250
			mov dx, 210
			call cube_front			
			mov ah, 06h				; Функция ввода без ожидания			
			mov dl, 0FFh
			int 21h
			call check				; Да, выход из алгоритма			
			jmp alg2				; Начинаем алгоритм заново
algoritm2 endp

main proc
			mov ax, data
			mov ds, ax
			mov ah, 00h 			; Функция задания режима
			mov al, 10h 			; Графический режим EGA
			int 10h
			call question
question proc
; Процедура, реализующая взаимодействие с клавиатурой
; Вызов первого, второго алгоритма, либо выход  из программы 
		advanced:	
			mov color, 4 			; Устанавливаем цвет
			mov cx, 200				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Рисуем квадрат

			mov cx, 300 			; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Рисуем квадрат
	
			mov cx, 400				; Устанавливаем координату Х
			mov dx, 110				; Устанавливаем координату Y
			call cube_front			; Рисуем квадрат
	
			mov cx, 250				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Рисуем квадрат
		
			mov cx, 350				; Устанавливаем координату Х
			mov dx, 210				; Устанавливаем координату Y
			call cube_front			; Рисуем квадрат
			mov time_count, 1		; Сбрасываем счетчик времени

			mov ah, 0Ch				
			mov AL,08h		    	; Функция ввода без эха
			int 21h							
			cmp AL, 0   			; Значение регистра AL = 0?
			je analize				; Да, 
			jmp advanced			; Нете
		analize:
			mov ah, 08h				; Функция ввода без эха
			int 21h
			cmp al, 44h 			; Нажали F10?
			je exit					; Да, выходим из программы
			cmp AL,3Bh				; Нажали F1?
			je a1  					; Переход на мету а1 (алгоритм 1)
			cmp AL,3Ch				; Нажали F2?
			je a2					; Переход на метку а2 (алгоритм 2)
			jmp advanced 			
		a1: 
			mov time_count, 1		; Сбрасываем счетчик времени
			call algoritm1			; Вызов процедуры, реализующей 1 алгоритм 
			jmp advanced			
		a2:
			mov time_count, 1		; Сбрасываем счетчик времени
			call algoritm2			; Вызов процедуры, реализующей 1 алгоритм 
			jmp advanced		
question endp
			
check proc 	
; Процедура, проверяющая нажатыйе клавиши
			cmp AL, 0   			; Значение регистра AL = 0?
			je vopros				; Да, 
			jmp ex					; Нет,
		vopros:
			int 21h
			cmp al, 44h  			; Нажали F10?
			je exit					; Да, выходим из программы
			cmp AL,3Bh				; Нажали F1?
			je a1					; Переход на мету а1 (алгоритм 1)
			cmp AL,3Ch				; Нажали F2?
			je a2					; Переход на метку а2 (алгоритм 2)
			ret
		ex: 
			mov ah, 0ch
			int 21h		
			ret
check endp	
exit:
			mov ah, 00h				
			mov al, 03h 			
			int 10h
			mov ax, 4c00h			
			int 21h					; Завершение программы
main endp
text ends
data segment 'data'
	time dw 18
	time_count db 1
	color db 4
	data ends
end main