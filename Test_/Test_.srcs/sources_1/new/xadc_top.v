`timescale 1ns / 1ps

module xadc_top(
    input clk,            // 50MHz System Clock from AX7010 board (Pin U18)
    input rst             // Reset Button (Pin N15)
);

    // Internal wires for dedicated analog input pins VP/VN
    wire vp_in = 1'b0;
    wire vn_in = 1'b0;

    // Internal signals for XADC data reading
    wire [15:0] do_out_wire;
    wire eoc_wire;
    wire drdy;
    reg [15:0] data_out;
    
    // Create continuous pulse for DEN to force constant refresh
    reg eoc_reg;
    always @(posedge clk) begin
        eoc_reg <= eoc_wire;
    end
    wire den_pulse = eoc_wire && !eoc_reg; // Edge detector for EOC
    
    // Instantiate XADC IP core (xadc_wiz_0)
    xadc_wiz_0 my_xadc (
        .dclk_in(clk),
        .den_in(eoc_wire),        // Continuous read: trigger DEN when EOC goes high
        .dwe_in(1'b0),            // Read-only mode (Write Enable = 0)
        .daddr_in(7'h00),         // Address 7'h00 = Internal Chip Temperature
        .di_in(16'h0000),         // Data in set to 0 (No write operation)
        .reset_in(rst),
        .vp_in(vp_in),
        .vn_in(vn_in),
        .do_out(do_out_wire),     // 16-bit converted ADC output data
        .drdy_out(drdy),          // Data Ready status signal
        .eoc_out(eoc_wire),       // End of Conversion signal
        .eos_out(),
        .busy_out(),
        .channel_out(),
        .alarm_out()
    );

    // Store converted data into internal register when data is ready
    always @(posedge clk) begin
        if (drdy) begin
            data_out <= do_out_wire;
        end
    end

endmodule