// Processing Element module for systolic array calculation
// 2's complement 8-bit fixed point input
// Sign = 1 bit, Integer = 1 bit, Fraction = 6 bit
module pe(clk,reset,stop,in_weight,in_feature,sum,out_weight);
  input wire reset,clk,stop; 
  input wire signed [7:0] in_weight,in_feature; 
  output reg signed [26:0] sum; 
  output reg signed [7:0] out_weight; 

  always @(posedge clk) begin
    if (reset==1) begin
      sum<=0;
      out_weight<=0;
    end
    else begin
      if (stop ==0) sum <= sum + in_weight*in_feature; 
      else sum<=sum;  // If stop==1, maintain current value
      out_weight <= in_weight;
    end
  end
endmodule

// Systolic array module for convolution calculation
// 1-D array taking maximum 32 inputs at once
// This module is used to calculate convolution for each row of 1 input channel
module systolic_conv(clk,reset,stop,in_weight,
in_feature_1,in_feature_2,in_feature_3,in_feature_4,in_feature_5,in_feature_6,in_feature_7,in_feature_8,
in_feature_9,in_feature_10,in_feature_11,in_feature_12,in_feature_13,in_feature_14,in_feature_15,in_feature_16,
in_feature_17,in_feature_18,in_feature_19,in_feature_20,in_feature_21,in_feature_22,in_feature_23,in_feature_24,
in_feature_25,in_feature_26,in_feature_27,in_feature_28,in_feature_29,in_feature_30,in_feature_31,in_feature_32,
sum_1,sum_2,sum_3,sum_4,sum_5,sum_6,sum_7,sum_8,sum_9,sum_10,sum_11,sum_12,sum_13,sum_14,sum_15,sum_16,
sum_17,sum_18,sum_19,sum_20,sum_21,sum_22,sum_23,sum_24,sum_25,sum_26,sum_27,sum_28,sum_29,sum_30,sum_31,sum_32);

  input wire clk,reset,stop;
  input wire signed [7:0] in_weight,
  in_feature_1,in_feature_2,in_feature_3,in_feature_4,in_feature_5,in_feature_6,in_feature_7,in_feature_8,
  in_feature_9,in_feature_10,in_feature_11,in_feature_12,in_feature_13,in_feature_14,in_feature_15,in_feature_16,
  in_feature_17,in_feature_18,in_feature_19,in_feature_20,in_feature_21,in_feature_22,in_feature_23,in_feature_24,
  in_feature_25,in_feature_26,in_feature_27,in_feature_28,in_feature_29,in_feature_30,in_feature_31,in_feature_32;
  output wire signed [26:0] sum_1,sum_2,sum_3,sum_4,sum_5,sum_6,sum_7,sum_8,sum_9,sum_10,sum_11,sum_12,sum_13,sum_14,sum_15,sum_16,
  sum_17,sum_18,sum_19,sum_20,sum_21,sum_22,sum_23,sum_24,sum_25,sum_26,sum_27,sum_28,sum_29,sum_30,sum_31,sum_32;
  
  // Internal wires
  wire signed [7:0]
  out_weight_1, out_weight_2, out_weight_3, out_weight_4, out_weight_5, out_weight_6, out_weight_7, out_weight_8,
  out_weight_9, out_weight_10, out_weight_11, out_weight_12, out_weight_13, out_weight_14, out_weight_15, out_weight_16,
  out_weight_17, out_weight_18, out_weight_19, out_weight_20, out_weight_21, out_weight_22, out_weight_23, out_weight_24,
  out_weight_25, out_weight_26, out_weight_27, out_weight_28, out_weight_29, out_weight_30, out_weight_31;
  
  pe pe_1(.clk(clk),.reset(reset),.stop(stop),.in_weight(in_weight),.in_feature(in_feature_1),.sum(sum_1),.out_weight(out_weight_1));
  pe pe_2(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_1),.in_feature(in_feature_2),.sum(sum_2),.out_weight(out_weight_2));
  pe pe_3(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_2),.in_feature(in_feature_3),.sum(sum_3),.out_weight(out_weight_3));
  pe pe_4(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_3),.in_feature(in_feature_4),.sum(sum_4),.out_weight(out_weight_4));
  pe pe_5(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_4),.in_feature(in_feature_5),.sum(sum_5),.out_weight(out_weight_5));
  pe pe_6(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_5),.in_feature(in_feature_6),.sum(sum_6),.out_weight(out_weight_6));
  pe pe_7(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_6),.in_feature(in_feature_7),.sum(sum_7),.out_weight(out_weight_7));
  pe pe_8(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_7),.in_feature(in_feature_8),.sum(sum_8),.out_weight(out_weight_8));
  pe pe_9(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_8),.in_feature(in_feature_9),.sum(sum_9),.out_weight(out_weight_9));
  pe pe_10(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_9),.in_feature(in_feature_10),.sum(sum_10),.out_weight(out_weight_10));
  pe pe_11(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_10),.in_feature(in_feature_11),.sum(sum_11),.out_weight(out_weight_11));
  pe pe_12(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_11),.in_feature(in_feature_12),.sum(sum_12),.out_weight(out_weight_12));
  pe pe_13(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_12),.in_feature(in_feature_13),.sum(sum_13),.out_weight(out_weight_13));
  pe pe_14(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_13),.in_feature(in_feature_14),.sum(sum_14),.out_weight(out_weight_14));
  pe pe_15(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_14),.in_feature(in_feature_15),.sum(sum_15),.out_weight(out_weight_15));
  pe pe_16(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_15),.in_feature(in_feature_16),.sum(sum_16),.out_weight(out_weight_16));
  pe pe_17(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_16),.in_feature(in_feature_17),.sum(sum_17),.out_weight(out_weight_17));
  pe pe_18(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_17),.in_feature(in_feature_18),.sum(sum_18),.out_weight(out_weight_18));
  pe pe_19(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_18),.in_feature(in_feature_19),.sum(sum_19),.out_weight(out_weight_19));
  pe pe_20(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_19),.in_feature(in_feature_20),.sum(sum_20),.out_weight(out_weight_20));
  pe pe_21(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_20),.in_feature(in_feature_21),.sum(sum_21),.out_weight(out_weight_21));
  pe pe_22(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_21),.in_feature(in_feature_22),.sum(sum_22),.out_weight(out_weight_22));
  pe pe_23(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_22),.in_feature(in_feature_23),.sum(sum_23),.out_weight(out_weight_23));
  pe pe_24(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_23),.in_feature(in_feature_24),.sum(sum_24),.out_weight(out_weight_24));
  pe pe_25(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_24),.in_feature(in_feature_25),.sum(sum_25),.out_weight(out_weight_25));
  pe pe_26(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_25),.in_feature(in_feature_26),.sum(sum_26),.out_weight(out_weight_26));
  pe pe_27(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_26),.in_feature(in_feature_27),.sum(sum_27),.out_weight(out_weight_27));
  pe pe_28(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_27),.in_feature(in_feature_28),.sum(sum_28),.out_weight(out_weight_28));
  pe pe_29(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_28),.in_feature(in_feature_29),.sum(sum_29),.out_weight(out_weight_29));
  pe pe_30(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_29),.in_feature(in_feature_30),.sum(sum_30),.out_weight(out_weight_30));
  pe pe_31(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_30),.in_feature(in_feature_31),.sum(sum_31),.out_weight(out_weight_31));
  pe pe_32(.clk(clk),.reset(reset),.stop(stop),.in_weight(out_weight_31),.in_feature(in_feature_32),.sum(sum_32),.out_weight());
  
