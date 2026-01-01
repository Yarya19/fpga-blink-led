module led_switch_fsm (
    input clk_p,      // Differential clock positive
    input clk_n,      // Differential clock negative
    input rst,
    input push,
    output reg led_on
);

wire clk;  // Internal single-ended clock
reg on, off;

// Differential to single-ended clock buffer
IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DIFF_SSTL15")
) IBUFDS_inst (
    .O(clk),       // Single-ended output
    .I(clk_p),     // Differential positive input
    .IB(clk_n)     // Differential negative input
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        on <= 1'b0;
        off <= 1'b1;
    end
    else if (off & push) begin
        on <= 1'b1;
        off <= 1'b0;
    end
    else if (on & push) begin
        on <= 1'b0;
        off <= 1'b1;
    end
end

  always @(*) begin
    led_on = on;
  end
endmodule


