import CORE_PKG::*;

module LSU (
  // General Inputs
  input logic clock,
  input logic reset,
  input logic data_gnt_i,

  // Inputs from decode
  input logic lsu_en_ip,                      // enable the LSU because it is a memory operation
  input load_store_func_code lsu_operator_ip, 

  // Input from ALU
  input logic alu_valid_ip,
  input logic [31:0] mem_addr_ip,             // address to access in mem for read/write

  // Input data from DRAM after load
  input logic [31:0] mem_data_ip,

  // Output to Decode
  output logic data_req_op,                  // validity of data address request
  output logic [31:0] load_mem_data_op      // data from load to sent to decode 
);

  logic valid_mem_operation;
  assign valid_mem_operation = data_gnt_i & lsu_en_ip & alu_valid_ip;

  always @(*) begin
    data_req_op = 1'b0;
    load_mem_data_op = 32'hz;

    if (valid_mem_operation == 1'b1) begin
      data_req_op = 1'b1;
      case (lsu_operator_ip)
        LW: begin
          if ((mem_addr_ip % 4 == 0)) begin //Memory Aligned
            data_req_op = 1'b1;
            load_mem_data_op = mem_data_ip;
          end else begin
            data_req_op = 1'b0; //Invalid address
          end
        end
        
        SW: begin
          if ((mem_addr_ip % 4 == 0)) begin //Memory Aligned
              data_req_op = 1'b1;
          end else begin
              data_req_op = 1'b0; //Invalid address
          end 
        end
      endcase
    end
  end

endmodule
