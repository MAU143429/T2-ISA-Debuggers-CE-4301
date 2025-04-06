section .text

global _start
_start:

  mov rbx, rsp      
  mov rsi, 5 
  mov [rbx], rsi

  lea rcx, [rbx + 4]
  mov rax, 1
  mov [rcx], rax	          
  
  mov rdx, rcx 
  mov r8, rcx
  mov r10, rcx
  mov r11, rcx
  mov rax, 0 
  lea rcx, [rcx + 4]
  mov r9, 0 

  jmp check       
	

check:

  mov rsi, rbx
  mov r15, [rsi]
  cmp rax, r15
  je end

  add rax, 1
  lea r9, [rax+1]
  mov rdx, r10
  mov r8, r11
	
  jmp pascal
             
	
pascal:
	
  mov rsi,rax
  add rsi,1
  cmp r9, rsi
  je first_1

  cmp r9,1
  je last_1

  jmp sum_loop  
  

first_1:

  mov r13, 1
  mov [rcx], r13

  mov r10,rcx
  mov r14, [rcx]
  add r14, 4 
  mov [rcx],r14
  sub r9,1


  jmp pascal



last_1:

  mov r13, 1
  mov [rcx], r13

  mov r11,rcx
  mov r14, [rcx]
  add r14, 4 
  mov [rcx],r14
  sub r9,1

  jmp check              


sum_loop:

  mov rdi, [rdx]        
  lea r15, [rdx + 4]       
  mov r15, [r15]       
  
  mov r13, rdi
  add r13, r15     
  mov [rcx], r13        
  
  mov r14, [rcx]
  add r14, 4 
  mov [rcx],r14
      
  
  mov r14, [rdx]
  add r14, 4 
  mov [rdx],r14
          
  sub r9,  1             
  
  jmp pascal             

end:

  mov rdi, rax
  mov rax, 60
  syscall
	
 

