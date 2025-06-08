module lcd_display_tb;
    reg clk;
    reg reset;
    wire [7:0] data;
    wire rs;
    wire rw;
    wire en;
    lcd_display uut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .rs(rs),
        .rw(rw),
        .en(en)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        reset = 1;
        #10;
        reset = 0;
        #1320;  
        $finish;
    end
    always @(posedge clk) begin
        if (en && rs) begin
            $display("LCD is displaying character: %c", data);
        end
    end

endmodule
