module figo(
    input wire clk,  // Clock input
    input wire reset,  // Reset input
    input wire travel_input,  // Input bit from ISRO
    output reg [2:0]current // Output representing the current state
);
reg [2:0] next_state,current_state;
//assign room
parameter Room0=3'b000,
	       Room1=3'b001,
          Room2=3'b010,
          Room3=3'b011,
          Room4=3'b100,
          Room5=3'b101,
          Room6=3'b110,
          Room7=3'b111;

// Sequential logic for state transition
always @(posedge clk or posedge reset)
 begin
    if (reset)
	 begin
        current_state <= Room0;  // Reset to initial state
	 end
	 else
	 begin 
        current_state <= next_state;  // Update current state
	 end
end

// Combinational logic for next state calculation
always @(current_state or travel_input) begin
    case (current_state)
        Room0:
            if (travel_input == 0)
                next_state = Room0;
            else
                next_state = Room1;
        Room1:
            if (travel_input == 0)
                next_state = Room0;
            else
                next_state = Room2;
        Room2:
            if (travel_input == 0)
                next_state = Room2;
            else
                next_state = Room3;
        Room3:
            if (travel_input == 0)
                next_state = Room2;
            else
                next_state = Room4;
        Room4:
            if (travel_input == 0)
                next_state = Room4;
            else
                next_state = Room6;
        Room5:
            if (travel_input == 0)
                next_state = Room6;
            else
                next_state = Room7;
        Room6:
            if (travel_input == 0)
                next_state = Room5;
            else
                next_state = Room4;
        Room7:
            if (travel_input == 0)
                next_state = Room7;
            else
                next_state = Room0;
        default:
            next_state = Room0;
    endcase
end

// Assign the current state output
always @(current or current_state)
begin

	current<=current_state ;
end


endmodule 
