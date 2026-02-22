//Mux_2to1 using Behavioral Modeling
//------------------
//	   DESIGN
//------------------

module mux2to1_behavioral (
  input a, b, sel,
  output reg y);

  //behavioral modeling
  always @(*) begin
    case (sel)
      1'b0: y = a;
      1'b1: y = b;
      default: y = 1'b0;
    endcase
  end

endmodule

//------------------
//	   TESTBENCH
//------------------

module mux_2to1_tb;
  reg a, b, sel;
  wire y;

mux2to1_behavioral dut (.a(a),.b(b),.sel(sel),.y(y));

  initial begin
    
    $display("-------------");
    $display("a b sel | y");
    $display("-------------");

    a=0; b=1; sel=0; #10;
    $display("%b %b  %b  | %b", a,b,sel,y);

    sel=1; #10;
    $display("%b %b  %b  | %b", a,b,sel,y);
    $display("-------------");

    a=1; b=0; sel=0; #10;
    $display("%b %b  %b  | %b", a,b,sel,y);

    sel=1; #10;
    $display("%b %b  %b  | %b", a,b,sel,y);
    $display("-------------");

    $finish;
end

endmodule
