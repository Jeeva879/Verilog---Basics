//---------------------
//		DESIGN
//---------------------

module up_down_counter (
    input wire clk,
    input wire rst,
    input wire en,
    input wire up_down,      // 1 for up, 0 for down
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else if (en) begin
            if (up_down) begin
                count <= count + 1;  // Count up
            end else begin
                count <= count - 1;  // Count down
            end
        end
    end

endmodule

//---------------------
//		TESTBENCH
//---------------------

module tb_up_down_counter;
    reg clk;
    reg rst;
    reg en;
    reg up_down;
    wire [3:0] count;
    
    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .up_down(up_down),
        .count(count)
    );

    always #5 clk = ~clk;
    
    initial begin
        // Initialize
        clk = 0;
        rst = 0;
        en = 0;
        up_down = 1;
        
        // Reset
        rst = 1;
        #20;
        rst = 0;
        #10;
        
        // Count up
        $display("Counting up...");
        en = 1;
        up_down = 1;
        #100;
        
        // Count down
        up_down = 0;
        $display("Counting down...");
        #100;
        
        // Disable
        $display("Disabled...");
        en = 0;
        #50;
        
        $finish;
    end
    
    always @(posedge clk) begin
      $display("Count: %0d, Direction: %s",count, up_down ? "UP-1" : "DOWN-0");
    end
    
endmodule
