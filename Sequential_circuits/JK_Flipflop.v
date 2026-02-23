//---------------------
//		DESIGN
//---------------------

module jk_flip_flop(
    input clk,      // Clock
    input rst,      // Reset
    input j,        // J
    input k,        // K
    output reg q);  //output


always @(posedge clk) begin
    if (rst) begin
        q <= 1'b0;
    end 
    else begin
        case ({j,k})
            2'b00: q <= q;   // No change - Hold state
            2'b01: q <= 1'b0; // Reset - Q goes to 0
            2'b10: q <= 1'b1; // Set - Q goes to 1
            2'b11: q <= !q;   // Toggle - Q becomes complement
        endcase
    end
end
endmodule


//---------------------
//		TESTBENCH
//---------------------

module jk_flip_flop_tb;
    reg clk;
    reg rst;
    reg j;
    reg k;
    wire q;
    
    jk_flip_flop dut (.clk(clk),.rst(rst),.j(j), .k(k),.q(q));
    
    always #5 clk = ~clk;
    
    initial begin
        $monitor(" j = %b | k = %b | q = %b", j, k, q);
    end
    
    initial begin
        clk = 0;
        rst = 0;
        j = 0;
        k = 0;
        
        #2 rst = 1;
        @(posedge clk) rst = 0;
        
        //Combinations for JK_ff
        @(posedge clk) j = 0; k = 0;  // Hold
        @(posedge clk) j = 0; k = 1;  // Reset
        @(posedge clk) j = 1; k = 0;  // Set
        @(posedge clk) j = 1; k = 1;  // Toggle
        @(posedge clk) j = 1; k = 1;  // Toggle again
        @(posedge clk) j = 0; k = 0;  // Hold
        @(posedge clk) j = 0; k = 1;  // Reset
        @(posedge clk) j = 1; k = 1;  // Toggle
        @(posedge clk) j = 0; k = 0;  // Hold    
        #30 $finish;
    end
    
endmodule
