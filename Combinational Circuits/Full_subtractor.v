//-----------------------------------
//     DESIGN - Full_subtractor.v
//-----------------------------------

module full_subtractor (
  input a,b,c,
  output borrow,diff);		// Borrow and Difference
  
  assign borrow = (!a & b) | (b & c) | (c & !a);
  assign diff = a ^ b ^ c;
endmodule

//-----------------------------------
// TESTBENCH - Full_subtractor_tb.v
//-----------------------------------

module tb;
  reg a,b,c;
  wire borrow,diff;			 // Borrow and Difference
  
  full_subtractor dut(.a(a),.b(b),.c(c),.borrow(borrow),.diff(diff));		 //Instantiation of design module
  
  initial begin
    
    //Test cases
    a = 1'b0; b = 1'b0; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b0; b = 1'b0; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b0; b = 1'b1; c = 1'b0; #10;
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b0; b = 1'b1; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b1; b = 1'b0; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b1; b = 1'b0; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b1; b = 1'b1; c = 1'b0; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    a = 1'b1; b = 1'b1; c = 1'b1; #10; 
    $display("a= %b, b= %b, c= %b, borrow = %b, diff = %b",a,b,c,borrow,diff);
    $finish;
  end
  
endmodule
