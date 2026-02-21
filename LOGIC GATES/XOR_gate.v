`timescale 1ns/1ps

//--------------------
//       DESIGN
//--------------------

module xor_gate (a,b,out);
  input a,b;
  output out;
  
  assign out = a ^ b;
  //assign out = (!a & b) | (a & !b);          // Boolean Expression for XOR gate
endmodule

//--------------------
//      TESTBENCH
//--------------------

module tb;
  reg a,b;
  wire out;
  
  xor_gate dut(.a(a),.b(b),.out(out));
  
  initial begin
    $display("XOR Gate Operation: ");
    a=0; b=0; #10 $display("%b XOR %b = %b",a,b,out);
    a=0; b=1; #10 $display("%b XOR %b = %b",a,b,out);
    a=1; b=0; #10 $display("%b XOR %b = %b",a,b,out);
    a=1; b=1; #10 $display("%b XOR %b = %b",a,b,out);
    $finish;
  end
endmodule
