`timescale 1ns/1ps

module tb_led_switch_fsm;

    // Testbench signals
    reg clk_p;
    reg clk_n;
    reg rst;
    reg push;
    wire led_on;

    // Instantiate the DUT
    led_switch_fsm dut (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rst(rst),
        .push(push),
        .led_on(led_on)
    );

    // Differential clock generation (100 MHz)
    initial begin
        clk_p = 0;
        clk_n = 1;
        forever #5 begin
            clk_p = ~clk_p;
            clk_n = ~clk_n;
        end
    end

    // Stimulus
    initial begin
        // Initialize inputs
        rst  = 1;
        push = 0;

        // Hold reset for a few cycles
        #20;
        rst = 0;

        // Press button -> LED ON
        #20;
        push = 1;
        #10;
        push = 0;

        // Wait a bit
        #40;

        // Press button again -> LED OFF
        #20;
        push = 1;
        #10;
        push = 0;

        // Another toggle
        #40;
        push = 1;
        #10;
        push = 0;

        // Finish simulation
        #50;
        $stop;
    end

    // Monitor for debugging
    initial begin
        $monitor("Time=%0t | rst=%b push=%b led_on=%b",
                 $time, rst, push, led_on);
    end

endmodule
