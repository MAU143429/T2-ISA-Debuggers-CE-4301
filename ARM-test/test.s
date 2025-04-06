.text
.global _start
_start:

  MOV R6,  sp      
  MOV R12, #5           
  STR R12,  [R6]        
  
  ADD R1, R6, #4
  MOV R0,  #1           
  STR R0,  [R1]         
	
  MOV R2,  R1           
  MOV R3,  R1           
  MOV R10, R1           
  MOV R11, R1           
  MOV R0,  #0           
  ADD R1,  R1, #4    
  MOV R4,  #0           
	
  B check

check:
	
  MOV R12, R6       
  LDR R9, [R12]         
  CMP R0, R9            
  BEQ end               

  ADD R0,  R0,#1        
  ADD R4,  R0,#1       
  MOV R2,  R10          
  MOV R3,  R11          

  B pascal              
	
pascal:

  ADD R5,  R0,#1       
  CMP R4,  R5           
  BEQ first_1           
	
	
  CMP R4,  #1             
  BEQ last_1           
	
  B sum_loop


first_1:

  MOV R7,  #1           
  STR R7,  [R1]         
	
  MOV R10, R1           
  ADD R1,  R1, #4     
  SUB R4,  R4, #1       
	
  B pascal              



last_1:

  MOV R7,  #1           
  STR R7,  [R1]         
	
  MOV R11, R1           
  ADD R1,  R1, #4   
  SUB R4,  R4, #1       
	
  B check               


sum_loop:

  LDR R5,  [R2]         
  ADD R9,  R2, #4   
  LDR R9,  [R9]        
    
  ADD R7,  R5, R9       
  STR R7 , [R1]        
	
  ADD R1,  R1, #4    
  ADD R2,  R2, #4
  SUB R4,  R4, #1       
	 
  B pascal             

end:
	
  MOV R7, #1           
  MOV R0, #0            
  SWI 0  
