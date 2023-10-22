`default_nettype none `timescale 1 ns / 100 ps
module tt_um_kianV_rv32ia_uLinux_SoC (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire sio0_si_mosi_i;
  wire sio1_so_miso_i;
  wire sio2_i;
  wire sio3_i;

  wire sio0_si_mosi_o;
  wire sio1_so_miso_o;
  wire sio2_o;
  wire sio3_o;

  wire [3:0] sio_oe;

  wire uart_tx;
  wire uart_rx;
  wire [1:0] led;
  wire ce0;
  wire ce1;
  wire sclk_ram;
  wire sclk_nor;

  wire clk_osc = clk;

  assign uo_out[0] = sclk_ram;
  assign uo_out[2:1] = led;
  assign uo_out[3] = ce0;
  assign uo_out[4] = uart_tx;
  assign uo_out[5] = ce1;
  assign uo_out[6] = sclk_nor;
  assign uo_out[7] = 1'b0;

  assign uart_rx = ui_in[3];

  assign uio_oe = {4'b1111, sio_oe};
  assign {sio3_i, sio2_i, sio1_so_miso_i, sio0_si_mosi_i} = uio_in[3:0];
  assign uio_out = {4'b0000, sio3_o, sio2_o, sio1_so_miso_o, sio0_si_mosi_o};

  soc soc_I (
      .clk_osc (clk_osc),
      .uart_tx (uart_tx),
      .uart_rx (uart_rx),
      .led     (led),
      .ce0     (ce0),
      .sclk_ram(sclk_ram),
      .ce1     (ce1),

      .sio0_si_mosi_i(sio0_si_mosi_i),
      .sio1_so_miso_i(sio1_so_miso_i),
      .sio2_i        (sio2_i),
      .sio3_i        (sio3_i),

      .sio0_si_mosi_o(sio0_si_mosi_o),
      .sio1_so_miso_o(sio1_so_miso_o),
      .sio2_o        (sio2_o),
      .sio3_o        (sio3_o),

      .sio_oe  (sio_oe),
      .sclk_nor(sclk_nor),
      .resetn  (rst_n)
  );

endmodule
