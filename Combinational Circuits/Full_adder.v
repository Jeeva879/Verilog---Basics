//---------------------------------
//     DESIGN - Full_adder.v
//---------------------------------

module full_adder (
  input a,b,cin,
  output sum,carry);
  
  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (b & cin) | (cin & a);
endmodule

//---------------------------------
//   TESTBENCH - Full_adder_tb.v
//---------------------------------

module tb;
  reg a,b,cin;
  wire sum,carry;
  
  full_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));		 //Instantiation of design module
  
  initial begin
    
    a = 1'b0; b = 1'b0; cin = 1'b0; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b0; b = 1'b0; cin = 1'b1; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b0; b = 1'b1; cin = 1'b0; #10;
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b0; b = 1'b1; cin = 1'b1; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b1; b = 1'b0; cin = 1'b0; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b1; b = 1'b0; cin = 1'b1; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b1; b = 1'b1; cin = 1'b0; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    a = 1'b1; b = 1'b1; cin = 1'b1; #10; 
    $display("a= %b, b= %b, cin= %b, sum = %b, Carry = %b",a,b,cin,sum,carry);
    $finish;
  end
  
endmodule
