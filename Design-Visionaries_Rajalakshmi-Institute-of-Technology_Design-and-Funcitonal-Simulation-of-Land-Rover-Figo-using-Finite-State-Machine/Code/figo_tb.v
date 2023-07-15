
`timescale 1ns / 1ns
module figo_tb ; 

parameter Room7  = 3'b111 ;
parameter Room3  = 3'b011 ;
parameter Room4  = 3'b100 ;
parameter Room0  = 3'b000 ;
parameter Room5  = 3'b101 ;
parameter Room1  = 3'b001 ;
parameter Room6  = 3'b110 ;
parameter Room2  = 3'b010 ; 
  reg    travel_input   ; 
  reg    clk   ; 
  wire  [2:0]  current   ; 
  reg    reset   ; 
  figo    #( Room0 , Room1 , Room2 , Room3 , Room4 , Room5 , Room6 , Room7  )
   DUT  ( 
       .travel_input (travel_input ) ,
      .clk (clk ) ,
      .current (current ) ,
      .reset (reset ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
	  clk  = 1'b0  ;
	 # 50 ;
// 50 ns, single loop till start period.
   repeat(9)
   begin
	   clk  = 1'b1  ;
	  #50  clk  = 1'b0  ;
	  #50 ;
// 950 ns, repeat pattern in loop.
   end
	  clk  = 1'b1  ;
	 # 50 ;
// dumped values till 1 us
  end


// "Constant Pattern"
// Start Time = 0 ns, End Time = 1 us, Period = 0 ns
 
initial begin
    reset = 1;
    #10 reset = 0;
end


// "Constant Pattern"
// Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  initial
  begin
	  travel_input  = 1'b1 ;
	 #100 travel_input  = 1'b1;
	 #100 travel_input  = 1'b0;
	 #100 travel_input  = 1'b1;
	 #100 travel_input  = 1'b0;
// dumped values till 1 us
  end

  initial
	#2000 $stop;
endmodule
