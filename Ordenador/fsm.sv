module fsm(input logic clk, input logic [3:0]desordenado[8:0], output logic [3:0]ordenado[8:0]);
	parameter IDLE = 2'b00;
	parameter MEM_READ = 2'b01;
	parameter PROCESSING = 2'b10;
	parameter MEM_WRITE = 2'b11;
	
	logic [1:0] current_state, next_state;
	logic enable,rst;
	logic [3:0]_ordenado[8:0];
	
	
 ordenador9(desordenado[8],
				  desordenado[7],
				  desordenado[6],
				  desordenado[5],
				  desordenado[4],
				  desordenado[3],
				  desordenado[2],
				  desordenado[1],
				  desordenado[0],
				  _ordenado[8],
				  _ordenado[7],
				  _ordenado[6],
				  _ordenado[5],
				  _ordenado[4],
				  _ordenado[3],
				  _ordenado[2],
				  _ordenado[1],
				  _ordenado[0]
);
				  
	
	
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
		
			PROCESSING:  enable =1;
			default: enable = 0;
		
		endcase
		ordenado[0] = (enable)? _ordenado[0]: 0;
		ordenado[1] = (enable)? _ordenado[1]: 0;
		ordenado[2] = (enable)? _ordenado[2]: 0;
		ordenado[3] = (enable)? _ordenado[3]: 0;
		ordenado[4] = (enable)? _ordenado[4]: 0;
		ordenado[5] = (enable)? _ordenado[5]: 0;
		ordenado[6] = (enable)? _ordenado[6]: 0;
		ordenado[7] = (enable)? _ordenado[7]: 0;
		ordenado[8] = (enable)? _ordenado[8]: 0;
	end
endmodule
	
	