//---------------------------------
//     DESIGN - Mux_2to1.v
//---------------------------------

module mux_2to1 (
  input a,b,
  input s,		//Select signal
  output y);
  
  assign y = s ? b : a; // Ternary operator - select b if s=1, otherwise select a
endmodule

//---------------------------------
//     TESTBENCH - Mux_2to1_tb.v
//---------------------------------

module tb;
  reg a,b;
  reg s;
  wire y;
  
  mux_2to1 dut (.a(a),.b(b),.s(s),.y(y));      //Instantiation of design module
  
  initial begin
    //Test cases
    a = 1'b0; b = 1'b0; s = 1'b0; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
    a = 1'b0; b = 1'b1; s = 1'b0; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y); 
    a = 1'b1; b = 1'b0; s = 1'b0; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
    a = 1'b1; b = 1'b1; s = 1'b0; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
    a = 1'b0; b = 1'b0; s = 1'b1; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
    a = 1'b0; b = 1'b1; s = 1'b1; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y); 
    a = 1'b1; b = 1'b0; s = 1'b1; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
    a = 1'b1; b = 1'b1; s = 1'b1; #10 $display("a= %b, b= %b, s= %b, y= %b",a,b,s,y);
  end
endmodule
