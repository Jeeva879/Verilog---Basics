//---------------------------------
//     DESIGN - Half_adder.v
//---------------------------------

module half_adder (
  input a,b,
  output sum,carry);
  
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

//---------------------------------
//   TESTBENCH - Half_adder_tb.v
//---------------------------------

module tb;
  reg a,b;
  wire sum,carry;
  
  half_adder dut(.a(a),.b(b),.sum(sum),.carry(carry));    //Instantiation of design module
  
  initial begin
    a= 1'b0; b= 1'b0; #10 $display("a= %b, b= %b, sum = %b, carry = %b",a,b,sum,carry);
    a= 1'b0; b= 1'b1; #10 $display("a= %b, b= %b, sum = %b, carry = %b",a,b,sum,carry);
    a= 1'b1; b= 1'b0; #10 $display("a= %b, b= %b, sum = %b, carry = %b",a,b,sum,carry);
    a= 1'b1; b= 1'b1; #10 $display("a= %b, b= %b, sum = %b, carry = %b",a,b,sum,carry);
    $finish;
  end
  
endmodule
