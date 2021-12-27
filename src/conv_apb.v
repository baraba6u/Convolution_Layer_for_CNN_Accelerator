module conv_apb 
  (
    input wire PCLK,           // APB clock
    input wire PRESETB,        // APB asynchronous reset (0: reset, 1: normal)
    input wire [31:0] PADDR,   // APB address
    input wire PSEL,           // APB select
    input wire PENABLE,        // APB enable
    input wire PWRITE,         // APB write enable
    input wire [31:0] PWDATA,  // APB write data
    output wire [31:0] PRDATA,

    input wire [31:0] clk_counter,
    input wire conv_done,
    output reg conv_start,

    output reg [2:0]  COMMAND,
    output reg [8:0]  InCh,
    output reg [8:0]  OutCh,
    output reg [5:0]  FLength,

    input wire  F_writedone,
    output reg  F_writedone_respond,
    input wire  B_writedone,
    output reg  B_writedone_respond,
    input wire  rdy_to_transmit,
    output reg  rdy_to_transmit_respond,
    input wire  transmit_done,
    output reg  transmit_done_respond 
    
  );
  
  wire state_enable;
  wire state_enable_pre;
  reg [31:0] prdata_reg;
  
  assign state_enable = PSEL & PENABLE;
  assign state_enable_pre = PSEL & ~PENABLE;
  
  // READ OUTPUT
  // FPGA -> CPU 
  always @(posedge PCLK, negedge PRESETB) begin
    if (PRESETB == 1'b0) begin
      prdata_reg <= 32'h00000000;
    end
    else begin
      if (~PWRITE & state_enable_pre) begin
        case ({PADDR[31:2], 2'h0})
          32'h00000020: begin
            prdata_reg<=F_writedone;          
          end
          32'h00000024: begin
            prdata_reg<=B_writedone;
          end
          32'h00000028: begin
            prdata_reg<=rdy_to_transmit;
          end
          32'h0000002C: begin
            prdata_reg<=transmit_done;
          end
          32'h0000030: begin
            prdata_reg<=clk_counter;   
          end

        endcase
      end
      else begin
        prdata_reg <= 32'h0;
      end
    end
  end
  
  assign PRDATA = (~PWRITE & state_enable) ? prdata_reg : 32'h00000000;
  
  // WRITE ACCESS
  // CPU -> FPGA 
  always @(posedge PCLK, negedge PRESETB) begin
    if (PRESETB == 1'b0) begin
      conv_start <= 1'b0;
      COMMAND<=0;
    end
    else begin
      if (PWRITE & state_enable) begin
        case ({PADDR[31:2], 2'h0})
          32'h00000000 : begin // Command
            case (PWDATA)
              32'h1: begin
                conv_start<=1;
                COMMAND <= 1;  // Read feature
              end
              32'h2: begin
                COMMAND <=2;   // Read bias
              end
              32'h3: begin
                COMMAND <=3;   // Read weight and start conv
              end
              32'h4: begin 
                COMMAND <=4;   // Send output
              end
              32'h0: begin     // Reset
                conv_start<=0;
                COMMAND<=0;
                InCh<=0;
                OutCh<=0;
                FLength<=0;
                F_writedone_respond<=0;
                B_writedone_respond<=0;
                rdy_to_transmit_respond<=0;
                transmit_done_respond<=0;
              end
            endcase
            conv_start <= PWDATA[0];
          end
          32'h00000004 : begin
            InCh <= PWDATA;
          end
          32'h00000008 : begin
            OutCh <= PWDATA;
          end
          32'h0000000c : begin
            FLength <= PWDATA;
          end
          32'h00000010 : begin
            F_writedone_respond <= PWDATA;
          end
          32'h00000014 : begin
            B_writedone_respond <= PWDATA;
          end
          32'h00000018 : begin
            rdy_to_transmit_respond <= PWDATA;
          end
          32'h0000001C : begin
            transmit_done_respond  <= PWDATA;
          end


        endcase
      end
    end
  end

endmodule
