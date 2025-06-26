
`ifndef BSG_MEM_1R1W_SYNC_MACROS_VH
`define BSG_MEM_1R1W_SYNC_MACROS_VH

// Synchronous Two-Port Register File
// Compatible with Following compilers:
// TODO: Re-analyze all constants
`define bsg_mem_1r1w_sync_2hdrf_macro(words,bits,tag) \
 if (harden_p && els_p == words && width_p == bits) \
    begin: macro                                    \
    n6_1r1w_d``words``_w``bits``_``tag``_2hdrf        \
      mem (              \
       .QB(r_data_o)     \
      ,.ADRA(w_addr_i)   \
      ,.DA(w_data_i)     \
      ,.WEA(1'b1)       \
      ,.MEA(1'b1)       \
      ,.CLKA(clk_i)      \
      ,.TEST1A(1'b0)     \
      ,.TEST_RNMA(1'b0)  \
      ,.RMEA(1'b0)       \
      ,.RMA(4'b0)        \
      ,.LS(1'b0)         \
      ,.ADRB(r_addr_i)   \
      ,.MEB(r_v_i)       \
      ,.CLKB(clk_i)      \
      ,.TEST1B()         \
      ,.RMEB(1'b0)       \
      ,.RMB(4'b0)        \
    );                   \
  end

`define bsg_mem_1r1w_sync_2hdrf_macro_pad(words,bits,tag,sram_bits) \
 if (harden_p && els_p == words && width_p == bits)               \
    begin: macro                                                  \
    n6_1r1w_d``words``_w``sram_bits``_``tag``_2hdrf                 \
      mem (                                                       \
       .QB(r_data_o)     \
      ,.ADRA(w_addr_i)   \
      ,.DA({{sram_bits-bits{1'b0}},w_data_i})     \
      ,.WEA(1'b1)       \
      ,.MEA(1'b1)       \
      ,.CLKA(clk_i)      \
      ,.TEST1A(1'b0)     \
      ,.TEST_RNMA(1'b0)  \
      ,.RMEA(1'b0)       \
      ,.RMA(4'b0)        \
      ,.LS(1'b0)         \
      ,.ADRB(r_addr_i)   \
      ,.MEB(r_v_i)       \
      ,.CLKB(clk_i)      \
      ,.TEST1B()         \
      ,.RMEB(1'b0)       \
      ,.RMB(4'b0)        \
    );                   \
  end

`define bsg_mem_1r1w_sync_banked_macro(words,bits,wbank,dbank) \
  if (harden_p && els_p == words && width_p == bits) begin: macro \
    bsg_mem_1r1w_sync_banked #(                                             \
      .width_p(width_p)                                                     \
      ,.els_p(els_p)                                                        \
      ,.read_write_same_addr_p(read_write_same_addr_p)                      \
      ,.num_width_bank_p(wbank)                                             \
      ,.num_depth_bank_p(dbank)                                             \
    ) bmem (                                                                \
      .clk_i(clk_i)                                                         \
      ,.reset_i(reset_i)                                                    \
      ,.w_v_i(w_v_i)                                                        \
      ,.w_addr_i(w_addr_i)                                                  \
      ,.w_data_i(w_data_i)                                                  \
      ,.r_v_i(r_v_i)                                                        \
      ,.r_addr_i(r_addr_i)                                                  \
      ,.r_data_o(r_data_o)                                                  \
    );                                                                      \
  end: macro

      
`endif

