package CORE_PKG;
  
  //STORES OPCODE includes sb, sh, sw
  parameter OPCODE_STORE = 7'h23;
  
  //LOAD opcode includes lb, lh, lw, lbu, lhu
  parameter OPCODE_LOAD = 7'h03;
  
  // BRANCH opcode includes beq, bne, blt, bge, bltu, and bgeu
  parameter OPCODE_BRANCH = 7'h63;
  
  parameter OPCODE_JALR = 7'h67;
  parameter OPCODE_JAL = 7'h6f;
  parameter OPCODE_AUIPC = 7'h17;
  parameter OPCODE_LUI = 7'h37;
  
  //All register to register instructions
  parameter OPCODE_OP = 7'h33;

  //All register immediate instructions
  parameter OPCODE_OPIMM = 7'h13;


  //*************************
  // ALU Operations for Masking
  //*************************
  typedef enum logic [6:0] {
    ALU_NOP   = 7'b0000000,
    ALU_ADD   = 7'b0011000,
    ALU_SUB   = 7'b0011001,
    ALU_ADDU  = 7'b0011010,
    ALU_SUBU  = 7'b0011011,
    ALU_ADDR  = 7'b0011100,
    ALU_SUBR  = 7'b0011101,
    ALU_ADDUR = 7'b0011110,
    ALU_SUBUR = 7'b0011111,

    ALU_XOR = 7'b0101111,
    ALU_OR  = 7'b0101110,
    ALU_AND = 7'b0010101,

    // Shifts
    ALU_SRA = 7'b0100100,
    ALU_SRL = 7'b0100101,
    ALU_ROR = 7'b0100110,
    ALU_SLL = 7'b0100111,

    // Set Lower Than operations
    ALU_SLTS  = 7'b0000010,
    ALU_SLTU  = 7'b0000011,
    ALU_SLETS = 7'b0000110,
    ALU_SLETU = 7'b0000111

  } alu_opcode_e;


  typedef enum {
    REG_A, PC, OPA_NOP, PC4
  } operand_a_mux;


  typedef enum logic [2:0] {
    REG = 3'b000,
    I_IMMD = 3'b001,
    S_IMMD = 3'b010,
    U_IMMD = 3'b011,
    J_IMMD = 3'b100,
    OPB_NOP = 3'b101
  } operand_b_mux;


  typedef enum logic [2:0] {
    LW,
    LH,
    LB,
    LHU,
    LBU,
    SW, 
    SH,
    SB 
  } load_store_func_code;


  typedef enum logic [2:0] {
    NO_WRITEBACK = 3'b000,
    READ_ALU_RESULT = 3'b001, 
    READ_MEM_RESULT = 3'b010,
    READ_REGFILE = 3'b011,
    READ_PC4 = 3'b100,
    READ_COMPARATOR_RESULT = 3'b101
  } write_back_mux_selector;


  typedef enum {
    NEXTPC,
    ALU_RESULT,
    ALU_RESULT_JALR,
    OFFSET
  } pc_mux;

  typedef enum logic [2:0] {
    COMP_BEQ = 3'b000,
    COMP_BNE = 3'b001,
    COMP_BLT = 3'b100,
    COMP_BGE = 3'b101,
    COMP_BLT_U = 3'b110,
    COMP_BGE_U = 3'b111,
    
    COMP_SLTS  = 3'b010,
    COMP_SLTU  = 3'b011
  } comparator_func_code;

endpackage
