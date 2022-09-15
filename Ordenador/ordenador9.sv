/*
ordenador de 9 números com fsm
*/
module ordenador9 (a, b, c, d, e, f, g, h, i, clk, rst,
s1, s2, s3, s4, s5, s6, s7, s8, s9);

	// Declaração das entradas e saidas
	input logic [3:0] a, b, c, d, e, f, g, h, i;
	output [3:0] s1,s2,s3,s4,s5,s6,s7,s8,s9;
	input logic clk, rst;
	
	
	// Declaração dos dados intermediarios (ainda a definir)
	
	logic[3:0] aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8,aux9;
	logic[3:0] aux10,aux11,aux12,aux13,aux14,aux15,aux16,aux17,aux18;
	logic[3:0] aux19,aux20,aux21,aux22;
	logic[3:0] a1,b1,c1,d1,e1,f1,g1;
	logic[3:0] a2,b2,c2,d2,e2,f2;
	logic[3:0] a3,b3,c3,d3;
	logic[3:0] a4,b4,c4;
	
	ordenador3 inst1(
	.a(a),
	.b(b),
	.c(c),
	.out1(aux1),
	.out2(aux2),
	.out3(aux3)
  );
  
    ordenador3 inst2(
	.a(d),
	.b(e),
	.c(f),
	.out1(aux4),
	.out2(aux5),
	.out3(aux6)
  );
  
    ordenador3 inst3(
	.a(g),
	.b(h),
	.c(i),
	.out1(aux7),
	.out2(aux8),
	.out3(aux9)
  );
  
    ordenador3 inst4(
	.a(aux1),
	.b(aux4),
   .c(aux7),
	.out1(s1),
	.out2(a1),
	.out3(b1)
  );
  
    ordenador3 inst5(
	.a(aux2),
	.b(aux5),
   .c(aux8),
	.out1(c1),
	.out2(d1),
	.out3(e1)
  );
  
    ordenador3 inst6(
	.a(aux3),
	.b(aux6),
	.c(aux9),
	.out1(f1),
	.out2(g1),
	.out3(s9)
  );
  
    ordenador3 inst7(
	.a(a1),
	.b(b1),
	.c(c1),
	.out1(aux10), 	
	.out2(aux11),	
	.out3(aux12)		
  );
  
    ordenador3 inst8(
	.a(d1),
	.b(e1),
	.c(f1),
	.out1(aux13),	
	.out2(aux14),	
	.out3(f2)
  );
  
    ordenador3 inst9(
	.a(aux10),
	.b(aux13),
	.c(g1),
	.out1(s2),
	.out2(a2),
	.out3(b2)
  );
  
    ordenador3 inst10(
	.a(aux11),
	.b(aux12),
	.c(aux14),
	.out1(c2),
	.out2(d2),
	.out3(e2)
  );
  
    ordenador3 inst11(
	.a(a2),
	.b(b2),
	.c(c2),
	.out1(aux15), 
	.out2(aux16), 
	.out3(aux17)  
  );
  
    ordenador3 inst12(
	.a(d2),
	.b(e2),
	.c(f2),
	.out1(aux18), 
	.out2(aux19), 
	.out3(aux20)  
  );
  
    ordenador3 inst13(
	.a(aux15),
	.b(aux16),
	.c(aux18),
	.out1(s3),
	.out2(a3),
	.out3(b3)
  );
  
    ordenador3 inst14(
	.a(aux17),
	.b(aux19),
	.c(aux20),
	.out1(c3),
	.out2(d3),
	.out3(s8)
  );
  
    ordenador3 inst15(
	.a(a3),
	.b(b3),
	.c(c3),
	.out1(aux21),
	.out2(aux22),
	.out3(c4)
  );
  
    ordenador3 inst16(
	.a(aux21),
	.b(aux22),
	.c(d3),
	.out1(s4),
	.out2(a4),
	.out3(b4)
  );
  
    ordenador3 inst17(
	.a(a4),
	.b(b4),
	.c(c4),
	.out1(s5),
	.out2(s6),
	.out3(s7)
  );
	
	parameter IDLE = 2'b00;
	parameter MEM_READ = 2'b01;
	parameter PROCESSING = 2'b10;
	parameter MEM_WRITE = 2'b11;
	
	logic [1:0] current_state, next_state;
	logic enable;
	
	// Declaração do circuito
	
	
	//Logica do proximo estádo
	always@(current_state) 
	begin
		case(current_state) 
			IDLE: next_state = MEM_READ;
			MEM_READ: next_state = PROCESSING;
			PROCESSING: next_state = MEM_WRITE;
			MEM_WRITE: next_state = MEM_READ;
			default: next_state = IDLE;
		endcase
	end
	
	//Logica de reset
	always@(posedge clk) begin
		current_state <= rst == 0 ? IDLE : next_state;
	end
	
	//Logica de saida
	always@(current_state) 
	begin
	
		case(current_state) 
		
			PROCESSING: enable = 1;
			default: enable = 0;
		
		endcase
	
	end
	

endmodule