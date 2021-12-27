`timescale 1ns / 1ps

module conv_top 
  #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 32
  )
  (
    input wire CLK,
    input wire RESETN,

    // AXIS protocol
    output wire S_AXIS_TREADY,
    input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TKEEP, 
    input wire S_AXIS_TUSER, 
    input wire S_AXIS_TLAST, 
    input wire S_AXIS_TVALID, 

    input wire M_AXIS_TREADY, 
    output wire M_AXIS_TUSER, 
    output wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA, 
    output wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TKEEP, 
    output wire M_AXIS_TLAST, 
    output wire M_AXIS_TVALID, 

    // APB protocol
    input wire [31:0] PADDR, 
    input wire PSEL, 
    input wire PENABLE, 
    input wire PWRITE, 
    input wire [31:0] PWDATA, 
    output wire PSLVERR, 
    output wire PREADY, 
    output wire [31:0] PRDATA
  );
  
  // For CONV control path
  wire          conv_start;   
  wire          conv_done; 
  assign PREADY = 1'b1;
  assign PSLVERR = 1'b0;

  wire [2:0]  COMMAND;
  wire [8:0]  InCh;
  wire [8:0]  OutCh;
  wire [5:0]  FLength;

  wire  F_writedone;
  wire  F_writedone_respond;
  wire  B_writedone;
  wire  B_writedone_respond;
  wire  rdy_to_transmit;
  wire  rdy_to_transmit_respond;
  wire  transmit_done;
  wire  transmit_done_respond;
  
  conv_module  #(.C_S00_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)) 
  u_conv_module
  (
    .clk  (CLK),
    .rstn (RESETN),

    .S_AXIS_TREADY (S_AXIS_TREADY),
    .S_AXIS_TDATA  (S_AXIS_TDATA),
    .S_AXIS_TKEEP  (S_AXIS_TKEEP),
    .S_AXIS_TUSER  (S_AXIS_TUSER),
    .S_AXIS_TLAST  (S_AXIS_TLAST),
    .S_AXIS_TVALID (S_AXIS_TVALID),

    .M_AXIS_TREADY (M_AXIS_TREADY),
    .M_AXIS_TUSER  (M_AXIS_TUSER),
    .M_AXIS_TDATA  (M_AXIS_TDATA),
    .M_AXIS_TKEEP  (M_AXIS_TKEEP),
    .M_AXIS_TLAST  (M_AXIS_TLAST),
    .M_AXIS_TVALID (M_AXIS_TVALID),

    .conv_start (conv_start),
    .conv_done  (conv_done),

    .COMMAND(COMMAND),
    .InCh(InCh),
    .OutCh(OutCh),
    .FLength(FLength),

    .F_writedone(F_writedone),
    .F_writedone_respond(F_writedone_respond),
    .B_writedone(B_writedone),
    .B_writedone_respond(B_writedone_respond),
    .rdy_to_transmit(rdy_to_transmit),
    .rdy_to_transmit_respond(rdy_to_transmit_respond),
    .transmit_done(transmit_done),
    .transmit_done_respond(transmit_done_respond)
  );
  
  conv_apb u_conv_apb(
    .PCLK    (CLK),
    .PRESETB (RESETN),
    .PADDR   ({16'd0,PADDR[15:0]}),
    .PSEL    (PSEL),
    .PENABLE (PENABLE),
    .PWRITE  (PWRITE),
    .PWDATA  (PWDATA),
    .PRDATA  (PRDATA),

    .conv_done   (conv_done),
    .conv_start  (conv_start),

    .COMMAND(COMMAND),
    .InCh(InCh),
    .OutCh(OutCh),
    .FLength(FLength),

    .F_writedone(F_writedone),
    .F_writedone_respond(F_writedone_respond),
    .B_writedone(B_writedone),
    .B_writedone_respond(B_writedone_respond),
    .rdy_to_transmit(rdy_to_transmit),
    .rdy_to_transmit_respond(rdy_to_transmit_respond),
    .transmit_done(transmit_done),
    .transmit_done_respond(transmit_done_respond)
  );
  
endmodule
