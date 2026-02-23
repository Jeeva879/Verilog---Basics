//---------------------
//		DESIGN
//---------------------

module t_flip_flop(
    input wire clk,      // Clock
    input wire rst,      // Reset
    input wire t,        // Toggle
    output reg q);       // Output

// T Flip-Flop behavior
always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 1'b0;			// Reset condition - output goes to 0
    end else begin
        if (t) begin
            q <= ~q;    	// Toggle when T=1
        end
        // Note: No else needed - q holds its value automatically
    end
end

endmodule

//---------------------
//		TESTBENCH
//---------------------

module t_flip_flop_tb;
    reg clk;
    reg rst;
    reg t;
    wire q;
    
    t_flip_flop dut (.clk(clk), .rst(rst), .t(t), .q(q));
    
    always #5 clk = ~clk;
    
    initial begin
      $monitor("rst=%b | t=%b | q=%b",rst, t, q);
    end
  
    initial begin
        clk = 0;
        rst = 0;
        t = 0;
        
        // Apply reset
        #2 rst = 1;
        @(posedge clk) rst = 0;
        
        // Test T=0 (Hold mode)
        @(posedge clk) t = 0;
        @(posedge clk) t = 0;  // Continue holding
        
        // Test T=1 (Toggle mode)
        @(posedge clk) t = 1;
        @(posedge clk) t = 1;  // Toggle again
        @(posedge clk) t = 1;  // Toggle again
        @(posedge clk) t = 1;  // Toggle again
        
        // Test alternating T input
        @(posedge clk) t = 0;  // Hold
        @(posedge clk) t = 1;  // Toggle
        @(posedge clk) t = 0;  // Hold
        @(posedge clk) t = 1;  // Toggle
        @(posedge clk) t = 0;  // Hold
        #30 $finish;
    end
  
endmodule
