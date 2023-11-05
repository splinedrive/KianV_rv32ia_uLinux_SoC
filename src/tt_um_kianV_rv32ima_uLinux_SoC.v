`default_nettype none
module tt_um_kianV_rv32ima_uLinux_SoC (
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
  wire [6:0] led;
  wire [2:0] ce;
  wire sclk;

  wire clk_osc = clk;

  assign uo_out[0] = led[0];
  assign uo_out[2:1] = led[2:1];
  assign uo_out[3] = led[3];
  assign uo_out[4] = uart_tx;
  assign uo_out[5] = led[4];
  assign uo_out[6] = led[5];
  assign uo_out[7] = led[6];

  assign uart_rx = ui_in[3];

  /*
  assign {sio3_i, sio2_i, sio1_so_miso_i, sio0_si_mosi_i} = {
    uio_in[5], uio_in[4], uio_in[2], uio_in[1]
  };
  */
  assign sio3_i = uio_in[5];
  assign sio2_i = uio_in[4];
  assign sio1_so_miso_i = uio_in[2];
  assign sio0_si_mosi_i = uio_in[1];

  assign uio_oe = {2'b11, sio_oe[3:2], 1'b1, sio_oe[1:0], 1'b1};
  assign uio_out = {
    ce[2], ce[1], sio3_o, sio2_o, sclk, sio1_so_miso_o, sio0_si_mosi_o, ce[0]
  };

  soc soc_I (
      .clk_osc(clk_osc),
      .uart_tx(uart_tx),
      .uart_rx(uart_rx),
      .led    (led),
      .sclk   (sclk),
      .ce     (ce),

      .sio0_si_mosi_i(sio0_si_mosi_i),
      .sio1_so_miso_i(sio1_so_miso_i),
      .sio2_i        (sio2_i),
      .sio3_i        (sio3_i),

      .sio0_si_mosi_o(sio0_si_mosi_o),
      .sio1_so_miso_o(sio1_so_miso_o),
      .sio2_o        (sio2_o),
      .sio3_o        (sio3_o),

      .sio_oe(sio_oe),
      .rst_n (rst_n)
  );

endmodule
