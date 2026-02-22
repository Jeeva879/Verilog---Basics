//---------------------------------
//     DESIGN - Encoder_4to2.v
//---------------------------------

module encoder_4to2 (
  input [3:0]in,			  // 4 input lines
  output reg [1:0]y);		// 2 output lines
  
  assign y[1] = in[2] | in[3];
  assign y[0] = in[1] | in[3];
  
  //Another approach
  /*always @(*) begin
    case (in)
      4'b0001: y = 2'b00;
      4'b0010: y = 2'b01;
      4'b0100: y = 2'b10;
      4'b1000: y = 2'b11;
      default: y = 2'b00; 	// Invalid condition
    endcase
  end*/

endmodule

//---------------------------------
//  TESTBENCH - Encoder_4to2_tb.v
//---------------------------------

module encoder_4to2_tb;
  reg [3:0] in;
  wire [1:0] y;
  
  encoder_4to2 dut (.in(in),.y(y));
  
  initial begin
    in= 4'b0001; #10 $display("i = %b, y = %b",in,y);
    in= 4'b0010; #10 $display("i = %b, y = %b",in,y);
    in= 4'b0100; #10 $display("i = %b, y = %b",in,y);
    in= 4'b1000; #10 $display("i = %b, y = %b",in,y);
    #10;
    $finish;
  end
  
endmodule
