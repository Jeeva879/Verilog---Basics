//---------------------------------
//     DESIGN - Mux_4to1.v
//---------------------------------

module mux_4to1 (
  input [3:0]x,      //4-bit input
  input [1:0]s,      //2-bit Select signal
  output y);
  
  assign y = x[s];			// Selects input in x based on select signal and assigns to y
endmodule

//---------------------------------
//     TESTBENCH - Mux_4to1_tb.v
//---------------------------------

module tb;
  reg [3:0]x;
  reg [1:0]s;
  wire y;
  
  mux_4to1 dut (.x(x),.s(s),.y(y));
  
  initial begin
    //Test cases
    x = 4'b1010; s= 2'b00; #10 $display("x= %b, s= %b, y= %b",x,s,y);
    x = 4'b1010; s= 2'b01; #10 $display("x= %b, s= %b, y= %b",x,s,y);
    x = 4'b1010; s= 2'b10; #10 $display("x= %b, s= %b, y= %b",x,s,y);
    x = 4'b1010; s= 2'b11; #10 $display("x= %b, s= %b, y= %b",x,s,y);
  end
endmodule