endmodule

// Convolution module
// This is the full code for convolution layer of modified VGG16 model
// This module uses 1-D systolic array defined above to calculate convolution layer
// Kernel size and Stride size are both fixed to 3
// Number of Input/Output Channel can be changed, maximum input image size is 32x32
// Zero padding size is 1 to maintain same output image size after convolution
// Bias is added and Relu activation function is used
// Final result is quantized to 2's complement 8bit fixed point number
// Uses APB for control and AXI VDMA for data exchange with CPU
module conv_module 
  #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 32
  )
  (
    input wire clk,
    input wire rstn,

    // CPU -> FPGA AXI signals
    output wire S_AXIS_TREADY,                                    // AXI ready (Module)
    input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,       // Data (CPU -> FPGA)
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TKEEP,   // X use
    input wire S_AXIS_TUSER,                                      // X use
    input wire S_AXIS_TLAST,                                      // AXI Last    (VDMA)
    input wire S_AXIS_TVALID,                                     // AXI Valid   (VDMA)
    
    // FPGA -> CPU AXI signals
    input wire M_AXIS_TREADY,                                     // AXI ready   (VDMA)
    output wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,      // Data (FPGA -> CPU)
    output wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TKEEP,  // X use
    output wire M_AXIS_TUSER,                                     // X use 
    output wire M_AXIS_TLAST,                                     // AXI Last  (Module)
    output wire M_AXIS_TVALID,                                    // AXI Valid (Module)

    // APB control signals
    input  wire conv_start,    // Start signal for Convolution layer
    output wire conv_done,     // Finish signal for Convolution layer

    input wire [2:0]  COMMAND,     // IDLE:0, Feature Receive:1, Bias Receive:2, Weight Receive:3, Send Result:4
    input wire [8:0]  InCh,        // Number of Input Channel,  Maximum : 256
    input wire [8:0]  OutCh,       // Number of Output Channel, Maximum : 256
    input wire [5:0]  FLength,     // Length of Feature Map,    Maximum : 32

    output reg  F_writedone,                       // Reading feature done
    input wire  F_writedone_respond,               // Begin bias reading
    output reg  B_writedone,                       // Reading bias done
    input wire  B_writedone_respond,               // Begin weight reading
    output reg  rdy_to_transmit,                   // Finished all calculation
    input wire  rdy_to_transmit_respond,           // Begin sending result
    output reg  transmit_done,                     // Sent result
    input wire  transmit_done_respond              // Convolution module finished

  );
  
  reg                                           m_axis_tuser;
  reg [C_S00_AXIS_TDATA_WIDTH-1 : 0]            m_axis_tdata;
  reg [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0]        m_axis_tkeep;
  reg                                           m_axis_tlast;
  reg                                           m_axis_tvalid;
  reg                                           s_axis_tready;
  
  assign S_AXIS_TREADY = s_axis_tready;
  assign M_AXIS_TDATA = m_axis_tdata;
  assign M_AXIS_TLAST = m_axis_tlast;
  assign M_AXIS_TVALID = m_axis_tvalid;
  assign M_AXIS_TUSER = 1'b0;
  assign M_AXIS_TKEEP = {(C_S00_AXIS_TDATA_WIDTH/8) {1'b1}};
  assign conv_done = transmit_done;
  
  // Combinational logic for frequently used variables
  reg [13:0] feature_size, feature_slice_size, output_send_end_address, systolic_cal_num;
  
  always @(*) begin
    feature_size = InCh * FLength * FLength;  
    feature_slice_size = FLength * FLength;
    output_send_end_address =14'h2AF7-((OutCh * FLength * FLength)>>2);
    systolic_cal_num <=FLength+10;
  end
  
  // BRAM
  // Save Features, Bias and Output Result
  // BRAM structure
  // low addr                         <->              high addr
  // feature -> bias ->             <empty>            <- output
  reg [13:0] bram_addr;  // 14bit address, end address 2AF7
  reg [31:0] data_in;
  wire [31:0] data_out;
  reg bram_en;
  reg bram_we;

  sram_32x11000 u_sram_32x11000(
    .addra(bram_addr),
    .clka(clk),
    .dina(data_in),
    .douta(data_out),
    .ena(bram_en),
    .wea(bram_we)
  );
      
  // Top FSM for Convolution Module
  // Uses APB signals for State Transition
  localparam
  IDLE                    = 3'd0, // IDLE
  READ_FEATURE            = 3'd1, // Receive Feature data through AXI VDMA from CPU and save to BRAM
  READ_BIAS               = 3'd2, // Receive Bias through AXI VDMA from CPU and save to BRAM
  READ_WEIGHT_AND_CAL     = 3'd3, // Receive Weight through AXI VDMA from CPU and calculate convolution. Then save the result to BRAM
  SEND                    = 3'd4; // Send Output result to CPU through AXI VDMA

  reg [2:0] state_top;

  always @(posedge clk) begin
    if (!rstn) begin
      state_top <= IDLE;
    end else begin
      case (state_top)
        IDLE: begin
          if (conv_start && S_AXIS_TVALID) begin
            state_top <= READ_FEATURE;
          end else begin
            state_top <= IDLE;
          end
        end
        READ_FEATURE: begin
          if (F_writedone && F_writedone_respond) begin
            state_top <= READ_BIAS; 
          end else begin
            state_top <= READ_FEATURE;
          end
        end
        READ_BIAS: begin
          if (B_writedone && B_writedone_respond) begin
            state_top <= READ_WEIGHT_AND_CAL;
          end else begin
            state_top <= READ_BIAS;
          end
        end
        READ_WEIGHT_AND_CAL: begin
          if (rdy_to_transmit && rdy_to_transmit_respond) begin
            state_top <= SEND;
          end else begin
            state_top <= READ_WEIGHT_AND_CAL;
          end
        end
        SEND: begin
          if (transmit_done && transmit_done_respond) begin
            state_top <= IDLE;
          end else begin
            state_top <= SEND;
          end
        end
      endcase
    end
  end
 

  // Sub FSM : READ_WEIGHT_AND_CAL 
  // For detailed steps of receiving weights and calculating convolution           
  localparam
  READ_WAC_IDLE      = 3'd0,  // IDLE
  READ_WAC_READ      = 3'd1,  // Read weights and save them to local register
  READ_WAC_CONV      = 3'd2,  // Calculate convolution using 1-D systolic array
  READ_WAC_WRITE     = 3'd3,  // Write to output result to BRAM
  READ_WAC_CAL_DONE  = 3'd4;  // Finished all calculation
  
  reg [2:0] read_wac_state;
  
  // State transition signal
  reg
  read_wac_read_done,
  read_wac_conv_done,
  read_wac_write_done;
  
  reg [8:0] read_wac_OutCh_counter;  // Count Output Channel
  reg [8:0] read_wac_InCh_counter;   // Count Input Channel

  always @(posedge clk) begin
    if (!rstn) begin
      read_wac_state <= READ_WAC_IDLE;
      read_wac_OutCh_counter<=0;
      read_wac_InCh_counter<=0;
    end 
    else begin
      case (read_wac_state)
        READ_WAC_IDLE: begin
          if (state_top == READ_WEIGHT_AND_CAL && S_AXIS_TVALID && COMMAND==3) begin
            read_wac_state <= READ_WAC_READ;
          end else begin
            read_wac_state <= READ_WAC_IDLE;
          end
        end
        READ_WAC_READ: begin
          if (read_wac_read_done) begin
            read_wac_state<= READ_WAC_CONV;
            if (read_wac_InCh_counter == InCh) begin
              read_wac_OutCh_counter<=read_wac_OutCh_counter+1;
              read_wac_InCh_counter <= 1;
            end else begin
              read_wac_InCh_counter<=read_wac_InCh_counter+1;
            end
          end else begin
            read_wac_state <= READ_WAC_READ;
          end

        end
        READ_WAC_CONV: begin
          if (read_wac_conv_done) begin
            if (read_wac_InCh_counter == InCh) begin
              read_wac_state <= READ_WAC_WRITE;
            end else begin
              read_wac_state <= READ_WAC_READ;
            end
          end else begin
            read_wac_state <= READ_WAC_CONV;
          end
        end
        READ_WAC_WRITE: begin 
          if (read_wac_write_done) begin
            if (read_wac_OutCh_counter == OutCh-1) begin
              read_wac_state <= READ_WAC_CAL_DONE;
            end
            else read_wac_state <= READ_WAC_READ;
          end else begin
            read_wac_state <= READ_WAC_WRITE;
          end
        end
        READ_WAC_CAL_DONE: begin  
          if (rdy_to_transmit && rdy_to_transmit_respond) begin
            read_wac_state <= READ_WAC_IDLE;
            read_wac_OutCh_counter<=0;
            read_wac_InCh_counter<=0;
          end else begin
            read_wac_state <= READ_WAC_CAL_DONE;
          end
        end
      endcase
    end
  end
  
  //BRAM and AXI signal control to avoid multi-driven net  
  //BRAM data input
  reg [31:0]
  read_feature_data_in,
  read_bias_data_in,
  read_wac_data_in;
  
  //BRAM address
  reg [13:0]
  read_feature_bram_addr,
  read_bias_bram_addr,
  read_wac_bram_addr,
  send_bram_addr;

  //BRAM enable
  reg
  read_feature_bram_en,
  read_bias_bram_en,
  read_wac_bram_en,
  send_bram_en;

  //BRAM Write Enable
  reg
  read_feature_bram_we,
  read_bias_bram_we,
  read_wac_bram_we,
  send_bram_we;

  //AXI ready signal
  reg
  s_axis_tready_rf,
  s_axis_tready_rb,
  s_axis_tready_rwac;
  
  always @(*) begin
    case (state_top)
      READ_FEATURE: begin
        data_in = read_feature_data_in;
        bram_addr = read_feature_bram_addr;
        bram_en = read_feature_bram_en;
        bram_we = read_feature_bram_we;
        
        s_axis_tready = s_axis_tready_rf;
      end
      READ_BIAS: begin
        data_in = read_bias_data_in;
        bram_addr = read_bias_bram_addr;
        bram_en = read_bias_bram_en;
        bram_we = read_bias_bram_we;

        s_axis_tready = s_axis_tready_rb;
      end
      READ_WEIGHT_AND_CAL: begin
        data_in =  read_wac_data_in;
        bram_addr = read_wac_bram_addr;
        bram_en = read_wac_bram_en;
        bram_we = read_wac_bram_we;
        
        s_axis_tready = s_axis_tready_rwac;
      end
      SEND: begin
        bram_addr = send_bram_addr;
        bram_en = send_bram_en;
        bram_we = send_bram_we;
      end
      default: begin
        data_in = 0;
        bram_addr = 0;
        bram_en = 0;
        bram_we = 0;

        s_axis_tready =0;
      end
    endcase
  end
  
  // state_top datapath
  // state_top : READ_FEATURE
  reg [13:0] read_feature_counter;
  reg read_feature_init;
  reg read_feature_done;
  
  always @(posedge clk) begin
    if (!rstn || F_writedone_respond) begin
      s_axis_tready_rf<=0;
      
      read_feature_counter<=0;
      read_feature_init<=0;
      read_feature_done<=0;
      
      read_feature_bram_we<=0;
      read_feature_bram_en<=0;
      read_feature_bram_addr<=0;
      read_feature_data_in<=0;
      
      F_writedone<=0;
      
    end
    else if (state_top == READ_FEATURE) begin
      if (!read_feature_init) begin
        read_feature_init<=1;
        s_axis_tready_rf<=1;
      end
      else begin
        if (read_feature_done) begin
          s_axis_tready_rf<=0;
          read_feature_bram_we<=0;
          read_feature_bram_en<=0;
          read_feature_counter<=0;
          read_feature_bram_addr<=0;
          read_feature_data_in<=0;
          F_writedone<=1;
        end
        else begin
          s_axis_tready_rf<=1;
          read_feature_bram_we<=1;
          read_feature_bram_en<=1;
          if (S_AXIS_TVALID) begin
            read_feature_counter<=read_feature_counter+1;
            read_feature_bram_addr<=read_feature_counter;
            read_feature_data_in<={S_AXIS_TDATA[7:0],S_AXIS_TDATA[15:8],S_AXIS_TDATA[23:16],S_AXIS_TDATA[31:24]};
            if (S_AXIS_TLAST) begin
              read_feature_done<=1;
            end
          end
          else begin
            read_feature_counter<=read_feature_counter;
            read_feature_bram_addr<=read_feature_counter;
          end

        end
        
      end
    end
  end


  // state_top : READ_BIAS
  reg [13:0] read_bias_counter;
  reg read_bias_init;
  reg read_bias_done;
  
  always @(posedge clk) begin
    if (!rstn || B_writedone_respond) begin
      s_axis_tready_rb<=0;
      
      read_bias_counter<=0;
      read_bias_init<=0;
      read_bias_done<=0;
      
      read_bias_bram_we<=0;
      read_bias_bram_en<=0;
      read_bias_bram_addr<=0;
      read_bias_data_in<=0;

      B_writedone<=0;
    end
    else if (state_top == READ_BIAS) begin
      if (!read_bias_init) begin
        read_bias_counter  <=(feature_size>>2);
        read_bias_bram_addr<=(feature_size>>2);
        read_bias_init<=1;
        s_axis_tready_rb<=1;
      end
      else begin
        if (read_bias_done) begin
          s_axis_tready_rb<=0;
          read_bias_bram_we<=0;
          read_bias_bram_en<=0;
          read_bias_counter<=0;
          read_bias_bram_addr<=0;
          read_bias_data_in<=0;
          B_writedone<=1;
        end
        else begin
          s_axis_tready_rb<=1;
          read_bias_bram_we<=1;
          read_bias_bram_en<=1;
          if (S_AXIS_TVALID) begin
            read_bias_counter<=read_bias_counter+1;
            read_bias_bram_addr<=read_bias_counter;
            read_bias_data_in<=S_AXIS_TDATA;
            if (S_AXIS_TLAST) begin
              read_bias_done<=1;
            end     
          end
          else begin
            read_bias_counter<=read_bias_counter;
            read_bias_bram_addr<=read_bias_counter;
          end

        end
      end
    end
  end
  
  // state_top : READ_WEIGHT_AND_CAL
  // 1-D Systolic Array module declaration for convolution module
  reg reset,stop;
  wire reset_sys;
  reg signed [7:0] in_weight,
  in_feature_1,in_feature_2,in_feature_3,in_feature_4,in_feature_5,in_feature_6,in_feature_7,in_feature_8,
  in_feature_9,in_feature_10,in_feature_11,in_feature_12,in_feature_13,in_feature_14,in_feature_15,in_feature_16,
  in_feature_17,in_feature_18,in_feature_19,in_feature_20,in_feature_21,in_feature_22,in_feature_23,in_feature_24,
  in_feature_25,in_feature_26,in_feature_27,in_feature_28,in_feature_29,in_feature_30,in_feature_31,in_feature_32;
  wire signed [26:0] sum_1,sum_2,sum_3,sum_4,sum_5,sum_6,sum_7,sum_8,sum_9,sum_10,sum_11,sum_12,sum_13,sum_14,sum_15,sum_16,
  sum_17,sum_18,sum_19,sum_20,sum_21,sum_22,sum_23,sum_24,sum_25,sum_26,sum_27,sum_28,sum_29,sum_30,sum_31,sum_32;

  systolic_conv sys(.clk(clk),.reset(reset_sys),.stop(stop),.in_weight(in_weight),
  .in_feature_1(in_feature_1),.in_feature_2(in_feature_2),.in_feature_3(in_feature_3),.in_feature_4(in_feature_4),
  .in_feature_5(in_feature_5),.in_feature_6(in_feature_6),.in_feature_7(in_feature_7),.in_feature_8(in_feature_8),
  .in_feature_9(in_feature_9),.in_feature_10(in_feature_10),.in_feature_11(in_feature_11),.in_feature_12(in_feature_12),
  .in_feature_13(in_feature_13),.in_feature_14(in_feature_14),.in_feature_15(in_feature_15),.in_feature_16(in_feature_16),
  .in_feature_17(in_feature_17),.in_feature_18(in_feature_18),.in_feature_19(in_feature_19),.in_feature_20(in_feature_20),
  .in_feature_21(in_feature_21),.in_feature_22(in_feature_22),.in_feature_23(in_feature_23),.in_feature_24(in_feature_24),
  .in_feature_25(in_feature_25),.in_feature_26(in_feature_26),.in_feature_27(in_feature_27),.in_feature_28(in_feature_28),
  .in_feature_29(in_feature_29),.in_feature_30(in_feature_30),.in_feature_31(in_feature_31),.in_feature_32(in_feature_32),

  .sum_1(sum_1),.sum_2(sum_2),.sum_3(sum_3),.sum_4(sum_4),.sum_5(sum_5),.sum_6(sum_6),.sum_7(sum_7),.sum_8(sum_8),
  .sum_9(sum_9),.sum_10(sum_10),.sum_11(sum_11),.sum_12(sum_12),.sum_13(sum_13),.sum_14(sum_14),.sum_15(sum_15),.sum_16(sum_16),
  .sum_17(sum_17),.sum_18(sum_18),.sum_19(sum_19),.sum_20(sum_20),.sum_21(sum_21),.sum_22(sum_22),.sum_23(sum_23),.sum_24(sum_24),
  .sum_25(sum_25),.sum_26(sum_26),.sum_27(sum_27),.sum_28(sum_28),.sum_29(sum_29),.sum_30(sum_30),.sum_31(sum_31),.sum_32(sum_32)
  );
  
  assign reset_sys = reset | !rstn;
  

  // Integer for for loop
  genvar a;
  integer b, c1, c2, d1, d2, e, f, g1, g2;

  // State initialization signal
  reg read_wac_read_init;

  // BRAM address for Sub FSM : READ_WEIGHT_AND_CAL
  reg [13:0]
  read_wac_read_bram_addr,           // BRAM read address for bias
  read_wac_conv_bram_addr,           // BRAM read address for feature
  read_wac_write_bram_addr;          // BRAM save address for conv result
  reg [1:0] read_wac_bram_delay;     // Delay needed for reading bram

  always @(*) begin
    case (read_wac_state)
      READ_WAC_READ : read_wac_bram_addr = read_wac_read_bram_addr;
      READ_WAC_CONV : read_wac_bram_addr = read_wac_conv_bram_addr;
      READ_WAC_WRITE: read_wac_bram_addr = read_wac_write_bram_addr;
      default : read_wac_bram_addr = 0;
    endcase
  end

  // For read_wac_state : READ_WAC_READ
  reg [31:0] bias_buffer;                  // Read bias from BRAM to buffer
  reg bias_buffer_done;                    // Done signal for reading bias from BRAM
  reg [31:0] read_weight_buffer;           // Save last line saved on register
  reg [1:0] read_wac_weight_state;         // 00(read 3 line) -> 01,10,11 (read 2 line) -> 00...
  reg [1:0] read_wac_weight_line_counter;  // How many lines did you read?

  // For read_wac_state : READ_WAC_CONV
  reg [5:0] systolic_cal_counter;          // Clock counter for Systolic Array calculation
  reg [4:0] fr_row_counter;                // How many rows did you calculate?
  reg [4:0] fr_col_counter;                // For (row,"col") position of pe_in setting
  reg [1:0] fr_row_idx, fr_col_idx;        // Second index used for saving feature inputs from BRAM to read_wac_pe_in register, considering zero-padding
  reg read_wac_conv_delay;
  reg read_wac_conv_read_feature_done;
  reg frcc_max;

  // Registers for 1-D systolic array input and saving the result
  reg signed [7:0] read_wac_weight_in [0:41];     // systolic weight input,  
  reg signed [7:0] read_wac_pe_in [0:31] [0:41];  // systolic pe input,      
  reg signed [26:0] partial_result [0:31] [0:31]; // partial sum save,   

  // Combinational logic for fast calculation
  reg [5:0]  frc_9,frr,fcc,fc3rc;
  always @(*) begin
    frc_9 = fr_col_counter+9;
    frr = fr_row_counter+fr_row_idx-1;
    fcc = fr_col_counter+fr_col_idx-1;
    fc3rc = fr_col_counter+(3*fr_row_idx)+fr_col_idx;
  end
  wire [1:0] bias_buffer_pos;
  assign bias_buffer_pos = read_wac_OutCh_counter[1:0];

  // For read_wac_state : READ_WAC_WRITE
  reg [4:0] write_row_idx, write_col_idx;
  reg write_row_max, write_col_max;
  reg write_delay;
  reg [31:0] write_buffer;
  
  always @(posedge clk) begin
    if (!rstn) begin
      s_axis_tready_rwac<=0;
      rdy_to_transmit<=0;

      read_wac_bram_we<=0;
      read_wac_bram_en<=0;
      read_wac_data_in<=0;

      read_wac_read_init <=0;

      read_wac_read_done<=0;
      read_wac_conv_done<=0;
      read_wac_write_done<=0;

      read_wac_read_bram_addr<=0;
      read_wac_conv_bram_addr<=0;
      read_wac_write_bram_addr<=0;
      read_wac_bram_delay<=0;

      
      // For read_wac_state : READ_WAC_READ
      bias_buffer <=0;
      bias_buffer_done<=0;
      read_weight_buffer <=0;
      read_wac_weight_state         <=2'b00;
      read_wac_weight_line_counter  <=2'b00;
      
      // For read_wac_state : READ_WAC_CONV
      systolic_cal_counter          <=0;
      fr_row_counter                <=0;
      fr_col_counter                <=0;
      fr_row_idx<=0;fr_col_idx<=0;
      read_wac_conv_delay<=0;
      read_wac_conv_read_feature_done <=0;
      frcc_max<=0;

      //For initialization of registers used in Systolic Array
      for (b=0;b<42;b=b+1) begin
        read_wac_weight_in[b]<=0;
      end

      for (c1=0;c1<32;c1=c1+1) begin
        for (c2=0;c2<42;c2=c2+1) begin
          read_wac_pe_in [c1][c2] <=0;
        end
      end

      for (d1=0;d1<32;d1=d1+1) begin
        for (d2=0;d2<32;d2=d2+1) begin
          partial_result [d1] [d2] <=0;
        end
      end

      // For read_wac_state : READ_WAC_WRITE
      write_row_idx<=0; write_col_idx<=0;
      write_row_max<=0; write_col_max<=0;
      write_delay<=0;
      write_buffer<=0;
      
      // For Systolic Array Input
      reset<=0;
      stop<=0;
      in_weight <=0;
      in_feature_1<=0;in_feature_2<=0;in_feature_3<=0;in_feature_4<=0;
      in_feature_5<=0;in_feature_6=0;in_feature_7<=0;in_feature_8<=0;
      in_feature_9<=0;in_feature_10<=0;in_feature_11<=0;in_feature_12<=0;
      in_feature_13<=0;in_feature_14<=0;in_feature_15<=0;in_feature_16<=0;
      in_feature_17<=0;in_feature_18<=0;in_feature_19<=0;in_feature_20<=0;
      in_feature_21<=0;in_feature_22=0;in_feature_23<=0;in_feature_24<=0;
      in_feature_25<=0;in_feature_26<=0;in_feature_27<=0;in_feature_28<=0;
      in_feature_29<=0;in_feature_30<=0;in_feature_31<=0;in_feature_32<=0;
    end

    else begin
      case(read_wac_state)
        READ_WAC_IDLE: begin
          rdy_to_transmit <=0;
        end

        READ_WAC_READ: begin
          if (!read_wac_read_init) begin
            read_wac_read_init <=1;
            read_wac_read_bram_addr <= (feature_size>>2)-1;
            read_wac_write_bram_addr <= 14'h2AF8;             // Last address+1 of bram
          end
          else begin
            if (read_wac_read_done) begin

            end
            else begin
              read_wac_conv_done<=0;
              read_wac_write_done<=0;
              
              // Reading bias from BRAM and saving to bias_buffer
              if ((read_wac_InCh_counter==1) && (read_wac_OutCh_counter[1:0]==0)) begin
                if (read_wac_bram_delay==2'b11) begin
                  read_wac_bram_en<=0;
                  read_wac_bram_delay<=2'b00;
                  bias_buffer_done<=1;
                end
                else if (read_wac_bram_delay==2'b10) begin
                  bias_buffer<=data_out;
                  read_wac_bram_delay<=2'b11;
                end
                else if (read_wac_bram_delay==2'b01) begin
                  read_wac_bram_delay<=2'b10;
                end
                else if (!bias_buffer_done) begin
                  read_wac_read_bram_addr<=read_wac_read_bram_addr+1;
                  read_wac_bram_en<=1;
                  read_wac_bram_we<=0;
                  read_wac_bram_delay<=2'b01;
                end
              end
              
              // Reading weights and saving to read_wac_weight_in register
              case(read_wac_weight_state)
                2'b00: begin
    
                  if (read_wac_weight_line_counter==0) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==1) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[0] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[1] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[2] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[3] <= S_AXIS_TDATA[31:24];                    
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==2) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[4] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[5] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[6] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[7] <= S_AXIS_TDATA[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else begin
                    s_axis_tready_rwac<=0;
                    read_wac_weight_in[8] <= S_AXIS_TDATA[7:0];
                    read_weight_buffer <= S_AXIS_TDATA;
                    read_wac_weight_state <= read_wac_weight_state+1;
                    read_wac_weight_line_counter <= 0;
                    read_wac_read_done<=1;                 
                  end
                end
              
                2'b01: begin
    
                  if (read_wac_weight_line_counter==0) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[0] <= read_weight_buffer[15:8];
                    read_wac_weight_in[1] <= read_weight_buffer[23:16];
                    read_wac_weight_in[2] <= read_weight_buffer[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==1) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[3] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[4] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[5] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[6] <= S_AXIS_TDATA[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==2) begin
                    s_axis_tready_rwac<=0;
                    read_wac_weight_in[7] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[8] <= S_AXIS_TDATA[15:8];
                    read_weight_buffer <= S_AXIS_TDATA;
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else begin
                    read_wac_weight_state <= read_wac_weight_state+1;
                    read_wac_weight_line_counter <= 0;
                    read_wac_read_done<=1;
                  end
                end

                2'b10: begin
    
                  if (read_wac_weight_line_counter==0) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[0] <= read_weight_buffer[23:16];
                    read_wac_weight_in[1] <= read_weight_buffer[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==1) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[2] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[3] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[4] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[5] <= S_AXIS_TDATA[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==2) begin
                    s_axis_tready_rwac<=0;
                    read_wac_weight_in[6] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[7] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[8] <= S_AXIS_TDATA[23:16];
                    read_weight_buffer <= S_AXIS_TDATA;
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else begin
                    read_wac_weight_state <= read_wac_weight_state+1;
                    read_wac_weight_line_counter <= 0;
                    read_wac_read_done<=1;
                  end                
                end

                2'b11: begin
    
                  if (read_wac_weight_line_counter==0) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[0] <= read_weight_buffer[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==1) begin
                    s_axis_tready_rwac<=1;
                    read_wac_weight_in[1] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[2] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[3] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[4] <= S_AXIS_TDATA[31:24];
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else if (read_wac_weight_line_counter==2) begin
                    s_axis_tready_rwac<=0;
                    read_wac_weight_in[5] <= S_AXIS_TDATA[7:0];
                    read_wac_weight_in[6] <= S_AXIS_TDATA[15:8];
                    read_wac_weight_in[7] <= S_AXIS_TDATA[23:16];
                    read_wac_weight_in[8] <= S_AXIS_TDATA[31:24];
                    read_weight_buffer <= S_AXIS_TDATA;
                    read_wac_weight_line_counter <= read_wac_weight_line_counter +1;
                  end
                  else begin
                    read_wac_weight_state <= read_wac_weight_state+1;
                    read_wac_weight_line_counter <= 0;
                    read_wac_read_done<=1;
                  end
                end

            endcase

            end
            
          end
      
        end

        READ_WAC_CONV: begin
          if (!read_wac_conv_done && read_wac_conv_read_feature_done) begin
            // Calcualtes convolution using 1-D Systolic Array            
            if (systolic_cal_counter == systolic_cal_num) begin
              if (read_wac_conv_delay) begin

                for (e=0;e<32;e=e+1) begin
                  partial_result[fr_row_counter][e] <= partial_result[fr_row_counter][e];
                end

                if (fr_row_counter == FLength-1) begin 
                  fr_row_counter<=0;
                  read_wac_conv_done<=1;
                end 
                else fr_row_counter<=fr_row_counter+1;

                read_wac_conv_read_feature_done<=0;
                systolic_cal_counter<=0;
                read_wac_conv_delay<=0;
                reset<=0;
                stop<=0;
              end
              else begin
                partial_result[fr_row_counter][0]  <= partial_result[fr_row_counter][0]  +sum_1;
                partial_result[fr_row_counter][1]  <= partial_result[fr_row_counter][1]  +sum_2;
                partial_result[fr_row_counter][2]  <= partial_result[fr_row_counter][2]  +sum_3;
                partial_result[fr_row_counter][3]  <= partial_result[fr_row_counter][3]  +sum_4;
                partial_result[fr_row_counter][4]  <= partial_result[fr_row_counter][4]  +sum_5;
                partial_result[fr_row_counter][5]  <= partial_result[fr_row_counter][5]  +sum_6;
                partial_result[fr_row_counter][6]  <= partial_result[fr_row_counter][6]  +sum_7;
                partial_result[fr_row_counter][7]  <= partial_result[fr_row_counter][7]  +sum_8;
                partial_result[fr_row_counter][8]  <= partial_result[fr_row_counter][8]  +sum_9;
                partial_result[fr_row_counter][9]  <= partial_result[fr_row_counter][9]  +sum_10;
                partial_result[fr_row_counter][10] <= partial_result[fr_row_counter][10] +sum_11;
                partial_result[fr_row_counter][11] <= partial_result[fr_row_counter][11] +sum_12;
                partial_result[fr_row_counter][12] <= partial_result[fr_row_counter][12] +sum_13;
                partial_result[fr_row_counter][13] <= partial_result[fr_row_counter][13] +sum_14;
                partial_result[fr_row_counter][14] <= partial_result[fr_row_counter][14] +sum_15;
                partial_result[fr_row_counter][15] <= partial_result[fr_row_counter][15] +sum_16;
                partial_result[fr_row_counter][16] <= partial_result[fr_row_counter][16] +sum_17;
                partial_result[fr_row_counter][17] <= partial_result[fr_row_counter][17] +sum_18;
                partial_result[fr_row_counter][18] <= partial_result[fr_row_counter][18] +sum_19;
                partial_result[fr_row_counter][19] <= partial_result[fr_row_counter][19] +sum_20;
                partial_result[fr_row_counter][20] <= partial_result[fr_row_counter][20] +sum_21;
                partial_result[fr_row_counter][21] <= partial_result[fr_row_counter][21] +sum_22;
                partial_result[fr_row_counter][22] <= partial_result[fr_row_counter][22] +sum_23;
                partial_result[fr_row_counter][23] <= partial_result[fr_row_counter][23] +sum_24;
                partial_result[fr_row_counter][24] <= partial_result[fr_row_counter][24] +sum_25;
                partial_result[fr_row_counter][25] <= partial_result[fr_row_counter][25] +sum_26;
                partial_result[fr_row_counter][26] <= partial_result[fr_row_counter][26] +sum_27;
                partial_result[fr_row_counter][27] <= partial_result[fr_row_counter][27] +sum_28;
                partial_result[fr_row_counter][28] <= partial_result[fr_row_counter][28] +sum_29;
                partial_result[fr_row_counter][29] <= partial_result[fr_row_counter][29] +sum_30;
                partial_result[fr_row_counter][30] <= partial_result[fr_row_counter][30] +sum_31;
                partial_result[fr_row_counter][31] <= partial_result[fr_row_counter][31] +sum_32;
                systolic_cal_counter<=systolic_cal_counter;
                read_wac_conv_delay<=1;
                reset<=1;
                stop<=1;
              end            
            end
            else begin
              in_weight     <=read_wac_weight_in[systolic_cal_counter];
              in_feature_1  <= read_wac_pe_in[0][systolic_cal_counter];
              in_feature_2  <= read_wac_pe_in[1][systolic_cal_counter];
              in_feature_3  <= read_wac_pe_in[2][systolic_cal_counter];
              in_feature_4  <= read_wac_pe_in[3][systolic_cal_counter];
              in_feature_5  <= read_wac_pe_in[4][systolic_cal_counter];
              in_feature_6  <= read_wac_pe_in[5][systolic_cal_counter];
              in_feature_7  <= read_wac_pe_in[6][systolic_cal_counter];
              in_feature_8  <= read_wac_pe_in[7][systolic_cal_counter];
              in_feature_9  <= read_wac_pe_in[8][systolic_cal_counter];
              in_feature_10 <= read_wac_pe_in[9][systolic_cal_counter];
              in_feature_11 <= read_wac_pe_in[10][systolic_cal_counter];
              in_feature_12 <= read_wac_pe_in[11][systolic_cal_counter];
              in_feature_13 <= read_wac_pe_in[12][systolic_cal_counter];
              in_feature_14 <= read_wac_pe_in[13][systolic_cal_counter];
              in_feature_15 <= read_wac_pe_in[14][systolic_cal_counter]; 
              in_feature_16 <= read_wac_pe_in[15][systolic_cal_counter]; 
              in_feature_16  <= read_wac_pe_in[15][systolic_cal_counter];
              in_feature_17  <= read_wac_pe_in[16][systolic_cal_counter];
              in_feature_18  <= read_wac_pe_in[17][systolic_cal_counter];
              in_feature_19  <= read_wac_pe_in[18][systolic_cal_counter];
              in_feature_20  <= read_wac_pe_in[19][systolic_cal_counter];
              in_feature_21  <= read_wac_pe_in[20][systolic_cal_counter];
              in_feature_22  <= read_wac_pe_in[21][systolic_cal_counter];
              in_feature_23  <= read_wac_pe_in[22][systolic_cal_counter];
              in_feature_24  <= read_wac_pe_in[23][systolic_cal_counter];
              in_feature_25  <= read_wac_pe_in[24][systolic_cal_counter];
              in_feature_26  <= read_wac_pe_in[25][systolic_cal_counter];
              in_feature_27  <= read_wac_pe_in[26][systolic_cal_counter];
              in_feature_28  <= read_wac_pe_in[27][systolic_cal_counter];
              in_feature_29  <= read_wac_pe_in[28][systolic_cal_counter];
              in_feature_30  <= read_wac_pe_in[29][systolic_cal_counter];
              in_feature_31  <= read_wac_pe_in[30][systolic_cal_counter];
              in_feature_32  <= read_wac_pe_in[31][systolic_cal_counter];

              systolic_cal_counter<=systolic_cal_counter+1;
            end
          end
          // Setting Bias and Feature from BRAM to read_wac_pe_in register
          else if (!read_wac_conv_done) begin
            if (frcc_max) begin
              read_wac_conv_read_feature_done<=1;
              frcc_max<=0;
              read_wac_bram_en<=0;
            end

            else begin

              if(fr_row_idx == 3) begin
                fr_row_idx<=0 ;
                if (fr_col_counter == FLength-1) begin
                  fr_col_counter<=0;
                  frcc_max <=1;
                end
                else fr_col_counter <= fr_col_counter+1;
                if (read_wac_InCh_counter==InCh) begin
                  read_wac_weight_in [9] <=  8'b0100_0000;
                  case(bias_buffer_pos)
                    2'b00: read_wac_pe_in [fr_col_counter] [frc_9] <= bias_buffer[7:0];
                    2'b01: read_wac_pe_in [fr_col_counter] [frc_9] <= bias_buffer[15:8];
                    2'b10: read_wac_pe_in [fr_col_counter] [frc_9] <= bias_buffer[23:16];
                    2'b11: read_wac_pe_in [fr_col_counter] [frc_9] <= bias_buffer[31:24];
                  endcase
                end
                else begin
                  read_wac_weight_in [9] <=0;
                  read_wac_pe_in [fr_col_counter] [fr_col_counter+9] <=0;
                end
              end
              else begin
                if (fr_col_idx == 3) begin
                  fr_col_idx<=0;
                  fr_row_idx<=fr_row_idx+1;                  
                end
                else begin
                  if (read_wac_bram_delay==2'b10) begin
                    if ((frr>=0) && (frr<=FLength-1) && (fcc>=0) && (fcc<=FLength-1)) begin
                      // This part is very very slow. It checks 1 element at a time if it's valid data and not zero-padding
                      // It reads BRAM every single time for setting 1 element
                      // I had very little time for my project so I focused more on the functionality than speed
                      // You can modify this architecture using parallelism to speed up the calculation
                      case(fcc[1:0]) 
                        2'b00: read_wac_pe_in [fr_col_counter][fc3rc] <= data_out[31:24];
                        2'b01: read_wac_pe_in [fr_col_counter][fc3rc] <= data_out[23:16];
                        2'b10: read_wac_pe_in [fr_col_counter][fc3rc] <= data_out[15:8];
                        2'b11: read_wac_pe_in [fr_col_counter][fc3rc] <= data_out[7:0];
                      endcase
                    end
                    else begin
                      read_wac_pe_in [fr_col_counter][fc3rc]<=0;
                    end
                    read_wac_bram_delay<=2'b00;
                    fr_col_idx<=fr_col_idx+1;
                  end
                  else if (read_wac_bram_delay==2'b01) begin
                    read_wac_bram_delay<=2'b10;                      
                  end
                  else begin
                    read_wac_conv_bram_addr<=(read_wac_InCh_counter-1)*(feature_slice_size>>2)+(FLength>>2)*frr[4:0]+fcc[4:2];
                    read_wac_bram_en<=1;
                    read_wac_bram_we<=0;
                    read_wac_bram_delay<=2'b01;
                    read_wac_read_done<=0;
                    bias_buffer_done<=0;
                  end

                end                               
              end

            end
          end

        
        end
        
        READ_WAC_WRITE: begin
          if (write_row_max) begin
            read_wac_bram_en<=0;
            read_wac_bram_we<=0;
            read_wac_data_in<=0;

            write_row_max<=0;
            read_wac_write_done<=1;          
          end
          else begin
            if (write_col_max) begin
              write_col_max<=0;
              if (write_row_idx==FLength-1) begin
                write_row_idx<=0;
                write_row_max<=1;
              end
              else write_row_idx<=write_row_idx+1;    
            end
            else if (!read_wac_write_done) begin
              if (write_delay) begin
                write_delay<=0;
                if (write_col_idx==FLength-4) begin
                  write_col_idx<=0;
                  write_col_max<=1;
                end
                else write_col_idx<=write_col_idx+4;

                read_wac_bram_en<=1;
                read_wac_write_bram_addr<=read_wac_write_bram_addr;
                read_wac_data_in<=write_buffer;

                partial_result[write_row_idx][write_col_idx]<=0;
                partial_result[write_row_idx][write_col_idx+1]<=0;
                partial_result[write_row_idx][write_col_idx+2]<=0;
                partial_result[write_row_idx][write_col_idx+3]<=0;
              end
              else begin
                // Write 4 results at a time to BRAM
                // Result 1
                if (partial_result[write_row_idx][write_col_idx][26]) begin
                  write_buffer[7:0] <=0;
                end
                else begin
                  if (partial_result[write_row_idx][write_col_idx][25:13] != 0) begin
                    write_buffer[7:0] <= 8'b0111_1111;
                  end
                  else begin
                    write_buffer[7:0] <= {1'b0,partial_result[write_row_idx][write_col_idx][12:6]};
                  end
                end
                // Result 2
                if (partial_result[write_row_idx][write_col_idx+1][26]) begin
                  write_buffer[15:8] <=0;
                end
                else begin
                  if (partial_result[write_row_idx][write_col_idx+1][25:13] != 0) begin
                    write_buffer[15:8] <= 8'b0111_1111;
                  end
                  else begin
                    write_buffer[15:8] <= {1'b0,partial_result[write_row_idx][write_col_idx+1][12:6]};
                  end
                end
                // Result 3
                if (partial_result[write_row_idx][write_col_idx+2][26]) begin
                  write_buffer[23:16] <=0;
                end
                else begin
                  if (partial_result[write_row_idx][write_col_idx+2][25:13] != 0) begin
                    write_buffer[23:16] <= 8'b0111_1111;
                  end
                  else begin
                    write_buffer[23:16] <= {1'b0,partial_result[write_row_idx][write_col_idx+2][12:6]};
                  end
                end
                // Result 4
                if (partial_result[write_row_idx][write_col_idx+3][26]) begin
                  write_buffer[31:24] <=0;
                end
                else begin
                  if (partial_result[write_row_idx][write_col_idx+3][25:13] != 0) begin
                    write_buffer[31:24] <= 8'b0111_1111;
                  end
                  else begin
                    write_buffer[31:24] <= {1'b0,partial_result[write_row_idx][write_col_idx+3][12:6]};
                  end
                end

                write_delay<=1;
                read_wac_conv_done<=0;
                read_wac_write_bram_addr <= read_wac_write_bram_addr-1;
                read_wac_bram_en<=0;
                read_wac_bram_we<=1;
              end
            end            
            
          end

        end

        READ_WAC_CAL_DONE: begin
          // Initializing all variables used in read_wac_state
          read_wac_read_init<=0;
          read_wac_write_done<=0;

          bias_buffer<=0;
          read_weight_buffer<=0;
          read_wac_weight_state<=0;
          read_wac_weight_line_counter<=0;

          for (f=0;f<42;f=f+1) begin
            read_wac_weight_in[f]<=0;
          end

          for (g1=0;g1<32;g1=g1+1) begin
            for (g2=0;g2<42;g2=g2+1) begin
              read_wac_pe_in [g1][g2] <=0;
            end
          end

          if (rdy_to_transmit_respond) rdy_to_transmit<=0;
          else rdy_to_transmit<=1;
        end
      


      endcase

    end

 
  end

  // state_top : SEND
  reg [1:0] send_bram_delay;
  reg send_restart_delay;
  reg [13:0] send_output_counter;

  always @(posedge clk) begin
    if(!rstn) begin
      m_axis_tvalid<=0;
      m_axis_tlast<=0;
      m_axis_tdata<=0;

      send_bram_addr<=0;
      send_bram_en<=0;
      send_bram_we<=0;
      send_bram_delay<=0;
      send_restart_delay<=0;
      send_output_counter<=0;
      
      transmit_done<=0;
    
    end

    else begin
      if (transmit_done) begin
        m_axis_tvalid<=0;
        m_axis_tdata<=0;

        send_bram_addr<=0;
        send_output_counter<=0;
        send_bram_en<=0;
        send_bram_we<=0;
        send_bram_delay<=0;
        send_restart_delay<=0;

        if(transmit_done_respond) begin
          m_axis_tlast<=0;
          transmit_done<=0;
        end
      end
      else if (state_top == SEND) begin
        if (send_bram_delay==2'b11) begin
          if (M_AXIS_TREADY) begin
            if (m_axis_tvalid) begin
              m_axis_tvalid<=1;
              m_axis_tdata<=data_out;
              send_output_counter<=send_output_counter-1;
              send_bram_addr<=send_bram_addr-1;
              if (send_bram_addr== output_send_end_address) begin
                m_axis_tlast<=1;
                transmit_done<=1;
              end
            end
            else if (!send_restart_delay) begin
              send_restart_delay<=1;
              m_axis_tvalid<=1;
              m_axis_tdata<=data_out;
              send_output_counter<=send_output_counter-1;
              send_bram_addr<=send_bram_addr-1;
            end
            else begin
              send_restart_delay<=0;
              send_output_counter<=send_output_counter+1;
              send_bram_addr<=send_bram_addr-1;
            end
          end
          else begin
            m_axis_tvalid<=0;
            send_bram_addr<=send_output_counter;
            send_output_counter<=send_output_counter;
            send_restart_delay<=1;
          end

        end
        else if(send_bram_delay==2'b10) begin          
          m_axis_tvalid<=1;
          m_axis_tdata<=data_out;
          send_bram_addr<=send_bram_addr-1;
          send_bram_delay<=2'b11;
        end
        else if(send_bram_delay==2'b01) begin
          send_bram_addr<=send_bram_addr-1;
          send_bram_delay<=2'b10;          
        end
        else if(M_AXIS_TREADY && send_bram_delay==2'b00) begin
          send_output_counter <=14'h2AF7;
          send_bram_addr<=14'h2AF7;
          send_bram_en<=1;
          send_bram_we<=0;
          send_bram_delay<=2'b01;        
        end

      end

    end

  end

endmodule